class Onda {
  float t, a;
  int x, y, signo;
  color red, green, blue;

  Onda(color red_, color green_, color blue_, int signo_) {
    red = red_;
    green = green_;
    blue = blue_;
    
    signo = signo_;
  }

  void ondaYa(int x_, int y_) {
    x = x_;
    y = y_;
    
    pushMatrix();
    pushStyle();
    
    noStroke();
    fill(red, green, blue);
    
    translate(x, y);
    
    beginShape();
    vertex(0, 8);
    bezierVertex(0, 8, 0, 8, 0, 8);
    bezierVertex(0, 8, 17, 10+(signo*a)*4, 42, 10+(signo*a)*4);
    bezierVertex(67, 10+(signo*a)*4, 88, 10, 88, 10);
    bezierVertex(88, 10, 105, 10-(signo*a)*4, 131, 10-(signo*a)*4);
    bezierVertex(157, 10-(signo*a)*4, 176, 10, 176, 10);
    bezierVertex(176, 10, 198, 10+(signo*a)*4, 226, 10+(signo*a)*4);
    bezierVertex(254, 10+(signo*a)*4, 250, 11, 250, 11);
    bezierVertex(250, 11, 250, 28, 250, 28);
    bezierVertex(250, 28, 0, 28, 0, 28);
    endShape();
    popStyle();
    popMatrix();

    t+=0.15;
    a = sin(t);
  }
}

