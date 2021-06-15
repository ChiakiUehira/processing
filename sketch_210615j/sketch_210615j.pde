
PFont font;
PShape[] modules;

float tileSize = 30;
int gridResolutionX, gridResolutionY;
char [][] tiles;

boolean drawGrid = true;
boolean debugMode = false;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  cursor(CROSS);
  font = createFont("sans-serif", 8);
  textFont(font, 8);
  textAlign(CENTER, CENTER);

  gridResolutionX = round(width/tileSize)+2;
  gridResolutionY = round(height/tileSize)+2;
  tiles = new char[gridResolutionX][gridResolutionY];
  initTiles();

  modules = new PShape[16];
  for (int i = 0; i < modules.length; i++) {
    modules[i] = loadShape(nf(i,2)+".svg");
  }
}

void draw() {
  background(255);
  if (mousePressed && (mouseButton ==LEFT)) setTile();
  if (mousePressed && (mouseButton == RIGHT)) unsetTile();

  if (drawGrid) drawGrid();
  drawModules();
}

void initTiles() {
  for (int gridY = 0; gridY < gridResolutionY; gridY++) {
    for (int gridX = 0; gridX < gridResolutionX; gridX++) {
      tiles[gridX][gridY] = '0';
    }
  }
}

void setTile() {
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY] = '1';
}

void unsetTile() {
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionY-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY] = '0';
}

void drawGrid() {
  rectMode(CENTER);
  for (int gridY = 0; gridY < gridResolutionY; gridY++) {
    for (int gridX = 0; gridX < gridResolutionX; gridX++) {
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      strokeWeight(0.15);
      fill(255);
      if (debugMode) {
        if (tiles[gridX][gridY] == '1') fill(220);
      }
      rect(posX, posY, tileSize, tileSize);
    }
  }
}

void drawModules() {
  shapeMode(CENTER);
  for (int gridY = 1; gridY < gridResolutionY-1; gridY++) {
    for (int gridX = 0; gridX < gridResolutionX-1; gridX++) {
      if (tiles[gridX][gridY] == '1') {
        String east = str(tiles[gridX+1][gridY]);
        String south = str(tiles[gridX][gridY+1]);
        String west = str(tiles[gridX-1][gridY]);
        String north = str(tiles[gridX][gridY-1]);
        String binaryResult = north + west + south + east;
        int decimalResult = unbinary(binaryResult);

        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;

        shape(modules[decimalResult], posX, posY, tileSize, tileSize);

        if (debugMode) {
          fill(150);
          text(decimalResult+"\n"+binaryResult, posX, posY);
        }
      }
    }
  }
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) initTiles();
  if (key == 'g' || key == 'G') drawGrid = !drawGrid;
  if (key == 'd' || key == 'D') debugMode = !debugMode;
}

