class Menu {
  float x = width/2;
  float y = height/2 - 50;
  float h = 70;
  float w = h*2;
  float dist = dist(x, y, 0, 0);
  float background;
  void starting() {
    background = 255 * (dist(x, y, mouseX, mouseY)/dist);
    background(background);
    fill(20);
    rectMode(CENTER);
    rect(x, y, w, h);
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      fill(255);
      rect(x, y, w, h);
      fill(background);
      textFont(raleway);
      text("START", x - w/2 + 5, y + 15);
    }
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2 && mousePressed == true) {
      start = false;
      live = true;
    }
  }

  void end() {
  }
}