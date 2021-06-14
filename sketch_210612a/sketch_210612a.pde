
color moduleColorBackground = color(0);
color moduleColorForeground = color(255);

color moduleAlphaBackground = 100;
color moduleAlphaForeground = 100;

float moduleRadiusBackground = 30;
float moduleRadiusForeground = 15;

color backColor = color(255);

float tileCount = 20;
int actRandomSeed = 0;

void setup() {
  size(600, 600);
}

void draw() {
  translate(width/tileCount/2, height/tileCount/2);

  colorMode(HSB, 360, 100, 100, 100);
  background(backColor);
  smooth();
  noStroke();

  randomSeed(actRandomSeed);

  for (int gridY = 0; gridY < tileCount; gridY++) {
    for (int gridX = 0; gridX < tileCount; gridX++) {
      float posX = width/tileCount*gridX;
      float posY = height/tileCount*gridY;

      float shiftX = random(-1, 1) * mouseX / 20;
      float shiftY = random(-1, 1) * mouseY / 20;

      fill(moduleColorBackground, moduleAlphaBackground);
      ellipse(posX+shiftX, posY+shiftY, moduleRadiusBackground, moduleRadiusBackground);
    }
  }

  for (int gridY = 0; gridY < tileCount; gridY++) {
    for (int gridX = 0; gridX < tileCount; gridX++) {
      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      fill(moduleColorForeground, moduleAlphaForeground);
      ellipse(posX, posY, moduleRadiusForeground, moduleRadiusForeground);
    }
  }
}

void mousePressed () {
  actRandomSeed = (int) random(100000);
}

void keyReleased(){
  if (key == '1'){
    if (moduleColorBackground == color(0)) {
      moduleColorBackground = color(273, 73, 51);
    } 
    else {
      moduleColorBackground = color(0);
    } 
  }
  if (key == '2'){
    if (moduleColorForeground == color(360)) {
      moduleColorForeground = color(323, 100, 77);
    } 
    else {
      moduleColorForeground = color(360);
    } 
  }

  if (key == '3'){
    if (moduleAlphaBackground == 100) {
      moduleAlphaBackground = 50;
      moduleAlphaForeground = 50;
    } 
    else {
      moduleAlphaBackground = 100;
      moduleAlphaForeground = 100;
    } 
  }


  if (key == '0'){  
    moduleColorBackground = color(0);
    moduleColorForeground = color(360);
    moduleAlphaBackground = 100;
    moduleAlphaForeground = 100;
    moduleRadiusBackground = 20;
    moduleRadiusForeground = 10;
  }

  if (keyCode == UP) moduleRadiusBackground += 2;
  if (keyCode == DOWN) moduleRadiusBackground = max(moduleRadiusBackground-2, 10);
  if (keyCode == LEFT) moduleRadiusForeground = max(moduleRadiusForeground-2, 5);
  if (keyCode == RIGHT) moduleRadiusForeground += 2;

}
