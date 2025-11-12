float scaleFactor = 1.0;
float scaleDirection = 0.01;
float offset = 0;
float offsetDirection = 0.5;

void setup() {
  size(410, 410);
}

void draw() {
  background(75);

  // Update scale factor (limit between 0.8 and 1.2)
  scaleFactor += scaleDirection;
  if (scaleFactor > 1.2 || scaleFactor < 0.8) {
    scaleDirection *= -1;
  }

  // Update offset (limit between -10 and 10)
  offset += offsetDirection;
  if (offset > 10 || offset < -10) {
    offsetDirection *= -1;
  }

  // Center and transform drawing
  translate(width / 2, height / 2);
  scale(scaleFactor);
  translate(-width / 2 + offset, -height / 2 + offset);

  stroke(255);
  strokeWeight(4);

  // Use while loop to draw your original lines
  int i = 0;
  while (i < 8) {
    if (i == 0) line(50, 50, 350, 350);
    else if (i == 1) line(350, 50, 50, 350);
    else if (i == 2) line(50, 50, 350, 50);
    else if (i == 3) line(350, 50, 350, 350);
    else if (i == 4) line(350, 350, 50, 350);
    else if (i == 5) line(50, 350, 50, 50);
    else if (i == 6) line(200, 50, 200, 350);
    else if (i == 7) line(50, 200, 350, 200);
    i++;
  }
}
