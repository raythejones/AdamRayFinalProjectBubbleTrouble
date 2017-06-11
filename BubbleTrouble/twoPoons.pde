class twoPoons extends Powerup {
  Harpoon poony;

  twoPoons(Harpoon needstobewatched) {
    isVisible = false;
    x = 500;
    y = 550; 
    poony = needstobewatched;
  }


  void show() {
    isVisible = true;
    image(loadImage("fork.png"), x, y);
  }

  boolean onFloor() {
    return y >= 650;
  }

  void powerUP() {
    print(poony.dos);
    poony.dos = true;
    inUse = true; 
    x = 850;
    y = 100;
    delay(3500);
    isVisible = false;
    inUse = false;
    poony.dos = false;
    poony.offset = 0;
  }
}