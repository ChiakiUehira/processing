import generativedesign.*;
import java.util.Calendar;

PImage img;
color[] colors;

String sortMode = null;


void setup() {
  // size(600, 600);
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  noCursor();
  img = loadImage("pic3.jpg");
}

void draw() {
  int tileCount = width / max(mouseX, 5);
  float rectSize = width / float(tileCount);

  int i = 0;
  colors = new color[tileCount * tileCount];
  for (int gridY = 0; gridY < tileCount; gridY++) {
    for (int gridX = 0; gridX < tileCount; gridX++) {
      int px = (int) (gridX * rectSize);
      int py = (int) (gridY * rectSize);
      colors[i] = img.get(px, py);
      i++;
    }
  }
  
  if (sortMode != null) colors = GenerativeDesign.sortColors(this, colors, sortMode);

  i = 0;
  for (int gridY = 0; gridY < tileCount; gridY++) {
    for (int gridX = 0; gridX < tileCount; gridX++) {
      fill(colors[i]);
      rect(gridX * rectSize, gridY * rectSize, rectSize, rectSize);
      i++;
    }
  }
}

void keyReleased(){
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");

  if (key == '1') img = loadImage("pic1.jpg");
  if (key == '2') img = loadImage("pic2.jpg"); 
  if (key == '3') img = loadImage("pic3.jpg"); 

  if (key == '4') sortMode = null;
  if (key == '5') sortMode = GenerativeDesign.HUE;
  if (key == '6') sortMode = GenerativeDesign.SATURATION;
  if (key == '7') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '8') sortMode = GenerativeDesign.GRAYSCALE;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
