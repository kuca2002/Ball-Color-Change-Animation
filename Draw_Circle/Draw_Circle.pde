int diam=100;
int x;
int y;

void setup() {
  size(640, 640);
  background(40, 200, 50);
  //noFill();
  noStroke();
  //translate(width/2,height/2);
}

void draw() {
  //println(frameCount);
  x = width/2;
  y = height/2;
  fill(0);
  ellipse(x, y, diam, diam);
  if ( frameCount <= 50) {
    fill(40, 200, 50);
    beginShape();
    vertex(x,y);
    vertex(0,height/2);
    vertex(width/2 - diam*cos(PI/(100.0/frameCount)), height/2 - diam*sin(PI/(100.0/frameCount)));
    endShape();
  } else if ( frameCount > 50 && frameCount <= 100) {
    fill(40, 200, 50);
    beginShape();
    vertex(x,y);
    vertex(0,height/2);
    vertex(width/2,0);
    vertex(width/2 - diam*cos((frameCount/100.0)*PI), height/2 - diam*sin((frameCount/100.0)*PI));
    endShape();
  } else if (frameCount > 100 && frameCount <= 150){
    fill(40, 200, 50);
    rect(0,0,width,height/2);
    beginShape();
    vertex(x,y);
    vertex(width,height/2);
    vertex(x - diam*cos((frameCount/100.0)*PI), y - diam*sin((frameCount/100.0)*PI));
    endShape();
  } else if (frameCount > 150 && frameCount <= 200) {
    fill(40, 200, 50);
    rect(0,0,width,height/2);
    beginShape();
    vertex(x,y);
    vertex(width,height/2);
    vertex(x,height);
    vertex(x - diam*cos((frameCount/100.0)*PI), y - diam*sin((frameCount/100.0)*PI));
    endShape();
  } else if ( frameCount > 200) {
    background(40, 200, 50);
  }
}