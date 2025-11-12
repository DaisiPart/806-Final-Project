// A1-10 Define a method that draws a shape or form using a loop. The method should take three arguments to control its position and size. Demonstrate that method by creating many such shapes on the display window in a static or dynamic arrangement.

void setup() {
  size(800, 800);
  background(75);
  frameRate(4);
}

void drawMyShape(int x, int y, int size)
{
  for (int i = 0; i < 200; i++)
  {
     circle(x, y, size/(i + 1));
  }
}

int i = 1;
int x;
int y = 50;

void draw()
{
  if (i > 7)
  {
    y += 100;
    i = 1;
  }
  
  drawMyShape(100 * i, y, 100);
  i++;
  
  if (y >= 700) 
  {
    noLoop();
  }
}
