class Bubble{
  private int size;
  private PVector velocity, coords;
  
  Bubble(int syz){
   size = syz;   
   velocity = new PVector(3, -1 * pow(size, .7));
   coords = new PVector(150, 711 - pow(size, .7));
       fill(255, 102, 0);
    stroke(255, 102, 0);
  }
  
  Bubble(int syz, float x, float y, int xdirection){
   size = syz;   
   velocity = new PVector(3 * xdirection,  -3);
   coords = new PVector(x, y);
  }
  
  Bubble[] split(){
    return new Bubble[]{new Bubble(size/2, coords.x - 10, coords.y, -1), new Bubble(size/2, coords.x + 10, coords.y, 1)}; 
  }
  
  void bounce(){
    
    if(coords.x > width-size || coords.x < size){
       velocity.x *= -1;
    }
    if(coords.y > 711 - (size * .7)){
      coords.y = 711 - (size * .7);
      velocity.y = -1 * pow(size, .7);
    }
    
    velocity.y += .25;  
    coords.add(velocity);
    
 //<>//
    ellipse(coords.x, coords.y, size, size); 
 
  }
  
  PVector getCoords(){
    return coords;
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