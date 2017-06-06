class Bubble{
  private int size;
  private PVector velocity, acceleration, coords;
  
  Bubble(int syz){
   size = syz;   
   velocity = new PVector(3, 3);
   acceleration = new PVector(.01, .05);
   coords = new PVector(100, 150);
  }
  
  Bubble(int syz, float x, float y, int xdirection){
   size = syz;   
   velocity = new PVector(3 * xdirection,  -3);
   acceleration = new PVector(.01 * xdirection, .05);
   coords = new PVector(x, y);
  }
  
  Bubble[] split(){
    return new Bubble[]{new Bubble(size/2, coords.x - 10, coords.y, -1), new Bubble(size/2, coords.x + 10, coords.y, 1)}; 
  }
  
  void bounce(){
    
    if(coords.x > width-size || coords.x < size){
       velocity.x *= -1;
    }
    if(coords.y > 650 || coords.y < 100){
      velocity.y *= -1;
    }
    
    velocity.y += .25;
    velocity.limit(size/2);
    coords.add(velocity);
    
    if(random(2) == 0.0){
      velocity.mult(0);
      print("reset");
    }
    
    ellipse(coords.x, coords.y, size, size); 
    
    
  }
  
  float dist(PVector other){
    return coords.dist(other);
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