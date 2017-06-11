class Harpoon{
  int harposition;
  boolean isShooting, canShoot = true;
  boolean dos = false;
  int startY = 711, len = 0, offset = 0;
  float accel = .1, takeaway = 4;
  
  Harpoon(){
  }

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
      int offset = 0;
      if(dos){
        print("doin smth");
        offset = 25;
        line(harposition - offset, 711, harposition - offset, startY);
      }
      line(harposition + offset,711,harposition + offset,startY);
      startY -= takeaway;
      len += takeaway;
      takeaway += accel;
    }
    else {
     canShoot = true; 
     startY = 711;
     isShooting = false;
     len = 0;
    }
   }
  
  void reset(){
    canShoot = true; 
    startY = 711;
    isShooting = false;
    len = 0;
  }
  
  void settw(int toset){
    takeaway = toset;
  };
  
  PVector endPoint(){
    return new PVector(harposition + offset, startY);
  }
  
  PVector thatOtherOne(){
    return new PVector(harposition - offset, startY);
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
        