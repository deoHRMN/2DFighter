class SetScreen {
  
  Settings settings;
  Button backBtn;
  color btnColor1  = color(174,90,65);
  PImage background;
  PImage player1Img;
  PImage player2Img;
  PFont freedom;
  int currentFrame = 0;
  
  boolean changed = false;
  
  PImage map1;
  PImage map2;
  PImage map3;
  
  color white = color(255, 255, 255);
  color selected = color(255, 0, 255);
  color option1;
  color option2;
  color option3;
  
  
  String speedText = "";
  String timerText = " (min)";
  
  // buttons
  Button timerPlus, timerMinus, speedPlus, speedMinus, player1Btn, player2Btn, mapChangeBtn, option1Btn, option2Btn, option3Btn;
  
  SetScreen() {
    settings = new Settings();
    backBtn = new Button(75, 60, 100, 65, "B A C K", btnColor1);
    background = loadImage("images/backgrounds/2.jpg");
    freedom = createFont("fonts/goma-block.ttf", 100);
    
    map1 = loadImage("images/backgrounds/map_select/1.png");
    map2 = loadImage("images/backgrounds/map_select/2.png");
    map3= loadImage("images/backgrounds/map_select/3.png");
    timerPlus = new Button(width/4 - 30, 215, 50, 50, "+", color(255, 255, 255));
    timerMinus = new Button(width/4 + 30, 215, 50, 50, "-", color(255, 255, 255));
    
    speedPlus = new Button(width/4 - 30, 335, 50, 50, "+", color(255, 255, 255));
    speedMinus = new Button(width/4 + 30, 335, 50, 50, "-", color(255, 255, 255));
    
    player1Btn = new Button(2 * width/3 - 50, 330, 100, 50, "Change", color(255, 255, 255));
    player2Btn = new Button(2 * width/3 + 150, 330, 100, 50, "Change", color(255, 255, 255));
    
    option1Btn = new Button(365, 550, 220, 150, "", color(0,0,0,0));
    option2Btn = new Button(605, 550, 220, 150, "", color(0,0,0,0));
    option3Btn = new Button(845, 550, 220, 150, "", color(0,0,0,0));
    
    
    option1 = selected;
    option2 = white;
    option3 = white;
    
   
  }
  
  
  void display() {
      
      imageMode(CENTER);
      background.resize(1080, 720);
      image(background, width/2, height/2);
      
      backBtn.display();
      backBtn.update();
    
      textAlign(CENTER, CENTER);
      fill(255, 150, 0);
      textSize(64);
      text("SETTINGS", width/2, 50);
      
      stroke(255);
      strokeWeight(3);
      fill(0, 0, 0, 128);
      rect(width/4, 250, 400, 280);
      rect(2 * width/3 + 50, 250, 500, 280);
      rect(2 * width/3 - 50, 230, 150, 150);
      rect(2 * width/3 + 150, 230, 150, 150);
      rect(540, 550, 900, 240);
      
      
      option1Btn.display();
      option2Btn.display();
      option3Btn.display();
      
      strokeWeight(5);
      // Draw three rectangles on the right side
      stroke(option1);
      rect(365, 550, 220, 150); // First rectangle
      stroke(option2);
      rect(605, 550, 220, 150); // Second rectangle
      stroke(option3);
      rect(845, 550, 220, 150); // Third rectangle
      
      stroke(255);
      
      strokeWeight(3);
      textAlign(CENTER, CENTER);
      textSize(32);


      fill(255, 255, 0);
      textSize(32);
      text("Timer: " + str(this.settings.getTime()) + "sec" + timerText, width/4, 155);
      text("Speed: " + str(this.settings.getVelocity()) + speedText, width/4, 280);
      text("SELECT", 175, 520);
      text("MAP", 175, 560);
      
      imageMode(CORNER);
      player1Img = loadImage("images/hero" + settings.getPlayer1() + "/Idle1.png");
      player2Img = loadImage("images/hero" + settings.getPlayer2() + "/Idle2.png");
      image(player1Img, 2 * width/3 - 110, 180, 100, 100);
      image(player2Img, 2 * width/3 + 110, 180, 100, 100);
      

      imageMode(CENTER);
      map1.resize(220, 150);
      map2.resize(220, 150);
      map3.resize(220, 150);
      image(map1, 365, 550);
      image(map2, 605, 550);
      image(map3, 845, 550);
      
      //text(str(this.settings.getPlayer1()), 2 * width/3 - 50, 230);
      //text(str(this.settings.getPlayer2()), 2 * width/3 + 150, 230);
      
      player1Btn.display();
      player2Btn.display();
      player1Btn.update();
      player2Btn.update();
      
      
      timerPlus.display();
      timerMinus.display();
      timerPlus.update();
      timerMinus.update();
      speedPlus.display();
      speedMinus.display();
      speedPlus.update();
      speedMinus.update();
      setSpeedText();
      setTimerText();
      
      
  }
  
  void setSpeedText() {
    if (this.settings.speedLevel == 1) {
      speedText = " (min)";
    } else if (this.settings.speedLevel == 4) {
      speedText = " (max)";
    } else {speedText = "";}
  }
  
  void setTimerText() {
    if (this.settings.timeLevel == 1) {
      timerText = " (min)";
    } else if (this.settings.timeLevel == 5) {
      timerText = " (max)";
    } else {timerText = "";}
  }
  
  Settings getSettings() {
    return settings;
  }
 
  void update() {
    if(this.settings.getMapNum() == 0) {
      option1 = selected;
      option2 = white;
      option3 = white;
    } else if(this.settings.getMapNum() == 1) {
      option1 = white;
      option2 = selected;
      option3 = white;
    } else if(this.settings.getMapNum() == 2) {
      option1 = white;
      option2 = white;
      option3 = selected;
    }
  }
 
}
