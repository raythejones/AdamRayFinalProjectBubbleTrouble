float Time = 1;
int level = 1, chanceOfSpawn = 300, numberPowerups = 3, sf = 3, mode;
float distBetweenBubs = 200;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
static final int DIAM = 48, SPD = 3, FPS = 60;

Player p;
Harpoon h;
Powerup finnaSpawn;
boolean endGame = false;
boolean gameStarted = false;
boolean waitforstart = false;
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


  waitforstart = false;
  pic = loadImage("back.jpg");
  bg = loadImage("StartScreen.png");
}

void draw() {
  if (!gameStarted || waitforstart) {
    bubbles = new ArrayList<Bubble>();
    p = new Player(500);
    h = new Harpoon(p.position);
    makeAPup();
    level = 1;
    finnaSpawn.isVisible = false;
    background(bg);
    if (!waitforstart) {
      if (mouseY <= 275 && mouseY >= 220) {
        fill(0);
        textSize(25);
        if (mouseX >= 480 && mouseX <= 605) {
          String s = "Only 3 shots to delete a bubble, and a high powerup spawn rate";
          text(s, 650, 350, 200, 200);
        }
        if (mouseX >= 660 && mouseX <= 785) {
          String s = "4 shots to delete a bubble, and a moderate powerup spawn rate";
          text(s, 650, 350, 200, 200);
        }
        if (mouseX >= 845 && mouseX <= 965) {
          String s = "5 shots to delete a bubble, and a low powerup spawn rate";
          text(s, 650, 350, 200, 200);
        }
      }
    }
  } else {
    if (!endGame) {
      if (mode == 1) {
        //DRAWING THE WINDOW\\
        print("aha");

        background(pic);

        fill(0);
        textSize(20);
        text("Active Powerups", 815, 40);

        fill(255);
        stroke(0);
        rect(820, 50, 150, 100);

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

          boolean touchingLine = abs((wya.x - aqui.x) / ((wya.x + aqui.x) / 2)) <= .02;
          if (h.dos) {
            PVector donde = h.thatOtherOne();
            touchingLine = touchingLine || abs((wya.x - donde.x) / ((wya.x + donde.x) / 2)) <= .02;
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
                bubbles.add(new Bubble(60, 400 + ((distBetweenBubs * level) / 2) - distBetweenBubs * j, 350, (int)pow(-1, j), sf));
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

          fill(0);
          stroke(255);
          rect(360, 470, 250, 100);

          fill(255);
          textSize(25);
          text("Click to restart!", 385, 525);
        }
      } else { //This is the timed mode
        background(pic);
        //Timer Code\\
        fill(255, 0, 0);
        stroke(0);
        rect(75, 50, ((75 + (FPS * 5)) * (1 - Time/FPS)) / level, 50);
        text("Time", 75, 40);
        Time += 1.0 * level / FPS;

        if (bubbles.size() > 0) {
          //DRAWING THE WINDOW\\
          drawStuff();

          powerupStuff();
          
          p.move();
          
          doYaBubbleThang();
          
          harpoonShoot();
        } else {
          level++;
          Time = 0;
          for (int j = 0; j < level; j++) {
            bubbles.add(new Bubble(60, 400 + ((distBetweenBubs * level) / 2) - distBetweenBubs * j, 350, (int)pow(-1, j), sf));
          }
        }
        if (endGame == true) {
          background(100);
          fill(255, 0, 0);
          textSize(70);
          text("Game Over", 315, 400);

          fill(0);
          stroke(255);
          rect(360, 470, 250, 100);

          fill(255);
          textSize(25);
          text("Click to restart!", 385, 525);
        }
      }
    }
  }
}

void drawStuff(){
  fill(0);
          textSize(20);
          text("Active Powerups", 815, 40);

          fill(255);
          stroke(0);
          rect(820, 50, 150, 100);

          fill(153, 38, 0);
          stroke(153, 38, 0);
          rect(0, 711, 1000, 75);
          stroke(255);

          line(0, 715, 1000, 715);
          line(0, 725, 1000, 725);
          line(0, 735, 1000, 735);
          line(0, 745, 1000, 745);
          fill(255);
}

void powerupStuff() {
  if (!finnaSpawn.canBeDisplayed()) {
    if (random(chanceOfSpawn) < 1) {
      makeAPup();
    }
  } else {
    finnaSpawn.show();
    thread("poweritup");
  }
}

void doYaBubbleThang() {
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

    bubbleHarpoon();
    bubblePlayer();
  }
}

void bubblePlayer() {
  if (bub.dist(p.currentPos()) <= (bub.size() * 1.02)) {
    if (p.dieable()) {
      p.isAlive = false; 
      endGame = true;
    }
  }
}

void bubbleHarpoon() {
  PVector wya = bub.getCoords();
  PVector aqui = h.endPoint();
  boolean touchingLine = abs((wya.x - aqui.x) / ((wya.x + aqui.x) / 2)) <= .02;
  if (h.dos) {
    PVector donde = h.thatOtherOne();
    touchingLine = touchingLine || abs((wya.x - donde.x) / ((wya.x + donde.x) / 2)) <= .02;
  }
  if (touchingLine && wya.y >= aqui.y) {
    h.reset();
    if (bub.size()/2 > 10) {
      Bubble[] children = bub.split();
      bubbles.add(children[0]);
      bubbles.add(children[1]);
    }
    bubbles.remove(bub);
  }
}

void harpoonShoot() {
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

  if (waitforstart) {
    if (mouseX <= 500) {
      mode = 0;
    } else {
      mode = 1;
    }
    bubbles.add(new Bubble(60, sf));
    waitforstart = false;
    gameStarted = true;
    endGame = false;
  }
  if (!gameStarted) {
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

  if (endGame) {
    print("(" + mouseX + ", " + mouseY + ")" + "\n");
    if (mouseX <= 610 && mouseX >= 360 && mouseY >= 470 && mouseY <= 570) {
      gameStarted = false;
      endGame = false;
    }
    setup();
  }
}

void startGame(int diff) {
  print("aha");
  bg = loadImage("secondscreen.png");
  background(bg);
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
  waitforstart = true;
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