import java.util.Comparator;

interface Controller {
  void update();
}

class GameController implements Controller {
  private final HashMap<Character, Boolean> pressedKeys = new HashMap();
  private final GameModel model;
  private Direction direction = Direction.UP;
  private final HashMap<Direction, ArrayList<Character>> keyCombinations = new HashMap();
  
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
      list.sort(Character::compare);
    }
  }
  
  void addNewKeyToCombination() {
    Direction shortestCombination = keyCombinations.entrySet().stream().sorted(Comparator.comparingInt(x -> x.getValue().size())).findFirst().get().getKey();
    char newCharacter = (char)(random('Z' - 'A') + 'A');
    for (int i = 0; i < 26; i++) {
      newCharacter = (char) ((int) (newCharacter + i - 'A') % 26 + 'A');
      ArrayList<Character> currentCharacters = new ArrayList(keyCombinations.get(shortestCombination));
      currentCharacters.add(newCharacter);
      if (keyCombinations.values().stream().noneMatch(x -> x.containsAll(currentCharacters))) {
        break;
      }      
    }
    addKeyToCombination(shortestCombination, newCharacter);
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
    if (model.getGamePaused() || model.getGameEnded()) {
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
