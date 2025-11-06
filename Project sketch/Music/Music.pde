import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(1200, 800);
  minim = new Minim(this);
  player = minim.loadFile("life.mp3");
  player.play();
}


void draw() {
  background(0);

  // Timeline bar
  float progress = map(player.position(), 0, player.length(), 0, width);
  fill(255);
  rect(0, height - 50, width, 20); // background bar
  fill(0, 255, 0);
  rect(0, height - 50, progress, 20); // progress bar
}

void mousePressed() {
  if (mouseY > height - 50 && mouseY < height - 30) {
    float newPosition = map(mouseX, 0, width, 0, player.length());
    player.cue((int)newPosition);
  }
}
