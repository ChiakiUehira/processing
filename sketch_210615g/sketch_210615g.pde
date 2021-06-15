
int drawMode = 1;
color col = color(random(255), random(255), random(255), random(100));
float x = 0, y = 0;
float stepSize = 5.0;
float lineLength = 25;

void setup () {
  size(displayWidth, displayHeight);
  background(255);
  smooth();
  x = mouseX;
  y = mouseY;
  cursor(CROSS);
}

void draw() {
  if(mousePressed) {
    float d = dist(x, y, mouseX, mouseY);
    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      stroke(col);
      if (frameCount % 2 == 0) stroke(150);
      line(0, 0, 0, lineLength*random(0.95, 1.0) * d / 10);
      popMatrix();

      if (drawMode == 1) {
        x = x + cos(angle) * stepSize;
        y = y + sin(angle) * stepSize;
      } else {
        x = mouseX;
        y = mouseY;
      }
    }
  }
}

void mousePressed () {
  x = mouseX;
  y = mouseY;
  col = color(random(255), random(255), random(255), random(100));
}

void keyReleased () {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
}

void keyPressed() {
  // lineLength ctrls arrowkeys up/down 
  if (keyCode == UP) lineLength += 5;
  if (keyCode == DOWN) lineLength -= 5; 
}
