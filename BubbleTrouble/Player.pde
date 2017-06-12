class Player {
  static final color col = #ffffff, OUTLINE = 0;
  static final float BOLD = 2.0;
  int speed = 5;
  boolean isLeft, isRight;
  int position, y;
  boolean isAlive = true, canDie = true;
  PImage front = loadImage("1.png");
  PImage left = loadImage("right.png");
  PImage right = loadImage("left.png");


  Player(int xx) {
    position = xx;
  }

  void display() {
    if (isLeft) {
      display(-1);
    } else if (isRight) {
      display(1);
    } else {
      display(0);
    }
  }

  void display(int dir) {
    imageMode(CENTER);
    /*ellipse(position, 675, 20, 20);
     stroke(255);
     line(position, 675, position, 690);
     line(position, 690, position+20, 710);
     line(position, 690, position-20, 710);
     line(position-15, 670, position+15, 670);
     line(position-15, 670, position+15, 670);*/
    if (dir == -1) {
      image(left, position, 675);
    } else if (dir == 1) {
      image(right, position, 675);
    } else {
      image(front, position, 675);
    }
  }

  boolean dieable() {
    return canDie;
  }

  PVector currentPos() {
    return new PVector(position, 675);
  }

  void move() {
    int r = 20>>1;
    position = constrain(position + speed*(int(isRight) - int(isLeft)), r, width  - r);
    if(isAlive){
      display();
    }
  }

  void drawPlayer() {    
    ellipse(position, 675, 50, 50);
  }


  boolean setMove(int k, boolean b) {
    switch (k) {
    case LEFT:
      return isLeft = b;  

    case RIGHT:
      return isRight = b;

    default:
      return b;
    }
  }
}