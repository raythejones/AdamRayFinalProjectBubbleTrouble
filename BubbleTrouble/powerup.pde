class Powerup{
    boolean isVisible;
    float x,y;
    Player playa;
    Harpoon hapoon;
    
    
    Powerup(){
      isVisible = false;
      x = 500;
      y = 550;
    }
    
    Powerup(Player needstobewatched){
      isVisible = false;
      x = 500;
      y = 550;
      playa = needstobewatched;
      print(playa);
    }
    
    Powerup(Harpoon alsoneedstobewatched){
      isVisible = false;
      x = 500;
      y = 550;
      hapoon = alsoneedstobewatched;
    }
   
    void show(){
      isVisible = true;
      //ellipse(x, y, 25, 25);
      image(loadImage("lightningbolt.png"), x, y);
    }
    
    void setNewSpawn(){
      x = random(700) + 150;
      y = random(400) + 100;
    }
    
    void fall(){
      y += 5;
    }
    
    void makeNewPowerupKinda(){
      setNewSpawn();
      show();
    }
    
    void powerUP(){
      playa.speed = 15;
      isVisible = false;
      delay(5000);
      playa.speed = 5;
    }
    
    void use(){
      powerUP();
      isVisible = false;
      x = 0;
      y = 0;
    }
    
    boolean onFloor(){
      return y >= 675;
    }
    
    boolean canBeDisplayed(){
      return isVisible;
    }
    
    boolean isTouching(PVector otherObj){
     PVector coords = new PVector(x, y);
     print(coords + " " + otherObj + "\n");
     return coords.dist(otherObj) < 75;
    }
}