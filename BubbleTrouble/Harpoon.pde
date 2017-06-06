class Harpoon{
  int harposition;
  boolean isShooting, canShoot = true;
  int startY = 650;

  Harpoon(int PosValue){
    harposition = PosValue;
  }

  void setX(int xVal){
    harposition = xVal;
  }

  void shoot(){  
    if(startY > 0){ 
      canShoot = false;
      stroke(255);
      line(harposition,650,harposition,startY);
      startY-=11;
    }
    else {
     canShoot = true; 
     startY = 650;
     isShooting = false;
    }
   }
  
  void reset(){
    canShoot = true; 
    startY = 650;
    isShooting = false;
  }
  
  PVector endPoint(){
    return new PVector(harposition, startY);
  }


  boolean setMove(int k, boolean b) {
    if(k == 32){
      return isShooting = b;
    }
    else{
      return b;
    }
 }
 
}
    
        