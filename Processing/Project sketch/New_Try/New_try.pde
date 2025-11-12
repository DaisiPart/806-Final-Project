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

boolean showAnimation = false;
float animationSize = 50;
boolean growing = true;

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

  // Center rectangle
  fill(50);
  stroke (255);
  strokeWeight (2);
  rect(260, 180, 675, 425);

  // Display emojis
  for (EmotionImage ei : emotionImages) {
    ei.display();
  }

  // Animation in center rectangle
  if (showAnimation) {
    float centerX = width / 2;
    float centerY = height / 2;
    noStroke();
    fill(255, 100, 100);
    ellipse(centerX, centerY, animationSize, animationSize);

    // Animate size
    if (growing) {
      animationSize += 2;
      if (animationSize > 100) growing = false;
    } else {
      animationSize -= 2;
      if (animationSize < 50) growing = true;
    }
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
      showAnimation = true; // Trigger animation
      animationSize = 50;   // Reset animation size
      growing = true;       // Reset animation direction
    }
  }
}
