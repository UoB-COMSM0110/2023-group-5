abstract class Sprite {
  private  PVector position;
  
  PVector getPosition() {
    return position;
  }
  
  abstract void draw();
}
