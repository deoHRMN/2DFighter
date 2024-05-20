class Button {
  
  float x, y;
  float w, h;
  String label;
  color btnColor;
  color hoverColor = 0;
  
  Button(float x, float y, float w, float h, String label, color btnColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.btnColor = btnColor;
  }
  
  void display() {
    noStroke();
    fill(btnColor);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(hoverColor);
    rect(x, y, w - 10, h - 10);
    fill(btnColor);
    rect(x, y, w-20, h-20);
    fill(hoverColor);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x, y);
  }
  
  boolean hover() {
    return mouseX >= x - w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2;
  }
  
  void setHoverColor(color newColor) {
    hoverColor = newColor;
  }
  
  void update() {
    if (hover()) {
      setHoverColor(color(255, 150, 0));
    } else {
      setHoverColor(color(0, 0, 0, 0));
    }
  }
}
