class Podium {
  float x, y, w, h;
  
  Podium(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(){
    noStroke();
    fill(255);
    rect(x, y, w, h);
  }
}
