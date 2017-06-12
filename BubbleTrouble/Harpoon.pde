class Harpoon{
  int harposition;
  boolean isShooting, canShoot = true;
<<<<<<< HEAD
  int startY = 650, len = 0;
  float accel = .1, takeaway = 5;
=======
  int startY = 711, len = 0;
  float accel = .1, takeaway = 4;
>>>>>>> 7e108acd04e2e66ad78020b11b981c8da5e4f4e5

  Harpoon(int PosValue){
    harposition = PosValue;
  }

  void setX(int xVal){
    harposition = xVal;
  }

  void shoot(){  
    if(startY > 0){ 
      canShoot = false;
      stroke(191);
<<<<<<< HEAD
      line(harposition,650,harposition,startY);
=======
      line(harposition,711,harposition,startY);
>>>>>>> 7e108acd04e2e66ad78020b11b981c8da5e4f4e5
      startY -= takeaway;
      len += takeaway;
      takeaway += accel;
    }
    else {
     canShoot = true; 
<<<<<<< HEAD
     startY = 650;
=======
     startY = 711;
>>>>>>> 7e108acd04e2e66ad78020b11b981c8da5e4f4e5
     isShooting = false;
     len = 0;
    }
   }
  
  void reset(){
    canShoot = true; 
<<<<<<< HEAD
    startY = 650;
=======
    startY = 711;
>>>>>>> 7e108acd04e2e66ad78020b11b981c8da5e4f4e5
    isShooting = false;
    len = 0;
  }
  
  void settw(int toset){
    takeaway = toset;
  };
  
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
        