float posX, posY, angle;
int count=1;
float decX=0, decA=0;
void setup(){
size(300,300);
posY=height-22;
posX=width/2;
}
void draw(){
if (posY>0){
background(0);
drawRocket(posX,posY,angle);
if (count>5){
count=1;
decX=random(-3,+3);
decA=random(-0.1,+0.1);
}
posY--;
posX+=decX;
angle=+decA;
count++;
}
}
void drawRocket(float x, float y, float rot) {
final int halfHeight = 10;
final int halfWidth = 10;
pushMatrix();
translate(x, y);
rotate(rot);
triangle(0, -halfHeight, -halfWidth, halfHeight, halfWidth, halfHeight);
rectMode(CORNERS);
rect(-halfWidth + 5, halfHeight, -halfWidth + 8, halfHeight + 3);
rect(halfWidth - 8, halfHeight, halfWidth - 5, halfHeight + 3);
popMatrix();
}
