
color col = color(181, 157, 0, 100);
float lineLength = 0;
float angle = 0;
float angleSpeed = 1.0;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  smooth();
  cursor(CROSS);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    strokeWeight(1.0);
    noFill();
    stroke(col);
    translate(mouseX, mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 0);
    popMatrix();
    angle += angleSpeed;
  }
}

void mousePressed () {
  lineLength = random(70, 200);
}

void keyReleased () {
    // reverse direction and mirrow angle
  if (key=='d' || key=='D') {
    angle = angle + 180;
    angleSpeed = angleSpeed * -1;
  }

  // r g b alpha
  if (key == ' ') col = color(random(255), random(255), random(255), random(80, 150));

  //default colors from 1 to 4 
  if (key == '1') col = color(181, 157, 0, 100);
  if (key == '2') col = color(0, 130, 164, 100);
  if (key == '3') col = color(87, 35, 129, 100);
  if (key == '4') col = color(197, 0, 123, 100);
}
