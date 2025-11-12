float circleX; 
float circleY;

void setup () { 
  size (600,360); 
}

void draw () {
  background (255); 
  
  if ((mouseX > 100) && (mouseX < 500)) {
    fill (255,0,0); 
    ellipse (300,100,75,75); 
  }
  
  if ((mouseX > 200) && (mouseX < 400)) { 
    fill (0,255,0); 
    ellipse (300,250,75,75); 
  } 
  
  stroke (0); 
  strokeWeight (2);
  line (100,0,100, height); 
  line (200,0,200, height); 
  line (400,0,400, height); 
  line (500,0,500, height); 
}
