class Bubble{
  private int size;
  private PVector velocity, acceleration, coords;
  private boolean touchingPlayer, direction;
  
  Bubble(){
    size = 60;   
   velocity = new PVector(3, 1);
   acceleration = new PVector(.05, .001);
   coords = new PVector(0, 0);
  }
  
  Bubble(int syz){
   size = syz;   
   velocity = new PVector(3, 3);
   acceleration = new PVector(.01, .05);
   coords = new PVector(0, 0);
  }
  
  void split(){
    size /= 2;  
  }
  
  void bounce(){
    
    if(coords.x > width-size || coords.x < size){
       velocity.x *= -1;
       acceleration.x *= -1;
    }
    if(coords.y > 650 || coords.y < 300){
      velocity.y *= -1;
      acceleration.y *= -1;
    }
    
    velocity.add(acceleration);
    velocity.limit(30);
    coords.add(velocity);
    
    if(random(2) == 0.0){
      velocity.mult(0);
      print("reset");
    }
    
    ellipse(coords.x, coords.y, size, size); 
    
    
  }
  
  void display(int x, int y){
    coords.x = x;
    coords.y = y;
    ellipse(coords.x, coords.y, pow(2, size), pow(2, size));
  }
  
  int size(){
    return size;
  } 
} 