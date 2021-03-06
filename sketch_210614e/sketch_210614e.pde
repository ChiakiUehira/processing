
int NORTH = 0;
int NORTHEAST = 1;
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST = 7;

float stepSize = 1;
float diameter = 1;

float drawMode = 1;
int counter = 0;

int direction;
float posX, posY;

void setup() {
  size(550, 550);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  smooth();
  noStroke();
  posX = width/2;
  posY = height/2;
}

void draw() {
  for (int i=0; i<=mouseX; i++) {
    counter++;
    if (drawMode == 2) {
      direction = round(random(0, 3));
    } else {
      direction = (int) random(0, 7);
    }

    if (direction == NORTH) {
      posY -= stepSize;
    } else if (direction == NORTHEAST) {
      posX += stepSize;
      posY -= stepSize;
    } else if (direction == EAST) {
      posY += stepSize;
    } else if (direction == SOUTHEAST) {
      posX += stepSize;
      posY += stepSize;
    } else if (direction == SOUTH) {
      posY += stepSize;
    } else if (direction == SOUTHWEST) {
      posX -= stepSize;
      posY += stepSize;
    } else if (direction == WEST) {
      posX -= stepSize;
    } else if (direction == NORTHEAST) {
      posX -= stepSize;
      posY -= stepSize;
    }

    if (posX > width) posX = 0;
    if (posX < 0) posX = width;
    if (posY < 0) posY = height;
    if (posY > height) posY = 0;

    if (drawMode == 3) {
      if (counter >= 100) {
        counter = 0;
        fill(192, 100, 64, 80);
        ellipse(posX+stepSize/2, posY+stepSize/2, diameter+7, diameter+7);
      }
    }
    fill(0, 40);
    ellipse(posX+stepSize/2, posY+stepSize/2, diameter, diameter);
  }
}

void keyReleased() {
  if (key == '1') {
    drawMode = 1;
    stepSize = 1;
    diameter = 1;
  }
  if (key == '2') {
    drawMode = 2;
    stepSize = 1;
    diameter = 1;
  }
  if (key == '3') {
    drawMode = 3;
    stepSize = 10;
    diameter = 5;
  }
}
