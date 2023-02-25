GameModel model;
GameController controller;

void setup(){
  // The screen is currrently set to the same size as the game window below.
  // Just remember to use the correct grid conversion when setting the game window size. 
  size(720, 480); 
  frameRate(5);
  noStroke();
  
  // Since each grid is 30x30, use 720/30=24, 480/30=16 for the GameModel dimensions
  model = new GameModel(24, 16);
  controller = new GameController(model);
}

void draw() {
  controller.update();
  
  // Basic drawing function. Replace this line with ModelView when ready. 
  basicDraw(model);
}

void keyPressed(){
  controller.keyPressed(keyCode);
}

void keyReleased() {
  controller.keyReleased(keyCode);
}

// Very basic graphics functions. Delete when no longer needed
void basicDraw (GameModel model) {
  background(255);
  GridPosition apple = model.getApplePos();
  fill(255, 0, 0);
  rect(apple.getX(), apple.getY(), 30, 30);
  ArrayList<GridPosition> snake = model.getSnakePos();
  fill(0, 0, 0);
  for (GridPosition position : snake) {
    rect(position.getX(), position.getY(), 30, 30);
  }
}
