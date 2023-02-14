/**
 * Inheritance
 * 
 * A class can be defined using another class as a foundation. In object-oriented
 * programming terminology, one class can inherit fi elds and methods from another. 
 * An object that inherits from another is called a subclass, and the object it 
 * inherits from is called a superclass. A subclass extends the superclass.
 */

SpinSpots spots;
SpinArm arm;
ColourRect cRect;
BounceRect bRect;

void setup() {
  size(640, 360);
  arm = new SpinArm(width/2, height/2, 0.01);
  spots = new SpinSpots(width/2, height/2, -0.02, 90.0);
  cRect = new ColourRect((width/2) - 60, height-90, 0.01);
  bRect = new BounceRect((width/2) + 60, height-90, 2);
}

void draw() {
  background(204);
  arm.update();
  arm.display();
  spots.update();
  spots.display();
  cRect.update();
  cRect.display();
  bRect.update();
  bRect.display();
}

class Spin {
  float x, y, speed;
  float angle = 0.0;
  Spin(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
  }
  void update() {
    angle += (speed *= 0.999);
  }
}

class Bounce {
  float x, y0, h, y, speed;
  float angle = 0.0;
  Bounce(float xpos, float ypos, float s) {
    x = xpos;
    y0 = ypos;
    speed = s;
  }
  void update() {
    h = (h + speed) % (10 * speed);
    y = y0 - h;
  }
}

class SpinArm extends Spin {
  SpinArm(float x, float y, float s) {
    super(x, y, s);
  }
  void display() {
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    line(0, 0, 165, 0);
    popMatrix();
  }
}

class SpinSpots extends Spin {
  float dim;
  SpinSpots(float x, float y, float s, float d) {
    super(x, y, s);
    dim = d;
  }
  void display() {
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    ellipse(-dim/2, 0, dim, dim);
    ellipse(dim/2, 0, dim, dim);
    popMatrix();
  }
}

class ColourRect extends Spin {
  float clr = 0;
  
  ColourRect (float x, float y, float s) {
    super(x, y, s);
  }
  
  void display() {
    int temp = g.fillColor;
    clr = (angle % (3.15)) * 255 / 3.15;
    fill(clr, (clr + 100) % 255, (clr + 200) % 255);
    rect(x, y, 120, 90);
    fill(temp);
  }
}

class BounceRect extends Bounce {
  BounceRect (float x, float y, float s) {
    super(x, y, s);
  }
  
  void display() {
    rect(x, y, 120, 90);
  }
}
