interface GameModel {
  int getScore();
  PVector getApplePos();
  ArrayList<PVector> getSnakePos();
  void update(Direction dir);
  void pause();
  void resume();
  void reset();
}

class GameModel implements GameModel {  
  
}
