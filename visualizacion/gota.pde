public class Gota {
  PImage gota;
  int x, mx, my, t, dire;
  float d, y, velocidad;
  color red, green, blue;

  Gota(int x_, int y_) {
    gota = loadImage("gota.png");

    mx = x_;
    my = y_;
    d = 5;
    dire = 1;

    red = 0;
    green = 150;
    blue = 255;
  }

  public void gotaYa() {
    offscreen.pushStyle();
    offscreen.tint(red, green, blue);

    offscreen.imageMode(CENTER);
    offscreen.pushMatrix();
    offscreen.translate(mx, my);
    offscreen.image(gota, x, y, gota.width/d, gota.height/d);
    offscreen.popMatrix();
    offscreen.popStyle();
    
    velocidad = abs(muerte - con);
    velocidad = map(velocidad, 0, 400, 0.8, 10);

    y+=velocidad;

    d-=(velocidad/20)*dire;

    if (d < 2) {
      dire = -1;
    }

    if (y > 210) {
      y = 0;
      d=5;
      dire = 1;
    }

    red = (color)map(y, 0, 160, 0, 255);
    green = (color)map(y, 0, 160, 150, 0);
    blue = (color)map(y, 0, 160, 255, 80);
  }
}

