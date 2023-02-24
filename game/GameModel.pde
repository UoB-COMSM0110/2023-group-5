interface GameModel {
  int[] getSize ();
  boolean getGamePaused ();
  boolean setGamePaused (boolean gamePaused);
  int getScore ();
  PVector getApplePos ();
  ArrayList<PVector> getSnakePos ();
  void update (Direction dir);
  void reset ();
}

class Snake {
  private Direction direction;
  private int length;
  private ArrayList<PVector> positions;

  public static void Snake (int x, int y, Direction direction) {
    direction = Direction.UP;
    length = 2;

    positions = new ArrayList<>();
    PVector head = new PVector(x, y);
    positions.add(head);
    this.next();
  }

  public void getPositions () {
    return positions;
  }

  public void setDirection (Direction direction) {
    this.direction = direction;
  }

  public void grow () {
    length++;
  }

  public void next () {
    PVector lastPos = positions.get(0);
    if (direction == Direction.UP) {
      PVector head = new PVector(lastPos.x, lastPos.y - 1);
      positions.add(head);
    } else if (direction == Direction.DOWN) {
      PVector head = new PVector(lastPos.x, lastPos.y + 1);
      positions.add(head);
    } else if (direction == Direction.LEFT) {
      PVector head = new PVector(lastPos.x - 1, lastPos.y);
      positions.add(head);
    } else if (direction == Direction.RIGHT) {
      PVector head = new PVector(lastPos.x + 1, lastPos.y);
      positions.add(head);
    }
    while (positions.size() > length) {
      positions.remove(positions.size() - 1);
    }
  }
}

class Model implements GameModel {
  private PVector size;
  private boolean gamePaused;
  private boolean gameEnded;
  private int score;
  private Snake snake;
  private PVector apple;

  public static void GameModel (int x, int y) {
    size = new PVector(x, y);
    gamePaused = true;
    gameEnded = false;
    score = 0;
    snake = new Snake();
    apple = new PVector (random(0, size.x), random(0, size.y));
  }
  
  public int[] getSize () {return size;}

  public boolean getGamePaused () {return gamePaused;}

  public boolean setGamePaused (boolean gamePaused) {this.gamePaused = gamePaused;}

  public boolean getGameEnded () {return gameEnded;}

  public int getScore () {return score;}
  
  PVector getApplePos () {return apple.copy();}
  
  ArrayList<PVector> getSnakePos () {}
  
  void update (Direction dir) {}

  void reset () {}
}
