
PFont font;
String letter = "A";

void setup() {
  size(800, 800);
  background(255);
  fill(0);
  font = createFont("Arial", 12);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw() {

}

void mouseMoved() {
  background(255);
  textSize((mouseX-width/2)*5+1);
  text(letter, width/2, mouseY);
}

void mouseDragged() {
  textSize((mouseX-width/2)*5+1);
  text(letter, width/2, mouseY);
}

void keyReleased () {
  if (key != CODED && (int)key > 32) letter = str(key);
}
