interface Model {
  GridPosition getSize ();
  boolean getGamePaused ();
  void setGamePaused ();
  void resetGamePaused ();
  boolean getGameEnded ();
  int getScore ();
  GridPosition getApplePos ();
  ArrayList<GridPosition> getSnakePos ();
  void update (Direction direction);
  void reset ();
}

public class Snake {
  private ArrayList<GridPosition> positions;
  private int length;
  private Direction direction;

  public Snake (int x, int y, Direction direction) {
    positions = new ArrayList<>();
    if (direction != null) {
      this.direction = direction;
    } else {
      this.direction = Direction.UP;
    }
    length = 5;

    GridPosition head = new GridPosition(x, y);
    positions.add(head);
    while (positions.size() < length) {this.next();}
  }

  public ArrayList<GridPosition> getPositions () {
    return positions;
  }

  public void setDirection (Direction direction) {
    if (direction != null) {this.direction = direction;}
  }

  public void grow () {
    length++;
  }

  public void next () {
    GridPosition head = positions.get(0);
    switch (direction) {
      case UP:
        positions.add(0, new GridPosition(head.getGX(), head.getGY() - 1));
        break;
      case DOWN:
        positions.add(0, new GridPosition(head.getGX(), head.getGY() + 1));
        break;
      case LEFT:
        positions.add(0, new GridPosition(head.getGX() - 1, head.getGY()));
        break;
      case RIGHT:
        positions.add(0, new GridPosition(head.getGX() + 1, head.getGY()));
        break;
      default: break;
    }
    while (positions.size() > length) {
      positions.remove(positions.size() - 1);
    }
  }
}

public class GameModel implements Model {
  private final GridPosition size;
  private boolean gamePaused;
  private boolean gameEnded;
  private int score;
  private Snake snake;
  private GridPosition apple;

  public GameModel (int sizeX, int sizeY) {
    size = new GridPosition(sizeX, sizeY);
    gamePaused = true;
    gameEnded = false;
    score = 0;
    snake = new Snake(size.getGX() / 2, size.getGY() / 2, Direction.UP);
    this.newApple();
  }
  
  public GridPosition getSize () {return size;}

  public boolean getGamePaused () {return gamePaused;}

  public void setGamePaused () {gamePaused = true;}

  public void resetGamePaused () {gamePaused = false;}

  public boolean getGameEnded () {return gameEnded;}

  public int getScore () {return score;}
  
  public GridPosition getApplePos () {return apple;}
  
  public ArrayList<GridPosition> getSnakePos () {return snake.getPositions();}

  private boolean collidedSnakeApple () {
    ArrayList<GridPosition> positions = snake.getPositions();
    for (GridPosition position : positions) {
      if (position.getGX() == apple.getGX() && position.getGY() == apple.getGY()) {
        return true;
      }
    }
    return false;
  }

  private void newApple () {
    do {
      apple = new GridPosition ((int) random(0, size.getGX()), (int) random(0, size.getGY()));
    } while (collidedSnakeApple());
  }
  
  public void update (Direction direction) {
    if (gameEnded || gamePaused) {return;}

    if (direction != null) {snake.setDirection(direction);}
    snake.next();

    GridPosition head = snake.getPositions().get(0);
    if (head.getGX() < 0 || head.getGX() >= size.getGX() || head.getGY() < 0 || head.getGY() >= size.getGY()) {
      gameEnded = true;
    }

    if (collidedSnakeApple()) {
      snake.grow();
      score++;
      this.newApple();
    }
  }

  public void reset () {
    gamePaused = true;
    gameEnded = false;
    score = 0;
    snake = new Snake((int) random(0, size.getGX()), (int) random(0, size.getGY()), Direction.UP);
    this.newApple();
  }
}
