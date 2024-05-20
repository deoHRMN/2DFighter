class Fighter {

  PVector pos;
  float offset = 50;
  int multiplier = 1;
  float w = 150;
  float h = 150;
  float aw = 100;
  float ah = 30;
  PVector velocity;
  int gravity = 4;
  int health = 100;
  
  String source;
  
  boolean touchbase = false;
  
  PImage idleImg;
  PImage attackImg;
  PImage deadImg;
  PImage srcImg;
  int currentFrame = 0;
  boolean attacking = false;
  boolean jumping = false;
  String dir;
  
      
 int dx;
 int dy;
  
String state = "idle";

Sprite avatar;

  Fighter(PVector pos, String dir) {
    this.pos = pos;
    this.dir = dir;
    this.velocity = new PVector(0, 0);
          
    dx = int(this.pos.x - this.w/2);
    dy = int(this.pos.y - this.h/2);
  }
  
  void display(int chara) {
    source = "images/hero"+ chara;
    displaySprite(chara);
  }
  
  void changeImage() {
    if (dir =="right") {
      idleImg = loadImage(source +"/Idle1.png");
      attackImg = loadImage(source +"/Attack.png");
      deadImg = loadImage(source +"/Death1.png");
    } else {
      idleImg = loadImage(source +"/Idle2.png");
      attackImg = loadImage(source +"/Attack2.png");
      deadImg = loadImage(source +"/Death2.png");
    }
  }
  
  void displaySprite(int chara) {
    changeImage();
    getSpriteParams(chara);
    if(state != "dead") {
      if (!attacking) {
        switch(state) {
          case "idle":
            imageMode(CENTER);
            idleImg.resize(int(w), int(h));
            image(idleImg, this.pos.x, this.pos.y);
            break;
            
          case "moving":
            int maxFrames = avatar.maxFrames;
            if(dir == "right") {
              srcImg = loadImage(source + "/Run.png");
            } else {
              srcImg = loadImage(source + "/Run2.png");
            }
            int spriteShift = avatar.spriteShift;
            if (currentFrame == maxFrames) {
              currentFrame = 0;
            } else {
    
              currentFrame++;
            }
            copy(srcImg, avatar.startX + (currentFrame * spriteShift), avatar.startY, avatar.sw, avatar.sh, avatar.dx, avatar.dy, avatar.dw, avatar.dh);
            break;
        }
      } else {
            imageMode(CENTER);
            attackImg.resize(int(w), int(h));
            image(attackImg, this.pos.x, this.pos.y);
      }
  } else {
    imageMode(CENTER);
    deadImg.resize(int(w), int(h));
    image(deadImg, this.pos.x, this.pos.y);
    }
   

  }  
  
  void getSpriteParams(int chara) {
    switch(chara) {
      case 1:
      avatar = new Sprite(6, 200, 0, 74, 47, 47, int(this.pos.x - this.w/2), int(this.pos.y - this.h/2), int(w), int(h));
        break;
      case 2:
      avatar = new Sprite(7, 200, 0, 0, 45, 55, int(this.pos.x - this.w/2), int(this.pos.y - this.h/2), int(w), int(h));
        break;
      case 3:
        avatar = new Sprite(7, 150, 59, 63, 41, 35, int(this.pos.x - this.w/2), int(this.pos.y - this.h/2), int(w), int(h) );
        break;
      case 4:
        avatar = new Sprite(7, 140, 40, 44, 32, 40, int(this.pos.x - this.w/2), int(this.pos.y - this.h/2), int(w), int(h) );
        break;
    }
  }
  
  void update(int vx, int ground) {
    if(dir == "left") {
      multiplier = -1;
    } else if (dir == "right") {
      multiplier = 1;
    }
    move(vx, ground);
  }
  
  void move(int vx, int ground) {
    if(state != "dead") {
      
      if(this.pos.y + this.h/2 + this.velocity.y >= ground) {
        if(jumping) {
          this.velocity.y -= 40;
          jumping = false;
        } else this.velocity.y = 0;
      } else {
        this.velocity.y += this.gravity;
      }
      this.pos.y += this.velocity.y;
      
      if(state != "idle") {
        if(state == "moving") {
          if(dir == "left") {
            if(this.pos.x - this.w/2 - this.velocity.x >= 0) {
              this.velocity.x = -vx;
            } else {
              this.velocity.x = 0;
            }
            
          } else if (dir == "right") {
            if (this.pos.x + this.w/2 + this.velocity.x <= width) {          
              this.velocity.x = vx;
            } else {
              this.velocity.x = 0;
            }

          }
          this.pos.x += this.velocity.x;
        }
      } else {
        this.velocity.x = 0;
      }
    }
  }
  
  
  void setTouchBase(boolean touch) {
    this.touchbase = touch;
  }
  
   boolean checkCollision(Fighter fighter){
     boolean collision = false;
    for(int x = int(fighter.pos.x - fighter.w/2); x <= fighter.pos.x + fighter.w/2; x++) {
      for(int y = int(fighter.pos.y - fighter.h/2); y <= fighter.pos.y + fighter.h/2; y++)
        if (hasAttackBox(x, y)) {
          collision = true;
          break;
        }
    }
    return collision;
   }
  
  boolean hasAttackBox(float x, float y) {
    if(dir == "left") {
      multiplier = -1;
    } else if (dir == "right") {
      multiplier = 1;
    }
    return (x >= this.pos.x + (this.offset * multiplier) - this.aw/2 && x <= this.pos.x + (this.offset * multiplier) + this.aw/2 &&
    y >= this.pos.y - this.ah/2 && y <= this.pos.y + this.ah/2);
  }
  
  void reset(PVector position) {
    this.health = 100;
    this.state = "idle";
    this.pos = position;
  }
}
