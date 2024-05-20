class InfoScreen {
  
  Button backBtn;
  color btnColor1  = color(174,90,65);
  PImage background;
  PImage playerImg;
  PImage enemyImg;
  PFont freedom;
  int currentFrame = 0;
  
  InfoScreen() {
    backBtn = new Button(75, 60, 100, 65, "B A C K", btnColor1);
    background = loadImage("images/backgrounds/2.jpg");
    playerImg = loadImage("images/hero1/Idle1.png");
    enemyImg = loadImage("images/hero2/Idle2.png");
    freedom = createFont("fonts/goma-block.ttf", 100);
  }
  
  void display() {
    imageMode(CORNER);
    image(background, 0, 0, width, height);
    backBtn.display();
    backBtn.update();
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    stroke(255);
    strokeWeight(3);
    fill(0, 0, 0, 128);
    rect(width/3, 200, 300, 300);
    rect(width/2, 525, 650, 300);
    imageMode(CENTER);
    playerImg.resize(100, 100);
    image(playerImg, width/3 - 20, 120);
    rect(width/3 + 350, 200, 300, 300);
    enemyImg.resize(100, 100);
    image(enemyImg, width/3 + 360, 120);
    
    fill(255, 150, 0);
    text("Player 1", width/3, 200);
    text("Player 2", width/3 + 350, 200);
    
    fill(255);
    text("w: Jump", width/3, 250);
    text("a: Move Left", width/3, 275);
    text("d: Move Right", width/3, 300);
    text("Space: Artack", width/3, 325);
    
    text("Arrow Up: Jump", width/3 + 350, 250);
    text("Arrow Left: Move Left", width/3 + 350, 275);
    text("Arrow Right: Move Right", width/3 + 350, 300);
    text("m: Artack", width/3 + 350, 325);
    
    text("win by either keepin your player's health heigher than", width/2, 400);
    text("your opponent by attacking them when timer ends, or ", width/2, 425);
    text("defeat them by lowering their health to 0 before rimer", width/2, 450);
    text("ends. More characters will be released in the future.!", width/2, 475);
    
    text("Go to the Settings to select from a range of different", width/2, 500);
    text("maps and also change game stats such as player speed", width/2, 525);
    text("and match timer. You can also select from a range of ", width/2, 550);
    text("different characters. More stuff will be added in future", width/2, 575);
    text("Stay Tuned!", width/2, 600);
    
    if (mouseX <= width/3 + 150 && mouseX >= width/3 - 150 && mouseY <= 350 && mouseY >= 50) {
            playerImg = loadImage("images/hero1/Run.png");
            int spriteShift = 200;
            if (currentFrame == 6) {
              currentFrame = 0;
            } else {
    
              currentFrame++;
            }
            copy(playerImg, 0 + (currentFrame * spriteShift), 74, 47, 47, (int) (width/3 - 70), 70, 100, 100);
    } else {
      playerImg = loadImage("images/hero1/Idle1.png");

    }
    
     if (mouseX <= width/3 + 550 && mouseX >= width/3 + 200 && mouseY <= 350 && mouseY >= 50) {
            enemyImg = loadImage("images/hero2/Run.png");
            int spriteShift = 200;
            if (currentFrame == 6) {
              currentFrame = 0;
            } else {
    
              currentFrame++;
            }
            copy(enemyImg, 0 + (currentFrame * spriteShift), 0, 45, 55, width/3 + 310, 70, 100, 100);
    } else {
      enemyImg = loadImage("images/hero2/Idle1.png");
    } 
  }

}
