class GameScreen {
  
  int mapNum = 0;
  Settings gameSettings = new Settings();
  int char1;
  int char2;
  
  Map map;
  
  ArrayList<Fighter> fighters;
  
  Fighter player1;
  Fighter player2;
  Fighter player3;
  Fighter player4;
  
  String winner = "";
  boolean gameOver = false;
  boolean paused = false;
  float timerWidth;
  int timerId = 0;
  String text  = "60";
  Button replay;
  Button homeBtn;
  Button pauseBtn;
  
  //states before pause
  String s1;
  String s2;
  PVector p1Velocitypaused;
  PVector p2Velocitypaused;
  
  GameScreen() {
    map = new Map(mapNum);
    
    PVector pos1 = new PVector(width/4, height/2);
    PVector pos2 = new PVector(3 * width/4, height/2);
    
    player1 = new Fighter(pos1, "right");
    player2 = new Fighter(pos2, "left");
    
    
    replay = new Button(width/2 - 150, 450, 200, 75, "REPLAY", color(174,90,65));
    homeBtn = new Button(width/2 + 150, 450, 200, 75, "HOME", color(174,90,65));
    pauseBtn = new Button(width/2 - 150, 450, 200, 75, "PAUSE", color(174,90,65));
  }
  
  GameScreen(int mapNum) {
    
    this.mapNum = mapNum;
    map = new Map(mapNum);
    
    PVector pos1 = new PVector(width/4, height/2);
    PVector pos2 = new PVector(3 * width/4, height/2);
    
    player1 = new Fighter(pos1, "right");
    player2 = new Fighter(pos2, "left");
    
    replay = new Button(width/2 - 150, 450, 200, 75, "REPLAY", color(174,90,65));
    homeBtn = new Button(width/2 + 150, 450, 200, 75, "HOME", color(174,90,65));
    pauseBtn = new Button(width/2 - 150, 450, 200, 75, "RESUME", color(174,90,65));
    
  }
  
  void display(int vx, int char1, int char2) {
    map.render();
    showHud();
    player1.display(char1);
    player1.update(vx, map.getGround());
    player2.display(char2);
    player2.update(vx, map.getGround());
    checkTouchBase(player1);
    checkTouchBase(player2);
    
    checkWinner();
    if (!gameOver) {
        if(player1.attacking && player1.checkCollision(player2)) {
          if (player2.health > 0) {
             player2.health -= 0.002;
          }
         
        }
        
        
        if (player2.attacking && player2.checkCollision(player1)) {
          player1.health -= 0.002;
        }
    }
    
    if (gameOver) {
        fill(255);
        textSize(40);
        text(winner, width/2, height/2);
        replay.display();
        replay.update();
        homeBtn.display();
        homeBtn.update();
    }
    
    if (paused) {
        pauseBtn.display();
        pauseBtn.update();
        homeBtn.display();
        homeBtn.update();
    }
  
  }
  
  void checkTouchBase(Fighter fighter) {
    for(Base base : map.bases) {
      if(fighter.pos.y + fighter.h/2 >= base.y && fighter.pos.y + fighter.h/2 <= base.y + base.h 
      && fighter.pos.x + fighter.w/2 >= base.x && fighter.pos.x <= base.x + base.w) {
        fighter.velocity.y = 0;
        fighter.pos.y = base.y - fighter.h/2;
        
        if(fighter.jumping) {
          fighter.velocity.y = -40;
        }
      }
    }
  }
  
  
  void decreaseTimer() {
    // Decrement time every second
    if(!paused) {
    if (frameCount % 60 == 0 && timer > 0) {
      if(!gameOver) {
        timerWidth = 50;
        timer--;
        text = str(timer);
      }
    }


    }
    // When time reaches 0, display "Time's up!"
    if (timer == 0) {
       timerWidth = 50;
       text = "0";
    }
  }
  
  void checkWinner() {
    if(timer == 0) {
      gameOver = true;
      if (player1.health == player2.health) {
        winner = "Tie";
      } else if (player1.health < player2.health) {
        winner = "player 2 wins.";
      } else {
        winner = "player 1 wins.";
      }
    }
    
    if (timer > 0) {
      if (player1.health <= 0) {
        winner = "player 2 wins.";
        player1.state = "dead";
        gameOver = true;
        
      } else if (player2.health <= 0) {
        player2.state = "dead";
        winner = "player 1 wins.";
        gameOver = true;
      }
    }
  }
  

  
  void resetGame() {
    timer = setScreen.settings.getTime();
    text = str(timer);
    gameOver = false;
    winner ="";
    player1.reset(new PVector(width/4, height/2));
    player2.reset(new PVector(3 * width/4, height/2));
    player1.gravity = 4;
    player2.gravity = 4;
    paused = false;
  }
  
  void showHud() {
    stroke(255);
    strokeWeight(3);
    fill(108, 122, 137, 64);
    rectMode(CENTER);
    rect(width/2, 50, timerWidth, 50);
    rectMode(CORNER);
    fill(255, 105, 97);
    rect(width/2 - 25, 30, -400, 40);
    rect(width/2 + 25, 30, 400, 40);
   
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    decreaseTimer();
    text(text, width/2, 50);
    
    noStroke();
    fill(193, 225, 193);
    rect(width/2 + 25, 30, 4 * player2.health, 40);
    rect(width/2 - (4 * player1.health) - 25, 30, 4 * player1.health, 40);

  }
  
  void pauseGame() {
      paused = true;
      s1 = player1.state;
      
      s2 = player2.state;
      player1.state = "idle";
      player2.state = "idle";
      player1.gravity = 0;
      player2.gravity = 0;
      p1Velocitypaused = new PVector(player1.velocity.x, player1.velocity.y);
      p2Velocitypaused = new PVector(player2.velocity.x, player2.velocity.y);
      player1.velocity = new PVector(0, 0);
      player2.velocity = new PVector(0, 0);
  }
  
  void resume() {
      paused = false;
      player1.gravity = 4;
      player2.gravity = 4;
      player1.velocity =  p1Velocitypaused; 
      player2.velocity =  p2Velocitypaused; 
      player1.state = s1;
      player2.state = s2;
  }
  
  void update() {
    if(gameOver) {
      if(replay.hover()) {
        replay.setHoverColor(color(255, 150, 0));
      } else {
        replay.setHoverColor(color(0, 0, 0, 0));
      }
    }
  
  }
}
