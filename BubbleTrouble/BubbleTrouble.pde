int Time = 0;
int lives = 0;
int numBubbles = 0;
static final int DIAM = 48, SPD = 3, FPS = 60;

Player p;
Harpoon h;
Bubble b;

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
    b = new Bubble(6);
    b.display(650, 650);
 
}
  
  void draw()
{
  background(0);
  p.move();
  p.display(); 
  b.bounce();
  if(h.canShoot){
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