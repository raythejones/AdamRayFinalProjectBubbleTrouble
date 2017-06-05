<<<<<<< HEAD
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


 boolean setMove(int k, boolean b) {
    if(k == 32){
      return isShooting = b;
    }
    else{
      return b;
    }
 }
}
    
    
=======
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


 boolean setMove(int k, boolean b) {
    if(k == 32){
      return isShooting = b;
    }
    else{
      return b;
    }
 }
}
    
    
>>>>>>> 22b841eb3949bcde03bc5b14e18a7274328995c3
  