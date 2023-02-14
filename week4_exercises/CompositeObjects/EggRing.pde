class EggRing {
  Egg ovoid;
  Podium podium;
  Ring circle = new Ring();

  EggRing(float x, float y, float t, float sp) {
    ovoid = new Egg(x, y, t, sp);
    podium = new Podium(x-40, y, 80, 50);
    circle.start(x, y - sp/2);
  }

  void transmit() {
    ovoid.wobble();
    ovoid.display();
    podium.display();
    circle.grow();
    circle.display();
    if (circle.on == false) {
      circle.on = true;
    }
  }
}
