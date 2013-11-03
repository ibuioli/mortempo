public class Onda {
  float t, a, velocidad;
  int x, y, signo;
  color red, green, blue;

  Onda(color red_, color green_, color blue_, int signo_) {
    red = red_;
    green = green_;
    blue = blue_;
    
    signo = signo_;
  }

  public void ondaYa(int x_, int y_) {
    x = x_;
    y = y_;
    
    offscreen.pushMatrix();
    offscreen.pushStyle();
    
    offscreen.noStroke();
    offscreen.fill(red, green, blue);
    
    offscreen.translate(x, y);
    
    offscreen.beginShape();
    offscreen.vertex(0, 8);
    offscreen.bezierVertex(0, 8, 0, 8, 0, 8);
    offscreen.bezierVertex(0, 8, 17, 10+(signo*a)*4, 42, 10+(signo*a)*4);
    offscreen.bezierVertex(67, 10+(signo*a)*4, 88, 10, 88, 10);
    offscreen.bezierVertex(88, 10, 105, 10-(signo*a)*4, 131, 10-(signo*a)*4);
    offscreen.bezierVertex(157, 10-(signo*a)*4, 176, 10, 176, 10);
    offscreen.bezierVertex(176, 10, 198, 10+(signo*a)*4, 226, 10+(signo*a)*4);
    offscreen.bezierVertex(254, 10+(signo*a)*4, 250, 11, 250, 11);
    offscreen.bezierVertex(250, 11, 250, 28, 250, 28);
    offscreen.bezierVertex(250, 28, 0, 28, 0, 28);
    offscreen.endShape();
    offscreen.popStyle();
    offscreen.popMatrix();
    
    velocidad = abs(muerte - con);
    velocidad = map(velocidad, 0, 400, 0.09, 0.20);
    
    t+=velocidad;
    a = sin(t);
  }
}

