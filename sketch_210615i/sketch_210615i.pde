
float x = 0, y = 0;
float stepSize = 5.0;
float moduleSize = 25;

PShape lineModule;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  smooth();
  x = mouseX;
  y = mouseY;
  cursor(CROSS);
  lineModule = loadShape("01.svg");
}

void draw() {
  if (mousePressed) {
    float d = dist(x, y, mouseX, mouseY);
    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(angle+PI);
      shape(lineModule, 0, 0, d, moduleSize);
      popMatrix();

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
}

void mousePressed () {
  x = mouseX;
  y = mouseY;
}

void keyReleased () {
  if (key == DELETE || key == BACKSPACE) background(255);

  // load svg for line module
  if (key=='1') lineModule = loadShape("01.svg");
  if (key=='2') lineModule = loadShape("02.svg");
  if (key=='3') lineModule = loadShape("03.svg");
  if (key=='4') lineModule = loadShape("04.svg");
  if (key=='5') lineModule = loadShape("05.svg");
  if (key=='6') lineModule = loadShape("06.svg");
  if (key=='7') lineModule = loadShape("07.svg");
  if (key=='8') lineModule = loadShape("08.svg");
  if (key=='9') lineModule = loadShape("09.svg");
}

void keyPressed() {
  if(key == CODED) {
    // moduleSize ctrls arrowkeys up/down 
    if (keyCode == UP) moduleSize += 5;
    if (keyCode == DOWN) moduleSize -= 5; 
    // stepSize ctrls arrowkeys left/right
    stepSize = max(stepSize,0.5);   
    if (keyCode == LEFT) stepSize -= 0.5;
    if (keyCode == RIGHT) stepSize += 0.5; 
    println("moduleSize: "+moduleSize+"  stepSize: "+stepSize);
    
    
  }
  
}
