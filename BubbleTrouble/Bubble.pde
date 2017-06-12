class Bubble {
  private int size;
  private PVector velocity, coords;
  int splitFac;

  Bubble(int syz, int split) {
    size = syz;   
    splitFac = split;
    velocity = new PVector(3, -1 * pow(size, .7));
    coords = new PVector(150, 711 - pow(size, .7));
    fill(255, 102, 0);
  }

  Bubble(int syz, float x, float y, int xdirection, int split) {
    size = syz;   
    splitFac = split;
    velocity = new PVector(3 * xdirection, -3);
    coords = new PVector(x, y);
  }

  Bubble[] split() {
    return new Bubble[]{new Bubble(splitFac * size/6, coords.x - 10, coords.y, -1, splitFac), new Bubble(splitFac * size/6, coords.x + 10, coords.y, 1, splitFac)};
  }

  void setSplit(int split) {
    splitFac = split;
  }

  void bounce() {

    if (coords.x > width-size/2 || coords.x < size/2) {
      velocity.x *= -1;
    }
    if (coords.y > 711 - (size * .7)) {
      coords.y = 711 - (size * .7);
      velocity.y = -1 * pow(size, .7);  //<>//
    } //<>//
    velocity.y += .25;   //<>//
    coords.add(velocity);
    ellipse(coords.x, coords.y, size, size); 
     //<>//
  } //<>//
 //<>//
  PVector getCoords() {
    return coords;
  }

  void setX(float ex) {
    coords.x = ex;
  }  

  float dist(PVector other) {
    return coords.dist(other);
  }

  void display(int x, int y) {
    coords.x = x;
    coords.y = y;
    ellipse(coords.x, coords.y, pow(2, size), pow(2, size));
  }
  int size() {
    return size;
  }
} 