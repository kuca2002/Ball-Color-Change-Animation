class Menu {
  float x = width/2;
  float y = height/2 - 50;
  float h = 70;
  float w = h*2;
  float dist = dist(x, y, 0, 0);
  float background;
  boolean overlap = false;
  int index = 0;
  int check = 50;
  int numLines = 10;
  int state = 4;
  float diam = 5;
  boolean drawing = true;
  boolean startend = false;
  //int[] colors = new int[3];

  void starting() {
    background = map(dist(x, y, mouseX, mouseY), dist(x, y, x-h/2, y-w/2), dist(x, y, width, height), 20, 255);//255 * (dist(x, y, mouseX, mouseY)/dist);
    background(background);

    noStroke();
    fill(0); 
    rectMode(CENTER); 
    rect(x, y, w, h); 
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      fill(255);
      background(0);
      rect(x, y, w, h); 
      fill(0); 
      textFont(raleway); 
      text("START", x - w/2 + 5, y + 15);
      overlap = true;
    } else {
      overlap = false;
    }

    //stripes
    if (!overlap) {
      int[] colors = {int(random(255)), int(random(255)), int(random(255))};

      for (float i = 0; i <= width; i += width/numLines) {
        strokeWeight(1);
        stroke(colors[0], colors[1], colors[2]);
        line(i, 0, x - w/2 + (i/(width/numLines))*(w/numLines), y - h/2);
        line(i, height, x - w/2 + (i/(width/numLines))*(w/numLines), y + h/2);
        //println("runnin");
        line(x-h, y-h/2, x+h, y-h/2);
      }
    }

    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2 && mousePressed == true) {
      start = false; 
      //prolouge = true;
      prostart = true;
    }
  }

  void end() {
  }

  void prolouge() {
    if (state == 0) {
      prolouge = false;
      prostart = true;
    }
    background(0);
    fill(255);
    rect(x, y, w, h);
    if (drawing) {
      circle.drawCircle();
    } else if (!drawing) {
      fill(0);
      textFont(raleway); 
      text(state, x - 15, y + 10);
      index++;
    }
    if (index == 20) {
      drawing = true;
    }
    if (startend) {
    }
  }
}