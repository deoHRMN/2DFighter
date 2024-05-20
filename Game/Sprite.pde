class Sprite {
  
  int maxFrames;
  int spriteShift;
  int startX;
  int startY;
  int sw;
  int sh;
  int dx;
  int dy;
  int dw;
  int dh;
  
  // Constructor with additional attributes
  Sprite(int frames, int shift, int x, int y, int sw, int sh, int dx, int dy, int dw, int dh) {
    maxFrames = frames;
    spriteShift = shift;
    startX = x;
    startY = y;
    this.sw = sw;
    this.sh = sh;
    this.dx = dx;
    this.dy = dy;
    this.dw = dw;
    this.dh = dh;
  }

}
