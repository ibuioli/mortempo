void flecha(int x, int y, int r) {
  pushMatrix();
  
  rotate(radians(r));
  translate(x, y);
  
  pushStyle();
  noStroke();
  fill(206, 10, 47, 240);
  beginShape();
  vertex(9, 0);
  vertex(19, 22);
  vertex(9, 17);
  endShape();

  fill(220, 78, 105, 240);
  beginShape();
  vertex(9, 0);
  vertex(0, 22);
  vertex(9, 17);
  endShape();
  popStyle();
  popMatrix();
}

