
int tileCountX = 50;
int tileCountY = 10;

int[] hueValues = new int[tileCountX];
int[] saturationValues = new int[tileCountX];
int[] brightnessValues = new int[tileCountX];

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  for (int i = 0; i <tileCountX; i++) {
    hueValues[i] =(int) random(0, 100);
    saturationValues[i] = (int) random(0, 100);
    brightnessValues[i] = (int) random(0, 100);
  }
}

void draw() {
  background(0, 0, 100);
  int counter = 0;

  int currentTileCountX = (int) map(mouseX, 0, width, 1, tileCountX);
  int currentTileCountY = (int) map(mouseY, 0, height, 1, tileCountY);
  float tileWidth = width / (float) currentTileCountX;
  float tileHeight = height / (float) currentTileCountY;

  for (int gridY = 0; gridY <tileCountY; gridY++) {
    for (int gridX = 0; gridX < tileCountX; gridX++) {
      float posX = tileWidth*gridX;
      float posY = tileHeight * gridY;
      int index = counter % currentTileCountX;

      fill(hueValues[index], saturationValues[index], brightnessValues[index]);
      rect(posX, posY, tileWidth, tileHeight);
      counter++;
    }
  }
}
