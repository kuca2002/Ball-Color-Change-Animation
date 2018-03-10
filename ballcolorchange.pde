float cellSize = 20;
float d = 1;
float rand = 1;
float red;
float green;
float blue;
int i = 0;
boolean random = true;

void setup() {
  size(640, 640);
  noStroke();
  smooth();
}

void draw() {

  //background
  i += 1;
  if (i == 5) {
    i = 0;
  }
  if (i == 0) {
    background(random(255), random(255), random(255));
  }

  //rand
  if (random) {
    rand += 10/rand;
  } else {
    rand -= 10/rand;
  }
  if (rand > 50) {
    random = false;
  } else if (rand < 0) {
    rand = 1;
    random = true;
  }
  println("r = " + rand + random);

  //rectangles
  for (int x = 0; x < width + cellSize; x += cellSize) {
    for (int y = 0; y < height + cellSize; y += cellSize) {
      fill(
        red - d * dist(x, y, mouseX, mouseY), 
        green - d * dist(x, y, mouseX, mouseY), 
        blue - d * dist(x, y, mouseX, mouseY)
        );
      rectMode(CENTER);
      noStroke();
      rect(x+random(rand/10), y+random(rand/10), cellSize, cellSize);
    }
  }

  //scroll
  if (d > 3) {
    d = 3;
  } else if (d < 0.2) {
    d = 0.2;
  }
  
  //color
  red = 255 * dist(mouseX,0,mouseX,mouseY)/height;
  green = 255 * dist(0,mouseY,mouseX,mouseY)/width;
  blue = 255 * dist(width/2,height/2,mouseX,mouseY)/(sqrt(sq(width/2)+sq(height/2)));
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  if (e > 0) {
    d += 0.05;
  } else if (e < 0) {
    d -= 0.05;
  }
}