
int maxCount = 5000;
int currentCount = 0;
float[] newx = new float[maxCount];
float[] newy = new float[maxCount];
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

boolean drawGhosts = false;

void setup() {
  size(600, 600);
  smooth();
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 10;
}

void draw() {
  background(255);
  strokeWeight(0.5);

  float newR = random(1, 7);
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);

  float closestDist = 10000000;
  int closestIndex = 0;

  for (int i = 0; i < currentCount; i++) {
    float newDist = dist(newX, newY, x[i], y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i;
    }
  }

  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

  newx[currentCount] = newX;
  newy[currentCount] = newY;
  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  if (drawGhosts) {
    for (int i = 0; i < currentCount; i++) {
      fill(230);
      ellipse(newx[i], newy[i], r[i]*2, r[i]*2);
      line(newx[i], newy[i], x[i], y[i]);  
    }
  }
  for (int i = 0; i < currentCount; i++) {
    if (i == 0) noFill();
    else fill(50);
    ellipse(x[i], y[i], r[i]*2, r[i]*2);
  }

  if (currentCount >= maxCount) noLoop();
}

void keyReleased() {
  if (key == '1') drawGhosts = !drawGhosts;
}
