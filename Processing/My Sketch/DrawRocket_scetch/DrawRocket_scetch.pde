int altitude, startX;

void setup() {
  size(300, 300);
  altitude=height-22;
  startX=width/2;
}

void draw() {
  if (altitude>0) {
    background(0);
    drawRocket(startX, altitude);
    altitude--;
  }
}

void drawRocket(int noseX, int noseY) {
  int bottomOfRocket = noseY + 20;
  int leftOfRocket = noseX - 10;
  int rightOfRocket = noseX + 10;
  fill(255);
  triangle(noseX, noseY, leftOfRocket, bottomOfRocket, rightOfRocket,
    bottomOfRocket);
  rectMode(CORNERS);
  rect(leftOfRocket + 5, bottomOfRocket, leftOfRocket + 8, bottomOfRocket + 3);
  rect(rightOfRocket - 8, bottomOfRocket, rightOfRocket - 5, bottomOfRocket + 3);
}
