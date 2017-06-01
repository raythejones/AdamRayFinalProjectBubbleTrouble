int Time = 0;
int lives = 0;
int numBubbles = 0;
static final int DIAM = 48, SPD = 3, FPS = 60;

Player p;

 void setup()
{
    size(1000, 750, JAVA2D);
      smooth(4);
        frameRate(FPS);
  ellipseMode(CENTER);
  
    fill(Player.col);
  stroke(Player.OUTLINE);
  strokeWeight(Player.BOLD);
  

  p = new Player(width>>1, SPD);
}
  
  void draw()
{
  background(0);
  p.move();
  p.display(); 
}
void keyPressed() {
  p.setMove(keyCode, true);
}
 
void keyReleased() {
  p.setMove(keyCode, false);
}