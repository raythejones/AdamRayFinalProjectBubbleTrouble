class Bubble{
  private int size;
    int ydirection = 1, xdirection = 1;
  float x, y;
  private boolean touchingPlayer, direction;
  
  
  Bubble(){
     size = 1; 
     direction = (int)random(2) > .5;
  }
  
  Bubble(int syz){
   size = syz; 
  }
  
   void split(){
    size /= 2;  
  }
  
  void bounce(){
    float yspeed = 2.8, xspeed = 2.2;
    int rad = 60;
     if (x > width-rad || x < width/2) {
      xdirection *= -1;
    }
    if (y > height-rad || y < rad) {
      ydirection *= -1;
    }
    x = x + ( xspeed * xdirection );
    y = y + ( yspeed * ydirection );

    ellipse(x, y, rad, rad);
   
  }
  
  void display(int x, int y){
    this.x = x;
    this.y = y;
    ellipse(x, y, pow(2, size), pow(2, size));
  }
  
  int size(){
    return size;
  }
  
  
  
}