Car[] myCars= new Car[100];
void setup() {
  size(300, 150);
  for (int i=0; i<myCars.length; i++) {
    myCars[i] = new Car(color(random(0, 255), random(0, 255),
      random(0, 255)), 0, random(0, 150), random(0, 3));
  }
}
void draw() {
  background(185);
  for (int i=0; i<myCars.length; i++) {
    myCars[i].drive();
    myCars[i].display();
  }
}
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  Car(color tempC, float tempXpos,
    float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
    stroke(0); 
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
