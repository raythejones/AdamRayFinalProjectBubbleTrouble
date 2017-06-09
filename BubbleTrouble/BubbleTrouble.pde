int Time = 0;
int lives = 0;
int numBubbles = 0;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
static final int DIAM = 48, SPD = 3, FPS = 60;

Player p;
Harpoon h;
boolean endGame = false;

 void setup()
{
    size(1000, 750, JAVA2D);
    smooth(4);
    frameRate(FPS);
    ellipseMode(CENTER);
  
    fill(Player.col);
    stroke(Player.OUTLINE);
    strokeWeight(Player.BOLD);  

    p = new Player(500);
    h = new Harpoon(p.position);
    bubbles.add(new Bubble(60));
 
}
  
  void draw(){
   if(endGame == false){

    background(0);
        fill(153, 38, 0);
stroke(153, 38, 0);
    rect(0,711,1000, 75);
    stroke(255);


    line(0,715,1000,715);
    line(0,725,1000,725);
    line(0,735,1000,735);
    line(0,745,1000,745);

fill(255);
    p.move();
 if(p.isAlive){
  p.display(); }    
    for(int i = 0; i < bubbles.size(); i++){
        

    
      Bubble bub = bubbles.get(i);
       if(bub.size() == 60){fill(255, 102, 0);
    stroke(255, 102, 0);}
    
    if(bub.size() == 30){fill(204, 102, 255);
    stroke(204, 102, 255);}
    
    if(bub.size() == 15){fill(102, 255, 153);
    stroke(102, 255, 153);}
      bub.bounce();
      if(bub.dist(h.endPoint()) <= bub.size() * 1.02){
        h.reset();
        if(bub.size()/2 > 10){
          Bubble[] children = bub.split();
          bubbles.add(children[0]);
          bubbles.add(children[1]);
        }
        bubbles.remove(bub);
      }
    if(bub.dist(p.currentPos()) <= bub.size() * 1.02){
       p.isAlive = false; 
       endGame = true; 
    }
    }
    
    if(h.canShoot){
      h.settw(11);
      h.setX(p.position);
    }
    if(h.isShooting){
      h.shoot();
    }
      if(endGame == true){
  background(100);
  fill(255,0,0);
  textSize(70);
  text("Game Over", 315,400);
  }
  }
    
    if(h.canShoot){
      h.settw(11);
      h.setX(p.position);
    }
    if(h.isShooting){
      h.shoot();
    }
  }

  void keyPressed() {
    p.setMove(keyCode, true);
    if(keyCode == 32){
     h.isShooting = true;
    }
  }

 
  void keyReleased() {
    p.setMove(keyCode, false);
  }