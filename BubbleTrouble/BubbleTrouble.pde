int Time = 0, lives = 0, level = 1, chanceOfSpawn = 300, numberPowerups = 3, sf = 3;
float distBetweenBubs = 200;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
static final int DIAM = 48, SPD = 3, FPS = 60;

Player p;
Harpoon h;
Powerup finnaSpawn;
boolean endGame = false;
boolean gameStarted = false;
PImage pic, bg;

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
  makeAPup();
  finnaSpawn.isVisible = false;

  pic = loadImage("back.jpg");
  bg = loadImage("StartScreen.png");
}

void draw() {
  if (!gameStarted) {
    background(bg);
    print("(" + mouseX + ", " + mouseY + ")" + "\n");
  } else {
    if (endGame == false) {

      //DRAWING THE WINDOW\\

      background(pic);
      fill(153, 38, 0);
      stroke(153, 38, 0);
      rect(0, 711, 1000, 75);
      stroke(255);

      line(0, 715, 1000, 715);
      line(0, 725, 1000, 725);
      line(0, 735, 1000, 735);
      line(0, 745, 1000, 745);
      fill(255);

      //// POWERUP CODE \\\\\ 
      if (!finnaSpawn.canBeDisplayed()) {
        if (random(chanceOfSpawn) < 1) {
          makeAPup();
        }
      } else {
        finnaSpawn.show();
        thread("poweritup");
      }


      //PLAYER MOVEMENT\\
      p.move();

      if (p.isAlive) {
        p.display();
      }    

      //BUBBLE MOVEMENT SLASH INTERACTION \\
      for (int i = 0; i < bubbles.size(); i++) {
        Bubble bub = bubbles.get(i);
        if (bub.size() >= 15) {
          fill(102, 255, 153);
          stroke(0);
        }
        if (bub.size() >= 30) {
          fill(204, 102, 255);
          stroke(0);
        }
        if (bub.size() >= 60) {
          fill(255, 102, 0);
          stroke(0);
        }

        bub.bounce();
        PVector wya = bub.getCoords();
        PVector aqui = h.endPoint();

        boolean touchingLine = abs((wya.x - aqui.x) / ((wya.x + aqui.x) / 2)) <= .04;
        if (h.dos) {
          PVector donde = h.thatOtherOne();
          touchingLine = touchingLine || abs((wya.x - donde.x) / ((wya.x + donde.x) / 2)) <= .04;
        }
        if (touchingLine && wya.y >= aqui.y) {
          h.reset();
          if (bub.size()/2 > 10) {
            Bubble[] children = bub.split();
            bubbles.add(children[0]);
            bubbles.add(children[1]);
          }
          bubbles.remove(bub);
          if (bubbles.size() == 0) {
            level += 1;
            for (int j = 0; j < level; j++) {
              bubbles.add(new Bubble(60, 450 + ((distBetweenBubs * level) / 2) - distBetweenBubs * j, 350, (int)pow(-1, j), sf));
            }
          }
        }

        if (bub.dist(p.currentPos()) <= (bub.size() * 1.02)) {
          if (p.dieable()) {
            p.isAlive = false; 
            endGame = true;
          }
        }
      }

      //HARPOON SHOOTING\\
      if (h.canShoot) {
        h.settw(4);
        h.setX(p.position);
      }

      if (h.isShooting) {
        h.shoot();
      }

      if (h.canShoot) {
        h.settw(11);
        h.setX(0);
      }
      if (h.isShooting) {
        h.shoot();
      }

      //ENDING THE GAME\\
      if (endGame == true) {
        background(100);
        fill(255, 0, 0);
        textSize(70);
        text("Game Over", 315, 400);
      }
    }
  }
}

void makeAPup() {
  int num = (int)random(numberPowerups);
  switch (num) {
  case 0:
    finnaSpawn = new speedpowerup(p);
    break;
  case 1:
    finnaSpawn = new invincibility(p);
    break;
  case 2:
    finnaSpawn = new twoPoons(h);
    break;
  }
  finnaSpawn.makeNewPowerupKinda();
}

void poweritup() {
  if (finnaSpawn.isTouching(p.currentPos())) {
    finnaSpawn.use();
  }
  if (!finnaSpawn.onFloor()) {
    finnaSpawn.fall();
  }
}

void mousePressed() {
  if (!gameStarted) {
    ellipse(mouseX, mouseY, 25, 25);
    delay(20);
    if (mouseY <= 275 && mouseY >= 220) {
      if (mouseX >= 480 && mouseX <= 605) {
        startGame(0);
      }
      if (mouseX >= 660 && mouseX <= 785) {
        startGame(1);
      }
      if (mouseX >= 845 && mouseX <= 965) {
        startGame(2);
      }
    }
  }
}

void startGame(int diff) {
  if (diff == 0) {
    chanceOfSpawn = 300;
    sf = 3;
  }
  if (diff == 1) {
    chanceOfSpawn = 1000;
    sf = 4;
  }
  if (diff == 2) {
    chanceOfSpawn = 1700;
    sf = 5;
  }
  bubbles.add(new Bubble(60, sf));
  gameStarted = true;
}


void keyPressed() {
  p.setMove(keyCode, true);
  if (keyCode == 32) {
    h.isShooting = true;
  }
}


void keyReleased() {
  p.setMove(keyCode, false);
}