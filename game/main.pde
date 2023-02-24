GameModel model;
GameView view;
GameController controller;

void setup(){
  model = new GameModel();
  view = new GameView(model);
  controller = new GameController(model);
  size(600, 400);
}

void draw() {
  background(255);
  
  controller.update();
  view.draw();
}

void keyPressed(){
  controller.keyPressed(keyCode);
}

void keyReleased() {
  controller.keyReleased(keyCode);
}
