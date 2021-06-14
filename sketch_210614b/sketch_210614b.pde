
float tileCountX = 10;
float tileCountY = 10;
float tileWidth, tileHeight;

int count = 0;
int colorStep = 15;
int circleCount;
float endSize, endOffset;

int actRandomSeed = 0;

void setup() {
  size(800, 800);
  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
}

void draw() {
  noFill();
  stroke(0, 128);
  background(255);
  randomSeed(actRandomSeed);

  translate((width/tileWidth)/2, (height/tileHeight)/2);

  circleCount = mouseX / 30 + 1;
  endSize = map(mouseX, 0,width, tileWidth/2.0,0);
  endOffset = map(mouseY, 0,height, 0,(tileWidth-endSize)/2);

  for (int gridY=0; gridY<=tileCountY; gridY++) {
    for (int gridX=0; gridX<=tileCountX; gridX++) {  
      pushMatrix();
      translate(tileWidth*gridX, tileHeight*gridY);
      scale(1, tileHeight/tileWidth);

      int toggle = (int) random(0, 4);
      if (toggle == 0) rotate(-HALF_PI);
      if (toggle == 1) rotate(0);
      if (toggle == 2) rotate(HALF_PI);
      if (toggle == 3) rotate(PI);

      for(int i = 0; i < circleCount; i++) {
        float diameter = map(i, 0,circleCount-1, tileWidth,endSize);
        float offset = map(i, 0,circleCount-1, 0,endOffset);
        ellipse(offset, 0, diameter, diameter);
      }
      popMatrix();
    }
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}
