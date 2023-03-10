/**
 * Objects
 * by hbarragan. 
 * 
 * Move the cursor across the image to change the speed and positions
 * of the geometry. The class MRect defines a group of lines.
 */
int size = 4;
MRect[] r = new MRect[size];
 
void setup()
{
  size(640, 360);
  fill(255, 204);
  noStroke();
  r[0] = new MRect(1, 134.0, 0.532, 0.1*height, 10.0, 60.0);
  r[1] = new MRect(2, 44.0, 0.166, 0.3*height, 5.0, 50.0);
  r[2] = new MRect(2, 58.0, 0.332, 0.4*height, 10.0, 35.0);
  r[3] = new MRect(1, 120.0, 0.0498, 0.9*height, 15.0, 60.0);
}
 
void draw()
{
  background(0);
  
  for(int i=0; i<size; i++) {
    r[i].display();
    if(i==0) {r[i].move(mouseX-(width/2), mouseY+(height*0.1), 30);}
    else if(i==1) {r[i].move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 20);}
    else if(i==2) {r[i].move(mouseX/4, mouseY-(height*0.025), 40);}
    else if(i==3) {r[i].move(mouseX-(width/2), (height-mouseY), 50);}
  }
 
}

void mouseClicked() {
  for(int i=0; i<size; i++) {
    r[i].update();
  }
}

class MRect 
{
  int w; // single bar width
  float xpos; // rect xposition
  float h; // rect height
  float ypos ; // rect yposition
  float d; // single bar distance
  float t; // number of bars
 
  MRect(int iw, float ixp, float ih, float iyp, float id, float it) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
    d = id;
    t = it;
  }
 
  void move (float posX, float posY, float damping) {
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
  }
 
  void display() {
    for (int i=0; i<t; i++) {
      fill(random(255), random(255), random(255));
      ellipse(xpos+(i*(d+w)), ypos, w, height*h);
    }
  }

  void update() {
    if(t>0) {t--;}
  }
}
