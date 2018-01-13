import java.util.Random;

int score = 0;
float player1X = 350;
float player1Y = 300;
int player1Size = 50;
int player1Score = 0;
float player1Speed = 4;
//To-do: prevent players from drifting off the screen, add pvp

int player2Score = 0;
float player2X = 1050;
float player2Y = 296;
int player2Size = 50;
float player2Speed = 4;

boolean player1Left, player1Right, player1Up, player1Down = false;
boolean player2Left, player2Right, player2Up, player2Down = false;


ArrayList<Food> foods = new ArrayList<Food>();
Food f;
void setup() {
  size(1280, 700);
  frameRate(60);
  background(255, 255, 255);

/* for(int i=0; i<140; i++) {
    for(int j=0; j<80; j++) {
      Food f = new Food(10+(i*40), 10+(j*40), 10);
      f.colors();
      foods.add(f);
    }
  } */ 
}

void draw() {
  background(255, 255, 255);
  drawLines();
  
  player1Score = player1Size;
  player2Score = player2Size;
  
  player1Speed = 4 - (player1Size / 200);
  player2Speed = 4 - (player2Size / 200);
  
  if(player1Speed <= 0) {
   player1Speed = 1;
  } 
  if(player2Speed <= 0) {
   player2Speed = 1;
  }
  
  Food m;
  for(int i = 0; i < foods.size(); i++) {
    m = foods.get(i);
    
    if(dist(player1X, player1Y, m.x, m.y) < player1Size/2) {
     player1Size += 1.5;
     foods.remove(i); 
    } else if(dist(player2X, player2Y, m.x, m.y) < player2Size/2) {
     player2Size += 1.5;
     foods.remove(i); 
    }
    else {
      m.display();
    }
  }
      
    float ten1 = 10*(player1Size*0.05);
    float ten2 = 10*(player2Size*0.05);
      
    if(abs(player1X - player2X) < ten1 && abs(player1Y - player2Y) < ten1 && player1Size > ((player1Size/10) + player2Size)) {
      player1Size += player2Size;
      player2Size -= player2Size;
      player2Speed = 0;
      player1X = 350;
      player1Y = 300;
      player2X = 1050;
      player2Y = 296;
      player2Size = 50;
      player2Speed = 4;
    }  else if (abs(player2X - player1X) < ten2 && abs(player2Y - player1Y) < ten2 && player2Size > ((player2Size/10) + player1Size)) {
      player2Size += player1Size;
      player1Size -= player1Size;
      player1Speed = 0;
      player1X = 350;
      player1Y = 300;
      player2X = 1050;
      player2Y = 296;
      player1Size = 50;
      player1Speed = 4;
    }
    
  if(player1X > width) {
    player1X = width; 
   }
   if(player1X < 0) {
    player1X = 0; 
   }
   if(player1Y > height) {
    player1Y = height; 
   }
   if(player1Y < 0) {
     player1Y = 0;  
   }
   
   if(player2X > width) {
    player2X = width; 
   }
   if(player2X < 0) {
    player2X = 0; 
   }
   if(player2Y > height) {
    player2Y = height; 
   }
   if(player2Y < 0) {
     player2Y = 0;  
   }
      
   if(frameCount%4==0) {
      float xx = random(0, width);
      float yy = random(0, width);
      while(dist(xx, yy, player1X, player1Y) < player1Size/2) {
       xx = random(0, width);
       yy = random(0, width); 
      }
    
    Food f = new Food(xx, yy, 10);
    foods.add(f);
    f.colors();
    f.display();
   }
  
   if(player1Up) {
    player1Y -= player1Speed; 
   }
   if(player1Left) {
    player1X -= player1Speed; 
   }
   if(player1Right) {
    player1X += player1Speed; 
   }
   if(player1Down) {
    player1Y += player1Speed; 
   }
  
   if(player2Up) {
    player2Y -= player2Speed; 
   }
   if(player2Left) {
    player2X -= player2Speed; 
   }
   if(player2Right) {
    player2X += player2Speed; 
   }
   if(player2Down) {
    player2Y += player2Speed; 
   }
  
   if(player1Size > player2Size) {
   displayPlayer2();
   displayPlayer1(); 
   } else {
   displayPlayer1();
   displayPlayer2();
   }
  
   textSize(18);
   fill(0, 0, 0);
   //New dimensions 1280, 700
   text("P1 Mass: " + player1Score, 5, 695);
   text("P2 Mass: " + player2Score, 1150, 695);
 }

void drawLines() {
 for(int i=0; i<height; i+=20) {
   fill(0, 204, 204);
   strokeWeight(2);
   stroke(0, 204, 204);
   line(0, i, width, i); 
   noStroke();
 }
 
 for(int j=0; j<width; j+=20) {
   fill(0, 204, 204);
   strokeWeight(2);
   stroke(0, 204, 204);
   line(j, 0, j, height); 
   noStroke();
  } 
}

void displayPlayer1() {
 pushMatrix();
  //translate(player1X, player1Y);
  fill(255, 0, 0);
  stroke(255-53, 0, 0);
  strokeWeight(2+(player1Size * 0.05));
  ellipse(player1X, player1Y, player1Size, player1Size);
  noStroke();
  popMatrix(); 
}

void displayPlayer2() {
  pushMatrix();
  //translate(player2X, player2Y);
  fill(0, 0, 255);
  stroke(0, 0, 255-53);
  strokeWeight(2+(player2Size * 0.05));
  ellipse(player2X, player2Y, player2Size, player2Size);
  noStroke();
  popMatrix();
}

void keyPressed() { 
  
  switch(key) {
   case 'w':
     player1Up = true;
     break;
   case 'a':
     player1Left = true;
     break;
   case 's':
     player1Down = true;
     break;
   case 'd':
     player1Right = true;
     break;
  }
  
  switch(key) {
   case 'i':
     player2Up = true;
     break;
   case 'j':
     player2Left = true;
     break;
   case 'k':
     player2Down = true;
     break;
   case 'l':
     player2Right = true;
     break; 
  }
}

void keyReleased() {
 switch(key) {
  case 'w':
   player1Up = false;
   break;
  case 'a':
   player1Left = false;
   break;
  case 's':
   player1Down = false;
   break;
  case 'd':
   player1Right = false;
   break;
 } 
 
 switch(key) {
  case 'i':
   player2Up = false;
   break;
  case 'j':
   player2Left = false;
   break;
  case 'k':
   player2Down = false;
   break;
  case 'l':
   player2Right = false;
   break; 
 }
}