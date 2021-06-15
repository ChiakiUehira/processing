
int maxCount = 5000;
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];
int[] closestIndex = new int[maxCount];

float minRadius = 3;
float maxRadius = 50;

float mouseRect = 30;

void setup() {
  size(800, 800);
  noFill();
  smooth();
  cursor(CROSS);

  x[0] = 200;
  y[0] = 100;
  r[0] = 50;
  closestIndex[0] = 0;
}

void draw() {
  background(255);
  
  float newX = random(0+maxRadius, width-maxRadius);
  float newY = random(0+maxRadius, height-maxRadius);
  float newR = minRadius;

  if (mousePressed == true) {
    newX = random(mouseX-mouseRect/2, mouseX+mouseRect/2);
    newY = random(mouseY-mouseRect/2, mouseY+mouseRect/2);
    newR = 1;
  }

  boolean intersection = false;

  for(int i = 0; i < currentCount; i++) {
    float d = dist(newX, newY, x[i], y[i]);
    if (d < (newR + r[i])) {
      intersection = true;
      break;
    }
  }

  if (intersection == false) {
    float newRadius = width;
    for(int i = 0; i < currentCount; i++) {
      float d = dist(newX, newY, x[i], y[i]);
      if (newRadius > d-r[i]) {
        newRadius = d-r[i];
        closestIndex[currentCount] = i;
      }
    }
    if (newRadius > maxRadius) newRadius = maxRadius;

    x[currentCount] = newX;
    y[currentCount] = newY;
    r[currentCount] = newRadius;
    currentCount++;
  }

  for (int i = 0; i < currentCount; i++) {
    stroke(0);
    strokeWeight(1.5);
    ellipse(x[i], y[i], r[i]*2, r[i]*2);
    stroke(226, 185, 0);
    strokeWeight(0.75);
    int n = closestIndex[i];
    line(x[i], y[i], x[n], y[n]);
  }

  if (mousePressed == true) {
    stroke(255, 200, 0);
    strokeWeight(2);
    rect(mouseX-mouseRect/2, mouseY-mouseRect/2, mouseRect, mouseRect);
  }

  if (currentCount >= maxCount) noLoop();

}

void keyPressed() {
  if (keyCode == UP) mouseRect += 4;
  if (keyCode == DOWN) mouseRect -= 4;
}
