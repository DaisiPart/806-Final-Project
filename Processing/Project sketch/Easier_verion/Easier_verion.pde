import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage[] images = new PImage[6];
EmotionImage[] emotionImages = new EmotionImage[6];

void setup() {
  size(1200, 800);

  // Load images
  images[0] = loadImage("happy.png");
  images[1] = loadImage("sad.png");
  images[2] = loadImage("neutral.png");
  images[3] = loadImage("angry.png");
  images[4] = loadImage("thumbsup.png");
  images[5] = loadImage("thumbsdown.png"); 
  
  minim = new Minim(this);
  player = minim.loadFile("life.mp3");
  player.play(); 

  // Initialize EmotionImage objects
  emotionImages[0] = new EmotionImage(images[0], 50, 50, 150, 150);     // happy
  emotionImages[1] = new EmotionImage(images[1], 1000, 50, 140, 140);   // sad
  emotionImages[2] = new EmotionImage(images[2], 50, 600, 140, 140);    // neutral
  emotionImages[3] = new EmotionImage(images[3], 1000, 600, 140, 140);  // angry
  emotionImages[4] = new EmotionImage(images[4], 50, 300, 150, 150);    // thumbsup
  emotionImages[5] = new EmotionImage(images[5], 1000, 350, 150, 150);  // thumbsdown
}

void draw() {

background(0);

   // Timeline bar
  
  float progress = map(player.position(), 0, player.length(), 0, width);
  fill(255);
  rect(0, height - 50, width, 20); // background bar
  fill(0, 255, 0);
  rect(0, height - 50, progress, 20); // progress bar

  fill (50);
  rect(260, 180, 675, 425);
  for (EmotionImage ei : emotionImages) {
    ei.display();
  }
}

class EmotionImage {
  PImage img;
  float x, y, w, h;

  EmotionImage(PImage img, float x, float y, float w, float h) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    image(img, x, y, w, h);
  }

  boolean isClicked(float mx, float my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }
}

void mouseClicked() {
  for (int i = 0; i < emotionImages.length; i++) {
    if (emotionImages[i].isClicked(mouseX, mouseY)) {
      println("Clicked on emoji: " + i);
      // Example action: play animation or change music
      if (i == 0) {
        println("Happy clicked!");
      } else if (i == 1) {
        println("Sad clicked!");
      }
      // You can trigger animations or change tracks here
    }
  }
}
