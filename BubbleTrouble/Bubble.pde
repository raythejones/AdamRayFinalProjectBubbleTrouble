class Bubble{
  private int size;
  int ydirection = 1, xdirection = 1;
  int xspeed = 5, yspeed = 0;
  float x, y;
  private boolean touchingPlayer, direction;
  
  Bubble(){
     size = 1; 
  }
  
  Bubble(int syz){
   size = syz; 
  }
  
  void split(){
    size /= 2;  
  }
  
  void bounce(){
    float yaccel = 1.5, xaccel = 1.5;
    int rad = 60;
    
    xspeed = xspeed + yaccel;
    yspeed = yspeed + xaccel;
    x = x + ( xspeed * xdirection );
    y = y + ( yspeed * ydirection );
    
    if (x > width-rad || x < rad) {
      xdirection *= -1;
      if(xdirection == -1){
        xspeed = 0;
      }
    }
    
    if (y > 650 || y < 400) {
      ydirection *= -1;
      if(ydirection == -1){
        yspeed = 0;
      }
    }

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