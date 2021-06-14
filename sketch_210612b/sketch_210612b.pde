
import processing.opengl.*;

float tileCount = 20;
color moduleColor = color(0);
int moduleAlpha = 180;
int actRandomSeed = 0;
int maxDistance = 500;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(255);
  smooth();
  noFill();

  randomSeed(actRandomSeed);

  stroke(moduleColor, moduleAlpha);
  strokeWeight(3);

  for (int gridY = 0; gridY < width; gridY+=25) {
    for (int gridX = 0; gridX < height; gridX+=25) {
      float diameter = dist(mouseX, mouseY, gridX, gridY);
      diameter = diameter/maxDistance* 40;
      pushMatrix();
      translate(gridX, gridY, diameter*5);
      rect(0, 0, diameter, diameter);
      popMatrix();
    }
  }
}

void mousePressed () {
  actRandomSeed = (int) random(100000);
}
