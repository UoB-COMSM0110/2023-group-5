interface Controller {
  ArrayList<ArrayList<Character>> getKeys();
  void update();
}

class GameController implements Controller {
  private final HashMap<Integer, Boolean> pressedKeys = new HashMap();
  private final ArrayList<ArrayList<Character>> keyCombinations = new ArrayList();
  private final GameModel model;
  
  GameController(GameModel model){
    this.model = model;
  }
  
  ArrayList<ArrayList<Character>> getKeys() {
    return keyCombinations;
  }
  
  void keyPressed(int keyCode) {
    pressedKeys.put(keyCode, true);
  }
  
  void keyReleased(int keyCode){
    pressedKeys.put(keyCode, false);
  }
  
  boolean isPressed(int keyCode) {
    return pressedKeys.getOrDefault(keyCode, false);
  }
  
  void update(){
    if (model.getGameRunning()) {
      return;
    }
    model.getSnake().update();
  }
}
