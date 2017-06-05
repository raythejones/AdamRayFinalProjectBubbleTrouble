class Player {
  static final color col = #ffffff, OUTLINE = 0;
  static final float BOLD = 2.0;
  int speed = 3;
  boolean isLeft, isRight;
  int position, y;
 
  Player(int xx) {
    position = xx;
  }
  
  
  void display() {
    ellipse(position, 650, 50, 50);
        stroke(255);
    line(position,650,position,690);
    line(position,690,position+20,710);
    line(position,690,position-20,710);
    line(position-15,670,position+15,670);
    line(position-15,670,position+15,670);
  }
 
  void move() {
    int r = 20>>1;
    position = constrain(position + speed*(int(isRight) - int(isLeft)), r, width  - r);
  }
 
 
  void drawPlayer(){    
       ellipse(position,650,50,50);   
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
  