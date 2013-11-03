public void keyPressed() {  //Detectar Tecla Presionada
  switch(key) {
  case 'a':
    sx -= 0.1;
    break;
  case 'd':
    sx += 0.1;
    break;
  case 'w':
    sy -= 0.1;
    break;
  case 's':
    sy += 0.1;
    break;

  case 'j':
    fsx -= 0.1;
    break;
  case 'l':
    fsx += 0.1;
    break;
  case 'i':
    fsy -= 0.1;
    break;
  case 'k':
    fsy += 0.1;
    break;
  case 'y':
    fontx -= 1;
    break;
  case 'u':
    fontx += 1;
    break;
  case 'g':
    fonty -= 1;
    break;
  case 'h':
    fonty += 1;
    break;

  case '1':
    msx -= 0.1;
    break;
  case '2':
    msx += 0.1;
    break;
  case '3':
    msy -= 0.1;
    break;
  case '4':
    msy += 0.1;
    break;
  case '5':
    maskx -= 1;
    break;
  case '6':
    maskx += 1;
    break;
  case '7':
    masky -= 1;
    break;
  case '8':
    masky += 1;
    break;

  case 'm':
    cursor();
    break;
  case 'n':
    noCursor();
    break;
  case 'c':
    ks.toggleCalibration();
    break;
  case 'o':
    ks.load();
    break;
  case 'p':
    ks.save();
    break;
  }

  switch(keyCode) {
  case UP:
    my -= 3;
    break;
  case DOWN:
    my += 3;
    break;
  case RIGHT:
    mx += 3;
    break;
  case LEFT:
    mx -= 3;
    break;
  }
}

public void updateTuioObject (TuioObject tobj) {
  if (tobj.getSymbolID() == 0) {
    indexanosm = (int)map(tobj.getX(), 0.06, 0.9, 0, 51);
  }
  else if (tobj.getSymbolID() == 1) {
    indexpaisesm = (int)map(tobj.getX(), 0.06, 0.9, 0, 213);
  }

  if (tobj.getSymbolID() == 2) {
    indexanose = (int)map(tobj.getX(), 0.06, 0.9, 0, 51);
  }
  else if (tobj.getSymbolID() == 3) {
    indexpaisese = (int)map(tobj.getX(), 0.06, 0.9, 0, 213);
  }

  if (tobj.getSymbolID() == 4) {
    indexanosm = floor(map(tobj.getAngle(), 0, 6, 0, 51));
    indexanose = floor(map(tobj.getAngle(), 0, 6, 0, 51));
  }
  else if (tobj.getSymbolID() == 5) {
    indexpaisesm = floor(map(tobj.getAngle(), 0, 6, 0, 213));
    indexpaisese = floor(map(tobj.getAngle(), 0, 6, 0, 213));
  }

  ///////////////////////////////////////////////HACK INDEX
  indexanosm = constrain(indexanosm, 0, 51);
  indexpaisesm = constrain(indexpaisesm, 0, 213);
  indexanose = constrain(indexanose, 0, 51);
  indexpaisese = constrain(indexpaisese, 0, 213);
}

public void refresh(TuioTime bundleTime) {
  ///////////////////////////////////////////////HACK INDEX
  indexanosm = constrain(indexanosm, 0, 51);
  indexpaisesm = constrain(indexpaisesm, 0, 213);
  indexanose = constrain(indexanose, 0, 51);
  indexpaisese = constrain(indexpaisese, 0, 213);
}

