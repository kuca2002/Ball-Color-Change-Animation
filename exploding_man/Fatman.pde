class Fatman {
  float red;
  float c = 1.2;
  float pc = 1;
  float change;
  int exp1 = 0;
  int exp2 = 0;
  int exp3 = 0;
  int expc = 5;
  float end = dist(width/2, height, 0, 0);
  boolean end1 = true;
  boolean explode = false;
  void normalo() {
    noStroke();
    fill(0);
    ellipse(width/2, height, 100, 70);
    ellipse(width/2, height - 50, 50, 50);
    exp1 = 0;
    exp2 = 0;
    exp3 = 0;
  }

  void danger(float dist) {
    c = 1 * pc / abs(pc);
    red = 255*((danger-dist)/danger);
    fill(red, 0, 0);
    //c = int(height - mouseY);
    //change = 5*sin(10*index*PI/c);
    c = c * sq(mouseY/320.0);
    change += c;
    if (change > 5) {
      c *= -1;
    } else if (change < -5) {
      c *= -1;
    }
    pc = c;
    ellipse(width/2, height, 100+change, 70+change);
    ellipse(width/2, height - 50, 50+change, 50+change);
    //println("c = " + c + "  change = " + change + " mouseY = " + mouseY/320.0);
  }

  void check() {
    if (dist(width/2, height - 50, mouseX, mouseY) < 25 || dist(width/2, height - 50, mouseX, mouseY) < 35) {
      explode = true;
      live = false;
    }
  }

  void explode() {
    if (end1) {
      fill(234, 43, 31);
      ellipse(width/2, height, 100+exp1, 70+exp1);
      ellipse(width/2, height - 50, 50+exp1, 50+exp1);
      exp1 += expc;
    }
    if (exp1 > 300 && exp1 < end*5 && end1) {
      exp2 += expc -1;
      fill(237, 174, 73);
      ellipse(width/2, height, 75+exp2, 70+exp2);
    }
    if (exp2 > 200 && exp2 < 2620 && end1) {
      exp3 +=expc -2;
      fill(249, 223, 116);
      ellipse(width/2, height, 50+exp3, 70+exp3);
    }
    if (exp3 == 1812) {
      expc = 0;
      end1 = false;
      ellipse(width/2, height, 50+exp3, 70+exp3);
      explode = false;
      ending = true;
    }
    //println(exp1 + " " + exp2 + " " + exp3);
  }
}