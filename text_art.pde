import processing.video.*;
final int scl = 13;
Capture video;

void setup() {
  textSize(scl+2);
  pixelDensity(displayDensity());
  fullScreen();
  noStroke();
  smooth();
    
  video = new Capture(this, width, height);
  video.start(); 
}

void draw() {
  if (video.available()) {
    video.read();
    loadPixels();
    background(0);
    
    for(int x = 0; x < width/scl; x++){
      for(int y = 0; y < height/scl; y += 1){
        int value = round(brightness(video.pixels[x*scl+ y*width*scl]));
          fill(value);
        text(char(value),x*scl,y*scl+scl);
      }
    }  
  }
}