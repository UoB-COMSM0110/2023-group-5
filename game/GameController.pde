interface Controller {
  HashMap<Direction, ArrayList<Character>> getKeys();
  void update();
}

class GameController implements Controller {
  private final HashMap<Character, Boolean> pressedKeys = new HashMap();
  private final HashMap<Direction, ArrayList<Character>> keyCombinations = new HashMap();
  private final GameModel model;
  private Direction direction = Direction.UP;
  
  GameController(GameModel model){
    this.model = model;
    for (Direction dir : Direction.values()){
      keyCombinations.put(dir, new ArrayList());
    }
    addKeyToCombination(Direction.UP,    'W');
    addKeyToCombination(Direction.DOWN,  'S');
    addKeyToCombination(Direction.LEFT,  'A');
    addKeyToCombination(Direction.RIGHT, 'D');
  }
  
  HashMap<Direction, ArrayList<Character>> getKeys() {
    return keyCombinations;
  }
  
  void addKeyToCombination(Direction dir, char key) {
    ArrayList<Character> list = keyCombinations.getOrDefault(dir, null);
    if (list != null) {
      list.add(key);
    }
  }
  
  void keyPressed(int keyCode) {
    pressedKeys.put((char) keyCode, true);
    if (keyCode == ' ') {
      model.toggleGamePaused();
    }
  }
  
  void keyReleased(int keyCode){
    pressedKeys.put((char) keyCode, false);
  }
  
  private boolean isKeyPressed(char key) {
    return pressedKeys.getOrDefault(key, false);
  }
  
  void update(){
    if (model.getGameEnded()) {
      return;
    }
    for (Direction dir : Direction.values()){
      if (getKeys().get(dir).stream().allMatch(this::isKeyPressed)){
        direction = dir;
        break;
      }
    }
    model.update(direction);
  }
}
