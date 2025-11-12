import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*; 


import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage happy;
PImage sad; 
PImage neutral; 
PImage angry; 
PImage thumbsup;
PImage thumbsdown; 

float happyX = 50;
float happyY = 50;
float happyWidth = 150;
float happyHeight = 150;
float sadX = 1000;
float sadY = 50;
float sadWidth = 140;
float sadHeight = 140; 
float neutralX = 50; 
float neutralY = 600;
float neutralWidth = 140;
float neutralHeight = 140; 
float angryX = 1000; 
float angryY = 600;
float angryWidth = 140;
float angryHeight = 140;  
float thumbsupX = 50; 
float thumbsupY = 300;
float thumbsupWidth = 150;
float thumbsupHeight = 150; 
float thumbsdownX = 1000;
float thumbsdownY = 350;
float thumbsdownWidth = 150;
float thumbsdownHeight = 150; 

boolean playAnim = false;
float s = 150;

void setup () {
  size (1200, 800);
  happy = loadImage("happy.png");
  sad = loadImage("sad.png");
  neutral = loadImage("neutral.png");
  angry = loadImage("angry.png");
  thumbsup = loadImage("thumbsup.png");
  thumbsdown = loadImage("thumbsdown.png");
  
  minim = new Minim(this);
  player = minim.loadFile("life.mp3");
  player.play(); 
}

void draw () {
  background(0); 
   // Timeline bar
  
  float progress = map(player.position(), 0, player.length(), 0, width);
  fill(255);
  rect(0, height - 50, width, 20); // background bar
  fill(0, 255, 0);
  rect(0, height - 50, progress, 20); // progress bar
  
  fill (50);
  rect(260, 180, 675, 425);
  image(happy, happyX, happyY, happyWidth, happyHeight);
  image(sad, sadX, sadY, sadWidth, sadHeight);
  image(neutral, neutralX, neutralY, neutralWidth, neutralHeight);
  image(angry, angryX, angryY, angryWidth, angryHeight); 
  image(thumbsup, thumbsupX, thumbsupY, thumbsupWidth, thumbsupHeight);
  image(thumbsdown, thumbsdownX, thumbsdownY, thumbsdownWidth, thumbsdownHeight);
  if (playAnim)
  {
    for (int i = 0; i < 150; i++)
    {
        drawCircle(600, 400, s);
        s = s+1;
    }
  }
  
}

void mouseClicked(){
  if( mouseX > happyX && mouseX < (happyX + happyWidth) &&
      mouseY > happyY && mouseY < (happyY + happyHeight)) {
        playAnim = true;
    }
    
  if( mouseX > sadX && mouseX < (sadX + sadWidth) &&
      mouseY > sadY && mouseY < (sadY + sadHeight)) {
        playAnim = true;
    }
}

  void drawCircle(float xCircle, float yCircle, float sizeCircle) { 
    noFill();                 
    stroke(255);              
    strokeWeight(2); 
    ellipse(xCircle, yCircle, sizeCircle, sizeCircle); 
  }
  
void mousePressed() {
  if (mouseY > height - 50 && mouseY < height - 30) {
    float newPosition = map(mouseX, 0, width, 0, player.length());
    player.cue((int)newPosition);
  }
}
