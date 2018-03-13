class Animation{
  float x;
  float y;
  float diam = 50;  
  float rad = diam/2;
  float index = 0;
  
  Animation(float tx, float ty) {
    x = tx;
    y = ty;
  }
  
  
  void drawCircle() {
    fill(0);
    ellipse(x, y, diam, diam);
    if ( index <= 50) {
      fill(255);
      beginShape();
      vertex(x, y);
      vertex(x - menu.w/2, y);
      vertex(x - menu.w/2, y - menu.h/2);
      //vertex(x,y-menu.h/2);
      vertex(x - rad*cos(PI/(100.0/index)), y - rad*sin(PI/(100.0/index)));
      endShape();
    } else if ( index > 50 && index <= 100) {      
      fill(255);   
      beginShape();
      vertex(x, y);
      vertex(x - menu.w/2, y);
      vertex(x - menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y - menu.h/2);
      vertex(x - rad*cos((index/100.0)*PI), y - rad*sin((index/100.0)*PI));
      endShape();
    } else if (index > 100 && index <= 150) {
      fill(255);
      beginShape();
      vertex(x - menu.w/2,y);
      vertex(x - menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y);
      endShape();
      beginShape();
      vertex(x, y);
      vertex(x + menu.w/2, y);
      vertex(x + menu.w/2, y + menu.h/2);
      vertex(x - rad*cos((index/100.0)*PI), y - rad*sin((index/100.0)*PI));
      endShape();
    } else if (index > 150 && index <= 200) {
      fill(255);
      beginShape();
      vertex(x - menu.w/2,y);
      vertex(x - menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y + menu.h/2);      
      vertex(x, y + menu.h/2);
      vertex(x,y);
      endShape();
      beginShape();
      vertex(x, y);
      vertex(x, y + menu.h/2);
      vertex(x - menu.w/2, y + menu.h/2);
      vertex(x - rad*cos((index/100.0)*PI), y - rad*sin((index/100.0)*PI));
      endShape();
    } else if ( index > 200) {
      index = 0;
      menu.drawing = false;
      menu.index = 0;
      menu.state --;
      rectMode(CENTER);
      fill(255);
      rect(x,y,menu.w,menu.h);
    }
    index += 4;
  }
}