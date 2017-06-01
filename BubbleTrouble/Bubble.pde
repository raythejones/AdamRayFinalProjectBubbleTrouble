class Bubble{
  private int size, direction;
  private boolean touchingPlayer;
  
  
  public Bubble(){
     size = 1; 
  }
  
  public Bubble(int syz){
   size = syz; 
  }
  
  public void split(){
    size /= 2;  
  }
  
  public void bounce(){
    
  }
  
  void display(int x, int y){
    ellipse(x, y, pow(2, size), pow(2, size));
  }
  
  public int size(){
    return size;
  }
  
  
  
}