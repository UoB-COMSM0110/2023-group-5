GameModel model;
// GameController controller;
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
  // controller = new GameController(model);
  view = new GameView(model);
}

void draw() {
  // controller.update();
  model.update(direction); // Delete when no longer needed. 
  
  view.draw();
}

void keyPressed(){
  basicControl(); // Delete when no longer needed. 
  // controller.keyPressed(keyCode);
}

void keyReleased() {
  // controller.keyReleased(keyCode);
}

// Very basic controller function. Delete when no longer needed
void basicControl () {
  if (keyCode == UP) {
      direction = Direction.UP;
    } else if (keyCode == DOWN) {
      direction = Direction.DOWN;
    } else if (keyCode == LEFT) {
      direction = Direction.LEFT;
    } else if (keyCode == RIGHT) {
      direction = Direction.RIGHT;
    } else if (key == ' ') {
      model.toggleGamePaused();
    } else {
      direction = null;
    }
}
