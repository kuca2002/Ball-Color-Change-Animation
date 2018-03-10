ArrayList<Circle> circles;
int ballWidth = 10;
int i = 0;
int check = 0;

void setup() {
  size(640, 640);
  background(20);
  noStroke();
  circles = new ArrayList<Circle>();
}

void draw() {
  background(20);
  println(i + "    " + check);
  if (i > check) {
      circles.add(new Circle(mouseX,mouseY,ballWidth));
      check = check + 20;
  }
  for (int i = circles.size() -1; i >= 0; i--) {
    Circle circle = circles.get(i);
    circle.wide();
    circle.display();
    if (circle.state()) {
      circles.remove(i);
    }
  }
  i++;
}

void mousePressed() {
  circles.add(new Circle(mouseX,mouseY,ballWidth));
}