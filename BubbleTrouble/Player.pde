 class Player{
  static final color col = #ffffff, OUTLINE = 0;
  static final float BOLD = 2.0;
  
  int position;
  int speed;
 
  boolean isLeft, isRight, isUp, isDown;
  int x, y;
  final int v;
 
  Player(int xx, int vv) {
    x = xx;
    v = vv;
  }
  
  
  void display() {
    ellipse(x, 650, 50, 50);
  }
 
  void move() {
    int r = 20>>1;
    x = constrain(x + v*(int(isRight) - int(isLeft)), r, width  - r);
  }
 
 
void drawPlayer(){
     ellipse(position,650,50,50);   
}


  boolean setMove(int k, boolean b) {
    switch (k) {
    case 'A':
    case LEFT:
      return isLeft = b;
 
    case 'D':
    case RIGHT:
      return isRight = b;
 
    default:
      return b;
    }
  }

 
 
public void shootHarpoon()
{
  Harpoon h = new Harpoon(position);
  h.display();
  h.moveUp();
  
}
}