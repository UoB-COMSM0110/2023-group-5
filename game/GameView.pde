interface GameView {
  void draw();
}

class GameView implements GameView{
  final GameModel model;
  
  GameView(GameModel model) {
    this.model = model;
  }
  
  void draw(){
  }
  
}
