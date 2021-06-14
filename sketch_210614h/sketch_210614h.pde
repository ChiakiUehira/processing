
int formResolution = 15;
int stepSize = 2;
float distortionFactor = 1;
float initRadius = 150;
float centerX, centerY;
float[] x = new float[formResolution];
float[] y = new float[formResolution];

boolean filled = false;
boolean freeze = false;

void setup() {
  size(displayWidth, displayHeight);
  smooth();

  centerX = width/2;
  centerY = height/2;

  float angle = radians(360/float(formResolution));
  for (int i = 0; i < formResolution; i++) {
    x[i] = cos(angle*i) * initRadius;
    y[i] = sin(angle*i) * initRadius;
  }

  stroke(0, 50);
  background(255);
}

void draw() {
  if (mouseX != 0 || mouseY != 0) {
    centerX += (mouseX-centerX) * 0.01;
    centerY += (mouseY-centerY) * 0.01;
    
  }

  for (int i = 0; i < formResolution; i++) {
    x[i] += random(-stepSize, stepSize);
    y[i] += random(-stepSize, stepSize);
  }

  if (filled) fill(random(255));
  else noFill();

  beginShape();
  // start controlpoint
  curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

  // only these points are drawn
  for (int i=0; i<formResolution; i++){
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  curveVertex(x[0]+centerX, y[0]+centerY);

  // end controlpoint
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
}

void mousePressed () {
  centerX = mouseX;
  centerY = mouseY;
  float angle = radians(360/float(formResolution));
  float radius = initRadius * random(0.5, 1.0);
  for (int i = 0; i < formResolution; i++) {
    x[i] = cos(angle * i) * radius;
    y[i] = sin(angle*i) * radius;
  }
}

void keyReleased() {
    if (key == DELETE || key == BACKSPACE) background(255);

  if (key == '1') filled = false;
  if (key == '2') filled = true;
  if (key == 'f' || key == 'F') freeze = !freeze;
  if (freeze == true) noLoop();
  else loop();
}
