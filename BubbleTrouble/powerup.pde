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
    }
    
    Powerup(Harpoon alsoneedstobewatched){
      isVisible = false;
      x = 500;
      y = 550;
      hapoon = alsoneedstobewatched;
    }
   
    void show(){
      isVisible = true;
      ellipse(x, y, 25, 25);
    }
    
    void setNewSpawn(){
      x = random(700) + 150;
      y = random(611) + 100; 
    }
    
    void fall(){
      while(y < 711){
        y -= 10;
      }
    }
    
    void powerUP(){
      playa.speed = 15;
      isVisible = false;
    }
    
    boolean canBeDisplayed(){
      return isVisible;
    }
    
    boolean isTouching(PVector otherObj){
     PVector coords = new PVector(x, y);
     return coords.dist(otherObj) < 3;
    }
}