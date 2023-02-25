interface GridPos {
  // Get coordinates.
  int[] getXY ();
  int getX ();
  int getY ();
  // Get grid positions. 
  int[] getGXY ();
  int getGX ();
  int getGY ();
  // Set grid positions. 
  void setGXY (int gX, int gY);
  void setGX (int gX);
  void setGY (int gY);
}


public class GridPosition implements GridPos {
  // Screen size (720, 480)
  private final int gridSize = 30;
  private int gX, gY;
  
  public GridPosition (int gX, int gY) {
    this.gX = gX;
    this.gY = gY;
  }
  
  public int[] getXY () {
    int[] XY = {gX * gridSize, gY * gridSize};
    return XY;
  }
  public int getX () {return gX * gridSize;}
  public int getY () {return gY * gridSize;}
  public int[] getGXY () {
    int[] gXY = {gX, gY};
    return gXY;
  }
  public int getGX () {return gX;}
  public int getGY () {return gY;}

  public void setGXY (int gX, int gY) {
    this.gX = gX;
    this.gY = gY;
  }
  public void setGX (int gX) {this.gX = gX;}
  public void setGY (int gY) {this.gY = gY;}

  public String toString () {
    return "(" + gX + ", " + gY + ")";
  }
}

enum Direction {
  UP, DOWN, LEFT, RIGHT
}
