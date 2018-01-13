import java.util.Random;

class Food {
 float x;
 float y;
 float size = 10;
  
 Random randomGenerator = new Random();
 
 //Constructor
 Food(float x, float y, float size) {
   this.x = x;
   this.y = y;
   this.size = size;
 }
 
 public int a, b, c;
 
 void colors() {
  fill(255, 255, 255);
  int randomInt = randomGenerator.nextInt(7); 
  switch(randomInt) {
   case 0:
    //Red
    a = 255;
    b = 0;
    c = 0;
    break;  
   case 1:
    //Green
    a = 0;
    b = 255;
    c = 0;
    break;
   case 2:
    //Blue
    a = 0;
    b = 255;
    c = 0;
    break;
   case 3:
    //Yellow
    a = 255;
    b = 255;
    c = 0;
    break;
   case 4:
    //Orange
    a = 255;
    b = 128;
    c = 0;
    break;
   case 5:
    //Purple
    a = 153;
    b = 0;
    c = 153;
    break;
   case 6:
    //Pink
    a = 255;
    b = 0;
    c = 153;
    break;
  }
 }
 
 public void display() {
  fill(a, b, c);
  stroke(a-53, b-53, c-53);
  strokeWeight(3); 
  ellipse(x, y, size, size);
 }
}
