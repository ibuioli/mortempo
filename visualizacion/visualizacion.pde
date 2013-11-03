import TUIO.*;
import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface;

PGraphics offscreen;
PFont clare;
PImage mascara;
String[] textLines, textLanes;
String[][] datos = new String[214][214], emba = new String[214][214];
float vida, muerte, sin, con, sx = 1, sy = 1, 
fontx, fonty, fsx = 1, fsy = 1, maskx, masky, msx = 1, msy = 1;
int mx, my, indexanosm, indexpaisesm, indexanose, indexpaisese, anosm, anose; 

Gota gotita;
Onda azul, roja, verde, naranja;

public void setup() {
  size(550, 600, P3D);  //Version para Testeo
  //size(screen.width, screen.height, P3D); //FullScreen en 1.5.1
  //size(displayWidth, displayHeight, P3D); //FullScreen en 2+

  //Clases
  gotita = new Gota(280, 275);
  azul = new Onda(0, 150, 255, -1);
  roja = new Onda(255, 0, 80, 1);
  verde = new Onda(0, 250, 180, -1);
  naranja = new Onda(255, 110, 0, 1);

  //Cargar Datos
  textLines = loadStrings("bd.csv");
  textLanes = loadStrings("bd2.csv");

  //Cargar Fuente
  clare = loadFont("clare.vlw");
  
  //Cargar Máscara
  mascara = loadImage("mascara.png");

  for (int i = 0; i < textLines.length; i++) {
    String[] currentLine = split(textLines[i], ";");
    for (int j = 0; j < currentLine.length; j++) {
      datos[i][j] = currentLine[j];
    }
  }

  for (int i = 0; i < textLanes.length; i++) {
    String[] currentLine = split(textLanes[i], ";");
    for (int j = 0; j < currentLine.length; j++) {
      emba[i][j] = currentLine[j];
    }
  }

  /////////////////////CONEXION TUIO//////////////////////

  TuioProcessing tuioClient = new TuioProcessing(this);

  ////////////////////////MAPPING/////////////////////////

  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(width, height, 20);

  offscreen = createGraphics(width, height, P3D);

  noCursor();
}

/*FIN del bloque setup()*/

public void draw() {
  PVector surfaceMouse = surface.getTransformedMouse();

  ////////////////////////////////////////////////////

  muerte = float(datos[indexpaisesm][indexanosm+3]);

  if (Float.isNaN(muerte) == true) {
    muerte = 0;
  }

  vida = 1000 - muerte;

  con = float(emba[indexpaisese][indexanose+3]);

  if (Float.isNaN(con) == true) {
    con = 0;
  }

  sin = 1000 - con;

  ////////////////////////////////////////////////////

  offscreen.beginDraw();
  offscreen.background(0);
  offscreen.pushMatrix();
  offscreen.translate(mx, my);
  offscreen.scale(sx, sy);

  if (Float.isNaN(con) == false) {
    offscreen.pushMatrix();
    offscreen.translate(-70, 0);
    offscreen.pushStyle();
    offscreen.noStroke();
    offscreen.fill(0, 250, 180);
    verde.ondaYa(100, int((260-14)-(sin/5)));
    offscreen.rect(100, 260-(sin/5), 250, sin/5);

    offscreen.pushMatrix();
    offscreen.translate(0, 90);
    offscreen.fill(255, 110, 0);
    naranja.ondaYa(100, int((470-20)-(con/5)));
    offscreen.rect(100, 470-(con/5), 250, con/5);
    offscreen.popMatrix();

    offscreen.popStyle();
    offscreen.popMatrix();
  }
  if (Float.isNaN(muerte) == false) {
    offscreen.pushMatrix();
    offscreen.translate(180, 0);
    offscreen.pushStyle();
    offscreen.noStroke();
    offscreen.fill(0, 150, 255);
    azul.ondaYa(100, int((260-14)-(vida/5)));
    offscreen.rect(100, 260-(vida/5), 250, vida/5);

    offscreen.pushMatrix();
    offscreen.translate(0, 90);
    offscreen.fill(255, 0, 80);
    roja.ondaYa(100, int((470-20)-(muerte/5)));
    offscreen.rect(100, 470-(muerte/5), 250, muerte/5);
    offscreen.popMatrix();

    offscreen.popStyle();
    offscreen.popMatrix();

    gotita.gotaYa();
  }
  
  ///////////////////////////////Máscara
  offscreen.pushMatrix();
  offscreen.translate(maskx, masky);
  offscreen.scale(msx, msy);
  offscreen.image(mascara, 0, 50);
  offscreen.popMatrix();
  ///////////////////////////////

  //////////////////////////////Hack Visual
  offscreen.pushStyle();
  offscreen.noStroke();
  offscreen.fill(0);
  offscreen.rect(30, 555, 500, 40);
  offscreen.popStyle();
  //////////////////////////////

  //////////////FONT////////////
  offscreen.pushMatrix();
  offscreen.translate(fontx, fonty);
  offscreen.scale(fsx, fsy);
  offscreen.pushStyle();
  offscreen.textFont(clare, 30);
  offscreen.textAlign(CENTER);
  if (emba[indexpaisese][indexanose+1].equals(datos[indexpaisesm][indexanosm+1]) == true) {
    offscreen.fill(200);
    offscreen.text(emba[indexpaisese][indexanose+1], 30, -20, 500, 50);
  }
  else {
    offscreen.fill(0, 250, 180);
    offscreen.text(emba[indexpaisese][indexanose+1], 30, -20, 250, 50);
    offscreen.fill(0, 150, 255);
    offscreen.text(datos[indexpaisesm][indexanosm+1], 280, -20, 250, 50);
  }
  offscreen.textFont(clare, 24);
  if (anose == anosm) {
    offscreen.fill(200);
    offscreen.text(anosm, 280, 30);
  }
  else {
    offscreen.fill(0, 250, 180);
    offscreen.text(anose, 150, 30);
    offscreen.fill(0, 150, 255);
    offscreen.text(anosm, 400, 30);
  }
  offscreen.fill(255, 110, 0);
  offscreen.text("Emb. Precoz", 190, 590);
  offscreen.fill(255, 0, 80);
  offscreen.text("Muerte Inf.", 365, 590);
  offscreen.textSize(22);
  offscreen.fill(180);
  offscreen.text("por cada 1000 hab.", 285, 620);
  offscreen.popStyle();
  offscreen.popMatrix();
  //////////////////////////////

  offscreen.popMatrix();
  offscreen.endDraw();

  background(0);

  /////////////////////////////////////////////////////////////

  indexanosm = constrain(indexanosm, 0, 51);
  indexpaisesm = constrain(indexpaisesm, 0, 213);
  indexanose = constrain(indexanose, 0, 51);
  indexpaisese = constrain(indexpaisese, 0, 213);

  anosm = 1960 + indexanosm;
  anose = 1960 + indexanose;

  /////////////////////////////////////////////////////////////

  surface.render(offscreen);

  if (keyPressed == true) {
    if (key == 'q') {
      ayuda();  //Ayuda para la calibración
    }
  }
}

/*FIN del bloque draw()*/
