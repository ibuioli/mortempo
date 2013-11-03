PImage fondo, mesk, reloj;
PFont fuente;

int indexanos, indexpaises;
String[] textLines;
String[] textLanes;
String[][] datos = new String[214][214];
String[][] emba = new String[214][214];
float vida, muerte, sin, con;

Gota gotita;
Onda azul, roja, verde, naranja;

void setup() {
  size(700, 600);

  //Clases
  gotita = new Gota(225, 290);
  azul = new Onda(0, 150, 255, -1);
  roja = new Onda(255, 0, 80, 1);
  verde = new Onda(0, 250, 180, -1);
  naranja = new Onda(255, 110, 0, 1);

  //Imágenes
  fondo = loadImage("fondo.png");
  mesk = loadImage("mesk.png");
  reloj = loadImage("reloj.png");

  //Fuente
  fuente = loadFont("clare.vlw");
  textFont(fuente);

  //Cargar Datos
  textLines = loadStrings("bd.csv");
  textLanes = loadStrings("bd2.csv");

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
}

void draw() {
  background(fondo);

  muerte = float(datos[indexpaises][indexanos+3]);
  vida = 1000 - muerte;

  con = float(emba[indexpaises][indexanos+3]);
  sin = 1000 - con;

  if (Float.isNaN(con) == false) {
    pushMatrix();
    scale(0.5);
    translate(100, 280);
    pushStyle();
    noStroke();
    fill(0, 250, 180);
    verde.ondaYa(100, int((260-14)-(sin/3)));
    rect(100, 260-(sin/3), reloj.width-3, sin/3);

    pushMatrix();
    translate(0, 190);
    fill(255, 110, 0);
    naranja.ondaYa(100, int((470-14)-(con/3)));
    rect(100, 470-(con/3), reloj.width-3, con/3);
    popMatrix();

    popStyle();
    popMatrix();

    pushStyle();
    noStroke();
    fill(0, 250, 180);
    rect(200, 270, 80, 30);
    popStyle();
  }
  if (Float.isNaN(muerte) == false) {
    pushMatrix();
    scale(0.5);
    translate(350, 280);
    pushStyle();
    noStroke();
    fill(0, 150, 255);
    azul.ondaYa(100, int((260-14)-(vida/3)));
    rect(100, 260-(vida/3), reloj.width, vida/3);

    pushMatrix();
    translate(0, 190);
    fill(255, 0, 80);
    roja.ondaYa(100, int((470-14)-(muerte/3)));
    rect(100, 470-(muerte/3), reloj.width, muerte/3);
    popMatrix();

    popStyle();
    popMatrix();

    pushStyle();
    noStroke();
    fill(0, 150, 255);
    rect(200, 270, 80, 30);
    popStyle();

    gotita.gotaYa();
  }

  image(reloj, 100, 66);

  /////////////////////////////////////////////////////////

  pushStyle();
  fill(10, 200);
  textSize(18);
  textAlign(RIGHT);
  text(datos[indexpaises][2], width-31, height/2-2);
  text(abs(indexanos)+1960, width/2+10, height-30);
  fill(10, 140);
  text(abs(indexanos)+1959, width/2-48, height-30);
  text(abs(indexanos)+1958, width/2-108, height-30);
  text(abs(indexanos)+1957, width/2-168, height-30);
  text(abs(indexanos)+1956, width/2-228, height-30);
  text(abs(indexanos)+1955, width/2-288, height-30);
  text(abs(indexanos)+1961, width/2+70, height-30);
  text(abs(indexanos)+1962, width/2+130, height-30);
  text(abs(indexanos)+1963, width/2+190, height-30);
  text(abs(indexanos)+1964, width/2+250, height-30);
  text(abs(indexanos)+1965, width/2+310, height-30);
  text(".......", width/2+355, height-30);
  textAlign(LEFT);
  fill(5, 220);
  textSize(26);
  text(datos[indexpaises][1], width-340, 180, 250, 60);
  if (Float.isNaN(muerte) == false) {
    textAlign(RIGHT);
    textSize(34);
    text(nf(float(datos[indexpaises][indexanos+3]), 3, 2), width-480, 260, 260, 300);
    textAlign(LEFT);
    fill(5, 180);
    textSize(18);
    text("muertes", width-215, 280);
    text("de cada 1000 nacimientos", width-340, 300);
  }
  else {
    textSize(22);
    text("Sin Datos", width-340, 260, 260, 300);
  }
  if (Float.isNaN(con) == false) {
    fill(5, 220);
    textAlign(RIGHT);
    textSize(34);
    text(nf(float(emba[indexpaises][indexanos+3]), 3, 2), width-480, 340, 260, 300);
    textAlign(LEFT);
    fill(5, 180);
    textSize(18);
    text("embarazos", width-215, 360);
    text("de cada 1000 nacimientos", width-340, 380);
  }
  else {
    textSize(22);
    text("Sin Datos", width-340, 340, 260, 300);
  }
  popStyle();

  flecha(width/2-22, height-25, 0);
  flecha(width/2-width+50, height/2+372, -90);

  pushStyle();
  strokeCap(SQUARE);
  stroke(62, 53, 48, 200);
  strokeWeight(3);
  line(615, 0, 615, height-52);
  line(0, height-51, width, height-51);
  strokeWeight(1);
  line(619, 0, 619, height-52);
  line(0, height-47, width, height-47);
  popStyle();

  blend(mesk, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
}

