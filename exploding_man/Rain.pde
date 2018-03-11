class Rain {
  float x; //xcoordinate
  float y; //ycoordinate
  int speed; 
  float w; //width
  float h; //height
  float t; //transperency
  
  Rain(int tx, int tspeed){
    x = tx;
    speed = tspeed;
    w = speed;
    h = w * 5;
    t = (speed-3)*30 + 105;
    y = 0 - h;
  }
  
  void display(){
    rectMode(CENTER);
    fill(0,0,255,t);
    rect(x,y,w,h);
  }
  
  void move(){
    y = y + speed;
  }
  
  boolean state(){
    if (y - h/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}