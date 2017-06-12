class speedpowerup extends Powerup {
  Player playa;

  speedpowerup(Player needstobewatched) {
    isVisible = false;
    x = 500;
    y = 550;
    playa = needstobewatched;
  }


  void show() {
    isVisible = true;
    image(loadImage("lightningbolt.png"), x, y);
  }

  void powerUP() {
    playa.speed = 15;
    inUse = true;
    x = 950;
    y = 100;
    delay(5000);
    isVisible = false;
    inUse = false;
    playa.speed = 5;
  }

  String toString() {
    return "I make you fast";
  }
}