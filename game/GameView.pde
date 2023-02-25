interface View {
  void draw();
}

class GameView implements View{
  final GameModel model;
  final GameController controller;
  
  public GameView(GameModel model, GameController controller) {
    this.model = model;
    this.controller = controller;
  }
  
  void draw(){
    drawScore();
    drawKeyFrame();
    drawWall();
    drawKeys();
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
    textSize(20);
    text("U", wid-5, 20);
    text("D", wid*3-5, 20);
    text("L", wid*5-5, 20);
    text("R", wid*7-5, 20);
    line(0, 25, wid*8, 25);
    line(wid*2, 0, wid*2, 320);
    line(wid*4, 0, wid*4, 320);
    line(wid*6, 0, wid*6, 320);
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
  }
  
}
