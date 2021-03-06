abstract class Powerup {
  boolean isVisible, inUse;
  float x, y;

  void show() {
  }

  void setNewSpawn() {
    x = random(700) + 150;
    y = random(400) + 100;
  }

  void fall() {
    if (!inUse) {  
      y += 5;
    }
  }

  void makeNewPowerupKinda() {
    setNewSpawn();
    show();
  }

  void powerUP() {
  }

  void use() {
    powerUP();
    isVisible = false;
    x = 0;
    y = 0;
  }

  boolean onFloor() {
    return y >= 675;
  }

  boolean canBeDisplayed() {
    return isVisible;
  }

  boolean isTouching(PVector otherObj) {
    PVector coords = new PVector(x, y);
    return coords.dist(otherObj) < 75;
  }
}