
float y = 0;
float x = 0;

void setup() {
  size(550, 550);
}

void draw() {
  strokeCap(SQUARE);
  smooth();
  noFill();
  background(255);
  translate(width / 2, height / 2);

  y = random(0, 550);
  x = random(0, 550);

  int circleResolution = (int) map(y, 0, height, 2, 80);
  float radius = x - width / 2 + 0.5;
  float angle = TWO_PI / circleResolution;

  strokeWeight(y / 20);

  beginShape();
  for (int i = 0; i <= circleResolution; i++) {
    float x = cos(angle * i) * radius;
    float y = sin(angle * i) * radius;
    line(0, 0, x, y);
  }
  endShape();
}

