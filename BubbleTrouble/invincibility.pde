class invincibility extends Powerup {
  Player playa;

  invincibility(Player needstobewatched) {
    isVisible = false;
    x = 500;
    y = 550;
    playa = needstobewatched;
  }


  void show() {
    isVisible = true;
    image(loadImage("invincibl.png"), x, y);
  }

  void powerUP() {
    playa.canDie = false;
    inUse = true;
    x = 900;
    y = 100;
    delay(5000);
    isVisible = false;
    inUse = false;
    playa.canDie = true;
  }

  String toString() {
    return "I make you invincible";
  }
}