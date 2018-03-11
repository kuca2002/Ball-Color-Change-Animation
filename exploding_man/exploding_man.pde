ArrayList<Rain> raindrops;
Fatman man;
int i = 0; //index
float check = 0;
float count;
boolean live = true;
float distance;
float danger;
float fwidth;
float fheight;


void setup() {
  size(640, 640);
  background(255);
  noStroke();
  raindrops = new ArrayList<Rain>();
  man = new Fatman();
}

void draw() {
  //index stuff
  i++;
  
  distance = dist(width/2, height, mouseX, mouseY);
  danger = dist(width/2, height, 0, height);
  if (distance < danger) {
    count = pow(2,distance/200);
  } else {
    count = pow(2,danger/200);
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
  if (man.check()){
    live = false;
  }
  if (!live){
    man.explode();
  }
}

void mousePressed() {
  live = true;
}