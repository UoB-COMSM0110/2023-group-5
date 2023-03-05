interface View {
  void draw();
}

class GameView implements View{
  final GameModel model;
  //final GameController controller;
  
  public GameView(GameModel model) {
    this.model = model;
    //this.controller = controller;
  }
  
  void draw(){
    background(255);
    drawScore();
    drawKeyFrame();
    drawWall();
    //drawKeys();
    drawApple();
    drawSnake();

  }
  
  void drawScore() {
    fill(0);
    textSize(20);
    int score = model.getScore();
    text("Scores:" + score, width/2-60, 30);
  }
  
  void drawKeyFrame() {
    pushMatrix();
    translate(width*3/4, 40);
    stroke(0);
    noFill();
    rect(0, 0, width/4-20, 320);
    int wid = (width/4-20)/8;
    line(0, 25, wid*8, 25);
    line(wid*2, 0, wid*2, 320);
    line(wid*4, 0, wid*4, 320);
    line(wid*6, 0, wid*6, 320);
    //up
    line(wid, 5, wid, 20);
    line(wid, 5, wid-5, 10);
    line(wid, 5, wid+5, 10);
    //down
    line(wid*3, 5, wid*3, 20);
    line(wid*3, 20, wid*3-5, 15);
    line(wid*3, 20, wid*3+5, 15);
    //left
    line(wid*4+8, 12.5, wid*6-8, 12.5);
    line(wid*4+8, 12.5, wid*4+13, 7.5);
    line(wid*4+8, 12.5, wid*4+13, 17.5);
    //right
    line(wid*6+8, 12.5, wid*8-8, 12.5);
    line(wid*8-8, 12.5, wid*8-13, 7.5);
    line(wid*8-8, 12.5, wid*8-13, 17.5);
    popMatrix();
  }
  
  void drawWall() {
    stroke(0);
    noFill();
    pushMatrix();
    translate(20, 40);
    rect(0, 0, 400, 320);
    popMatrix();
  }
  
  /*
  void drawKeys() {
    HashMap<Direction, ArrayList<Character>> hashKeys = controller.getKeys();
    pushMatrix();
    int wid = (width/4-20)/8;
    translate(width*3/4, 40);
    fill(0, 0, 255);
    for(Direction dir: Direction.values()) {
      int size = hashKeys.get(dir).size();
      for(int i=0; i<size; i++){
        switch(dir){
        case UP:
          text(hashKeys.get(dir).get(i), wid-5, 25+20*(i+1));
          break;
        case DOWN: 
          text(hashKeys.get(dir).get(i), wid*3-5, 25+20*(i+1));
          break;
        case LEFT: 
          text(hashKeys.get(dir).get(i), wid*5-5, 25+20*(i+1));
          break;
        case RIGHT: 
          text(hashKeys.get(dir).get(i), wid*7-5, 25+20*(i+1));
          break;
        }
      }
    }
    popMatrix();
  }
  */
  
  void drawApple() {
    int gridSize = 10; //(400 * 320 ?-> 40 * 32)
    GridPosition apple = model.getApplePos();
    pushMatrix();
    translate(20, 40);
    noStroke();
    fill(255, 0, 0);
    circle(apple.getX()+gridSize/2, apple.getY()+gridSize/2, gridSize);
    popMatrix();
  }

  void drawSnake() {
    int gridSize = 10;
    ArrayList<GridPosition> snake = model.getSnakePos();
    pushMatrix();
    translate(20, 40);
    noStroke();
    fill(0);
    for(int i=0; i<snake.size(); i++){
      pushMatrix();
      square(snake.get(i).getX(), snake.get(i).getY(), gridSize);
      popMatrix();
    }
    popMatrix();
  }

}
