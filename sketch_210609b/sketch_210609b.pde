
float yy = 0;
float xx = 0;

void setup() {
  size(550, 550);
}

void draw() {
  strokeCap(SQUARE);
  smooth();
  noFill();
  background(255);
  translate(width / 2, height / 2);

  yy = mouseY;
  xx = mouseX;

  int circleResolution = (int) map(yy, 0, height, 2, 80);
  float radius = xx - width / 2 + 0.5;
  float angle = TWO_PI / circleResolution;

  strokeWeight(yy / 20);

  beginShape();
  for (int i = 0; i <= circleResolution; i++) {
    float x = cos(angle * i) * radius;
    float y = sin(angle * i) * radius;
    line(0, 0, x, y);
    vertex(x, y);
  }
  endShape();
}

