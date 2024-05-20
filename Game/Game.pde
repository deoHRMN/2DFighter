int gameState = 0;

MainScreen mainScreen;
GameScreen gameScreen;
GameScreen gameScreen1;
GameScreen gameScreen2;
GameScreen gameScreen3;
InfoScreen infoScreen;
SetScreen setScreen;

GameScreen running;

int level = 0;
int timer = 60;
int player1 = 1;
int player2 = 2;
int vx = 5;

void setup() {
  size(1080, 720);
  mainScreen = new MainScreen();
  infoScreen = new InfoScreen();
  setScreen = new SetScreen();
  gameScreen1 = new GameScreen(1);
  gameScreen2 = new GameScreen(2);
  gameScreen3 = new GameScreen(0);
  running = gameScreen1;
}

void draw() {
  switch(gameState) {
    case 0:
      mainScreen.display();
      break;
    case 1:
      switch(level) {
        case 0:
          running = gameScreen3;
          break;
        case 1:
          running = gameScreen2;
          break;
        case 2:
         running = gameScreen3;
          break;
      }
      running.display(vx, player1, player2);
      break;
    case 2:
      infoScreen.display();
      break;
    case 3:
      setScreen.display();
      setScreen.update();
      break;
  }

}

void keyPressed() {
  if (running.paused == false) {
          switch(key) {
    case 'w':
      running.player1.jumping = true;
      break;
    case 'a':
      running.player1.state = "moving";
      running.player1.dir = "left";
      break;
    case 'd':
      running.player1.state = "moving";
      running.player1.dir = "right";
      break;
    case ' ':
      running.player1.attacking = true;
      break;
    case 'm':
        running.player2.attacking = true;
        break;
    case 'p':
      running.pauseGame();
      break;
  }
    if (key == CODED) {
      switch(keyCode) {
        case UP:
          running.player2.jumping = true;
          break;
        case LEFT:
          running.player2.state = "moving";
          running.player2.dir = "left";
          break;
        case RIGHT:
          running.player2.state = "moving";
          running.player2.dir = "right";
          break;
      }
    }
  }

}

void keyReleased() {
  
  if (running.paused == false) {
          switch(key) {
    case 'w':
      running.player1.jumping = false;
      break;
    case 'a':
      running.player1.state = "idle";
      running.player1.dir = "left";
      break;
    case 'd':
      running.player1.state = "idle";
      running.player1.dir = "right";
      break;
    case ' ':
      running.player1.attacking = false;
      break;
    case 'm':
      running.player2.attacking = false;
      break;

  } 
  if (key == CODED) {
      switch(keyCode) {
        case UP:
          running.player2.jumping = false;
          break;
        case LEFT:
          running.player2.state = "idle";
          running.player2.dir = "left";
          break;
        case RIGHT:
          running.player2.state = "idle";
          running.player2.dir = "right";
          break;
      }
    }
  
  }


}

void mousePressed() {
    if (gameState == 0) {
      switch(mainScreen.getSelectedOption()){
        case 1:
          gameState = 1;
          break;
          
        case 2:
          gameState = 2;
          break;
          
        case 3:
          gameState = 3;
          break;
      } 
    } else if (gameState == 1) {
         if(running.gameOver) {
            if(running.replay.hover()) {
              running.resetGame();
            } else if (running.homeBtn.hover()) {
              running.resetGame();
              running.paused = false;
              gameState = 0;
            }
          } else if (running.paused) {
            if (running.pauseBtn.hover()) {
                running.resume();
            }  else if (running.homeBtn.hover()) {
              running.resetGame();
              gameState = 0;
            }
          }
    } else if (gameState == 2) {
        if(infoScreen.backBtn.hover()) {
          gameState = 0;
        }
    } else if (gameState == 3) {
        if(setScreen.backBtn.hover()) {
          gameState = 0;
        } else if (setScreen.timerPlus.hover()) {
        setScreen.settings.increaseTime();
        } else if (setScreen.timerMinus.hover()) {
          setScreen.settings.decreaseTime();
        } else if (setScreen.speedPlus.hover()) {
          setScreen.settings.increaseSpeed();
        } else if (setScreen.speedMinus.hover()) {
          setScreen.settings.decreaseSpeed();
        } else if (setScreen.player1Btn.hover()) {
          setScreen.settings.changePlayerCharacter1();
        } else if (setScreen.player2Btn.hover()) {
          setScreen.settings.changePlayerCharacter2();
        } else if (setScreen.option1Btn.hover()) {
          setScreen.settings.setMapNum(0);
        }else if (setScreen.option2Btn.hover()) {
          setScreen.settings.setMapNum(1);
        }else if (setScreen.option3Btn.hover()) {
          setScreen.settings.setMapNum(2);
        }
        setScreen.changed = true;
        level = setScreen.settings.getMapNum();
        vx = setScreen.settings.getVelocity();
        player1 = setScreen.settings.getPlayer1();
        player2 = setScreen.settings.getPlayer2();
        timer = setScreen.settings.getTime();
        running.text  = str(timer);
    }
}
