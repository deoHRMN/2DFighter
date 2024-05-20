class MainScreen {
  
  Button playBtn, infoBtn, settingsBtn;
  PImage background;
  float btnWidth = 200;
  float btnHeight = 100;
  int selectedOption;
  color btnColor1  = color(174,90,65);
  color btnColor2  = color(73, 110, 124);
  color btnColor3 = color(119,136,153);
  boolean increasing = true;
  float glow = 0;
  PFont freedom;
  
  MainScreen() {
    background = loadImage("images/backgrounds/1.png");
    playBtn = new Button (width/2, 285, btnWidth, btnHeight, "PLAY", btnColor1);
    infoBtn = new Button (width/2, 400, btnWidth, btnHeight, "HOW TO PLAY", btnColor2);
    settingsBtn = new Button (width/2, 515, btnWidth, btnHeight, "SETTINGS", btnColor3);;
    freedom = createFont("fonts/goma-block.ttf", 100);
  }
  
  void display() {
    imageMode(CORNER);
    image(background, 0, 0, width, height);
    playBtn.display();
    infoBtn.display();
    settingsBtn.display();
    playBtn.update();
    infoBtn.update();
    settingsBtn.update();
    
    textFont(freedom);
    textAlign(CENTER, CENTER);
    if (increasing) {
      glow += 0.01;
      if (glow >= 1) {
        increasing = false;
      }
    } else {
      glow -= 0.01;
      if (glow <= 0) {
        increasing = true;
      }
  }
  
    // Draw glowing text
    fill(255, 150, 0, 255 * glow); // Orange with variable alpha
    textSize(100);
    text("2D Forest Fighter", width/2, 100);

    
  }
  
  int getSelectedOption() {
    if(playBtn.hover()) {
      selectedOption = 1;
    } else if (infoBtn.hover()) {
      selectedOption = 2;
    } else if (settingsBtn.hover()) {
      selectedOption = 3;
    }
    
     return selectedOption;
  }
  

}
