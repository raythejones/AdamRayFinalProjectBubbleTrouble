class Bubble{
  private int size, x, y;
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
  
   void bounce(int nthOfScreen){
    int constant = direction ? 1:-1;
    
    display(x - nthOfScreen * constant, y);
    
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