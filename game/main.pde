GameModel model;
GameView view;
GameController controller;

void setup(){
  GameModel model = new GameModel(400, 320);
  GameController controller = new GameController(model);
  GameView view = new GameView(model, controller);
  size(600, 400);
}

void draw() {
  background(255);
  
  controller.update();
  view.draw();
}

/*
void keyPressed(){
  controller.keyPressed(keyCode);
}

void keyReleased() {
  controller.keyReleased(keyCode);
}
*/
