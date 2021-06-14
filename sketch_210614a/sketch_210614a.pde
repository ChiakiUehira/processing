
int tileCount = 20;
int rectSize = 30;
int actRandomSeed = 0;

void setup(){
  size(600, 600);
}



void draw() {

  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  smooth();
  noStroke();

  fill(192,100,64,60);

  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int posX = width/tileCount * gridX;
      int posY = height/tileCount * gridY;

      float shiftX1 = mouseX/20 * random(-1, 1);
      float shiftY1 = mouseY/20 * random(-1, 1);
      float shiftX2 = mouseX/20 * random(-1, 1);
      float shiftY2 = mouseY/20 * random(-1, 1);
      float shiftX3 = mouseX/20 * random(-1, 1);
      float shiftY3 = mouseY/20 * random(-1, 1);
      float shiftX4 = mouseX/20 * random(-1, 1);
      float shiftY4 = mouseY/20 * random(-1, 1);
     
      beginShape();
      vertex(posX+shiftX1, posY+shiftY1);
      vertex(posX+rectSize+shiftX2, posY+shiftY2);
      vertex(posX+rectSize+shiftX3, posY+rectSize+shiftY3);
      vertex(posX+shiftX4, posY+rectSize+shiftY4);
      endShape(CLOSE);
    }
  } 
  
}


void mousePressed() {
  actRandomSeed = (int) random(100000);
}
