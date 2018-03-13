ArrayList<Rain> raindrops;
Fatman man;
Menu menu;
Animation circle;
int i = 0; //index
float check = 0;
float count;
boolean live = false;
boolean start = true;
boolean ending = false;
boolean prolouge = false;
float distance;
float danger;
float fwidth;
float fheight;
PFont raleway;



void setup() {
  size(640, 640);
  background(255);
  noStroke();
  raindrops = new ArrayList<Rain>();
  man = new Fatman();
  menu = new Menu();
  circle = new Animation(width/2, height/2 - 50);
  raleway = createFont("Raleway-Black", 40);
}

void draw() {
  //index stuff
  i++;

  distance = dist(width/2, height, mouseX, mouseY);
  danger = dist(width/2, height, 0, height);
  if (distance < danger) {
    count = pow(2, distance/200);
  } else {
    count = pow(2, danger/200);
  }
  //rain
  background(255);
  if (live) {
    if (i > check) {
      raindrops.add(new Rain(int(random(width)), int(random(4, 9))));
      check = check + count;
    }
  }

  for (int i = raindrops.size()-1; i >= 0; i--) {
    Rain drop = raindrops.get(i);
    drop.move();
    drop.display();
    //println(raindrops.size());
    if (drop.state()) {
      raindrops.remove(i);
      //println("removed");
    }
  }

  //fatman
  if (live) {
    if (distance < danger) {
      man.danger(distance);
    } else {
      man.normalo();
    }
  }
  if (live) {
    man.check();
  }
  if (man.explode) {
    man.explode();
  }

  //menu
  if (start) {
    menu.starting();
  } else if (ending) {
    menu.end();
  } else if (prolouge) {
    menu.prolouge();
  }
  
}

void mousePressed() {
  live = true;
}