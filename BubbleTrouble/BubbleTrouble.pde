 int Time = 0;
int lives = 0;
int numBubbles = 0;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
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
    bubbles.add(new Bubble(60));
 
}
  
  void draw(){
  background(0);
  p.move();
  p.display(); 
  for(int i = 0; i < bubbles.size(); i++){
    Bubble bub = bubbles.get(i);
    bub.bounce();
    if(bub.dist(h.endPoint()) <= bub.size() * 1.05){
      h.reset();
      if(bub.size()/2 > 10){
        Bubble[] children = bub.split();
        bubbles.add(children[0]);
        bubbles.add(children[1]);
      }
      bubbles.remove(bub);
    } 
  }
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