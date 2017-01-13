

// Source image
PImage src;
// Resize it
PImage smaller;
// Images by brightness
PImage[] bImg;

// Size of each "cell"
int scl = 5;
int w, h;

void setup() {
  size(400, 400);
  src = loadImage("/Users/bryanarnold/Desktop/java/bryan.jpg");

// how many cols and rows
  w = src.width/scl;
  h = src.height/scl;

  smaller = createImage(w, h, RGB);
  smaller.copy(src, 0, 0, src.width, src.height, 0, 0, w, h);

}

void draw() {
  background(0);
  smaller.loadPixels();
  // Columns and rows
  for (int x =0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      // Draw an image with equivalent brightness to source pixel
      int index = x + y * w;
      color c = smaller.pixels[index];
      //fill(brightness(c)); // gray-scale version
      //fill(c); // color version
      //noStroke();
      //rect(x*scl, y*scl, scl, scl);
      tint(c);
      image(src, x*scl, y*scl, scl, scl);
    }
  }
  noLoop();
}