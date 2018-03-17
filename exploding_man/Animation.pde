class Animation {
  float x;
  float y;
  float diam = 50;  
  float rad = diam/2;
  float index = 350; //should be 0
  int red;
  int green;
  int blue;
  int check = 0;
  float trans;
  float manY = height/2-40;

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
      vertex(x - menu.w/2, y);
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
      vertex(x - menu.w/2, y);
      vertex(x - menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y - menu.h/2);
      vertex(x + menu.w/2, y + menu.h/2);      
      vertex(x, y + menu.h/2);
      vertex(x, y);
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
      rect(x, y, menu.w, menu.h);
    }
    index += 4;
  }

  void prostart() {
    if (index > check) {
      red = int(random(255));
      green = int(random(255));
      blue = int(random(255)); 
      check += 20;
    }
    x = 20;
    background(red, green, blue);
    for (int sx = 0; sx < width+x; sx += x) {
      for (int sy = 0; sy < height+x; sy += x) {
        noStroke();
        //float rx = map(dist(sx,0,width/2,0),0,width/2,0,0);
        //float ry = map(dist(sy,0,height/2,0),0,height/2,0.1,0);
        float r = map(dist(sx, sy, width/2, height/2), 0, dist(0, 0, width/2, height/2), 7, -1);
        rectMode(CENTER);
        fill(0);
        rect(sx, sy, x-r, x-r);
        //println(sx);
      }
    }
    stroke(255);
    int x1 = width/2-40;
    int x2 = width/2+40;
    int yline = height/2;    
    for (int i = 0; i < width; i += 20) {
      float xline1 = 2.5*(i/20);
      float xline2 = 2.5*((i+20)/20);      
      fill(0, 150);
      beginShape();
      vertex(i+20, height);
      vertex(i, height);
      vertex(xline1+width/2-40, yline);
      vertex(xline2+width/2-40, yline);
      endShape();
      line(x2, yline, width, height);
      line(x1, yline, 0, height);
      line(x1, yline, x2, yline);
    }
    //door  
    trans = 255;
    if (index >= 200 && index <= 300) {
      float percent = (100-(index - 200))/100;
      trans = percent * 255;
    } else if (index > 300) {
      trans = 0;
    }
    rectMode(CORNERS);
    fill(0);
    noStroke();
    rect(x1-5, yline-105, x2+5, yline);

    fill(red, green, blue);
    noStroke();
    rect(x1+5, yline-95, x2-5, yline);

    fill(0, trans);
    stroke(255);
    rect(x1+5, yline-95, x2-5, yline);

    if (index > 200) {
      starting.man();
    }


    index ++;
  }  

  void man() {    
    if (index > 350 && index < 650) {
      manY += 0.2;
    }
    float r = map(dist(width/2, manY, width/2, height/2-40), 0, dist(width/2, height/2-40, width/2, height), 40, width);

    noStroke();
    fill(255-red, 255-green, 255-blue, 255 - trans);
    ellipseMode(CENTER);
    ellipse(width/2, manY, r, r);
    fill(124,2,0, 255 -trans);
    //mouth
    beginShape();
    vertex(width/2-r/3, manY+r/8);
    bezierVertex(width/2-r/3, manY+r/8, width/2, manY+r/4+r/8, width/2+r/3, manY+r/8);
    bezierVertex(width/2+r/3, manY+r/8, width/2, manY+r/2+r/8, width/2-r/3, manY+r/8);
    endShape();
    //eyes
    beginShape();
    vertex(width/2-5*r/16,manY-r/6);
    bezierVertex(width/2-5*r/16,manY-r/6,width/2-r/6,manY+r/6,width/2-r/16,manY-r/16);
    endShape();
    beginShape();
    vertex(width/2+5*r/16,manY-r/6);
    bezierVertex(width/2+5*r/16,manY-r/6,width/2+r/6,manY+r/6,width/2+r/16,manY-r/16);
    endShape();
    
    fill(0);
    ellipse(width/2-2*r/13,manY-r/20,r/14,r/14);
    ellipse(width/2+2*r/13,manY-r/20,r/14,r/14);
    //stroke(20);
    //line(width/2-5*r/16,manY-r/4,width/2-r/16,manY-r/16);
  }
}