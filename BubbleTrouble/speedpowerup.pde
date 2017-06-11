class speedpowerup extends Powerup{
    Player playa;
    
    speedpowerup(Player needstobewatched){
      isVisible = false;
      x = 500;
      y = 550;
      playa = needstobewatched;
    }
    
   
    void show(){
      print("i am useful");
      isVisible = true;
      image(loadImage("lightningbolt.png"), x, y);
    }
    
    void powerUP(){
      playa.speed = 15;
      isVisible = false;
      delay(5000);
      playa.speed = 5;
    }
    
    String toString(){
      return "I make you fast";
    }
}