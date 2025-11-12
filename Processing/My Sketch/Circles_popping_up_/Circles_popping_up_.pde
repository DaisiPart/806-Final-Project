void setup() {
 size(400, 400);
 frameRate(10);
 smooth();
 background(0);
 strokeWeight(2);
}


void draw() {
 float circleX  = random(0, width);
 float circleY = random(0, height);
 float Size = random(0, 400);
 float strokeRand = random(1, 6);
 float z = random(150, 255);
 float a = random(0, 80);
 float b = random(150, 255);
 
 noFill();
 stroke(z, a, b, 100);
 strokeWeight(strokeRand);
 ellipse (circleX, circleY, Size, Size);
}
