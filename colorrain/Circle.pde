class Circle {
  float x; //x-coordinate
  float y; //y-coordinate
  float w; //width
  float t = 255; //transparancy
  float red;
  float green;
  float blue;
  float ogreen;
  float ored;


  Circle(float tx, float ty, float tw) {
    x = tx;
    y = ty;
    w = tw;
    blue = 255;
    ogreen = random(125);
      ored = random(125);
  }

  void wide() {
    w = 10 + 100*(255-t)/255;
    blue = 255 - t;
    green = ogreen*(t/255);
    red = ored*(t/255);
    if (red < 0) {
      red = 0;
    } else if (green < 0) {
      green = 0;
    }
  }

  void display() {
    
    fill(red, green, blue, t);
    noStroke();
    ellipse(x, y, w, w);
  }

  boolean state() {
    t--;
    if (t < 0) {
      return true;
    } else {
      return false;
    }
  }
}