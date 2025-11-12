  PImage happy; 
  PImage face; 
  float happyX = 400;
  float happyY = 300;
  float happyWidth = 50;
  float happyHeight = 50; 
  float faceX = 200;
  float faceY = 500;
  float faceWidth = 50;
  float faceHeight = 50; 
  boolean playAnim = false;
  float s = 50;
void setup () {
  size (800, 600); 
happy = loadImage("hugging-face.png");
face = loadImage("face-copy.png"); 
}

void draw () {
  background(255); 
  image(happy, happyX, happyY, happyWidth, happyHeight); 
  image(face, faceX, faceY, faceWidth, faceHeight); 
  if (playAnim)
  {
    for (int i = 0; i < 100; i++)
    {
        drawCircle(mouseX, mouseY, s);
        s = s+1;
    }
  }
  
}

void mouseClicked(){
  if( mouseX > happyX && mouseX < (happyX + happyWidth) &&
      mouseY > happyY && mouseY < (happyY + happyHeight)) {
        playAnim = true;
    }
    
  if( mouseX > faceX && mouseX < (faceX + faceWidth) &&
      mouseY > faceY && mouseY < (faceY + faceHeight)) {
        println("sad");
    }
}

  void drawCircle(float xCircle, float yCircle, float sizeCircle) {
    ellipse(xCircle, yCircle, sizeCircle, sizeCircle);
  }
