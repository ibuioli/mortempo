class Gota {
  PImage gota;
  int x, y, mx, my, t, dire;
  float d;
  float red, green, blue;

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

  void gotaYa() {
    pushStyle();
    tint(red, green, blue);

    imageMode(CENTER);
    pushMatrix();
    translate(mx, my);
    image(gota, x, y, gota.width/d, gota.height/d);
    popMatrix();
    popStyle();

    y+=5;

    d-=0.2*dire;

    if (d < 2) {
      dire = -1;
    }

    if (y > 180) {
      y = 0;
      d=5;
      dire = 1;
    }

    red = map(y, 0, 160, 0, 255);
    green = map(y, 0, 160, 150, 0);
    blue = map(y, 0, 160, 255, 80);
  }
}

