
float angle = 0;

void setup() {
  size(400, 400);
  background(75);
}

void draw() {
  background(75); // Clear the canvas each frame
  translate(width/2, height/2); // Move origin to center
  rotate(angle); // Rotate everything by 'angle'

  stroke(255);
  strokeWeight(4);

// Draw lines relative to center
  line(-150, -150, 150, 150);
  line(150, -150, -150, 150); 
  line(-150, -150, 150, -150);
  line(150, -150, 150, 150);
  line(150, 150, -150, 150);
  line(-150, 150, -150, -150);
  line(0, -150, 0, 150);
  line(-150, 0, 150, 0); 

  angle += 0.01; // Increment angle for rotation
}
