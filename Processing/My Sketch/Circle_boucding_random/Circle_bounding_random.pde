float x, y, s, direction;
void setup() {
  size(300, 300);
  x=height/2;
  y=width/2;
  s=1;
  direction=1;
  smooth();
  noFill();
  stroke(255);
}
void drawCircle(float xCircle, float yCircle, float sizeCircle) {
  ellipse(x, y, sizeCircle, sizeCircle);
}
void draw() {
  background(0);
  drawCircle(x, y, s);
  if (collision(x, y, s)) {
    direction=direction * -1;
  }
  s=s+direction;
  if (s<1) {
    direction=1;
    x=random(width);
    y=random(height);
  }
}
boolean collision(float xCentre, float yCentre, float sizeObject) {
  if (xCentre+sizeObject/2>width || xCentre-sizeObject/2<0 || yCentre+sizeObject/2>height || yCentre-sizeObject/2<0) {
    print("collision");
    return true;
  } else {
    return false;
  }
}
