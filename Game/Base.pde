class Base {
  
  float x;
  float y;
  float w;
  float h;
  PImage texture;
  
  Base(float x, float y, float w, float h, String src) {
    
    this.y = y;
    this.w = w;
    this.h = h;
    this.x = x;
    texture = loadImage(src);
  }
  
  void render() {
    stroke(0);
    strokeWeight(2);
    imageMode(CORNER);
    rectMode(CORNER);
    noFill();
    rect(x, y, w, h);
    texture.resize(int(w), int(h));
    image(texture, x, y);
  }
  
 
  boolean contains(float x, float y) {
    return containsX(x) && containsY(y);
  }
  
  boolean containsX(float x) {
    return x >= this.x - 20 && x <= this.x + w + 20;
  }
  
  boolean containsY (float y) {
    return y >= this.y - 20 && y <= this.y + h + 20;
  }
}
