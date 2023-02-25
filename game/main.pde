GameModel model;
 GameController controller;
GameView view;

Direction direction; // Delete when no longer needed. 

void setup(){
  // The screen is currrently set to the same size as the game window below.
  // Just remember to use the correct grid conversion when setting the game window size. 
  size(600, 400); 
  frameRate(5);
  noStroke();
  
  // Since each grid is 10x10, use 400/10=40, 320/10=32 for the GameModel dimensions
  model = new GameModel(40, 32);
   controller = new GameController(model);
  view = new GameView(model);
}

void draw() {
   controller.update();  
  view.draw();
}

void keyPressed(){
   controller.keyPressed(keyCode);
}

void keyReleased() {
   controller.keyReleased(keyCode);
}
