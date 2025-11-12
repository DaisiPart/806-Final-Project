float x, y, s;
void setup() {
  size(300, 300);
  x=height/2;
  y=width/2;
  s=1;
  smooth();
  noFill();
  stroke(255);
}
void drawCircle(float xCircle, float yCircle, float sizeCircle) {
  ellipse(xCircle, yCircle, sizeCircle, sizeCircle);
}
void draw() {
  background(0);
  drawCircle(x, y, s);
  s=s+1;
}
