PImage flower 

void setup () {
  size (640,360); 
  flower = loadImage ("flower.jpg"); 
}

void draw () {
  background (255); 
  image (flower,0,0); 
}
