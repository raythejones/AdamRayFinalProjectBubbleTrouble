class Harpoon{
  int harposition;

Harpoon(int PosValue){
harposition = PosValue;
}


void display(){
  
}

void setX(int xVal){
  harposition = xVal;
}

void moveUp(){
  stroke(255);
  line(harposition,650,harposition,0);
}
}