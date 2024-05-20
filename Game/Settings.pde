class Settings {
  
  int time;
  int timeLevel = 1;
  int velocity;
  int speedLevel = 2;
  int player1;
  int player2;
  
  int mapNum;
  
  Settings() {
    this.time = 60;
    this.velocity = 5;
    this.player1 = 1;
    this.player2 = 2;
    this.mapNum = 0;
  }
  
    void increaseTime() {
    if (timeLevel <= 5) {
      time += 20;
      timeLevel++;
    }
  }
  
  void decreaseTime() {
    if (timeLevel > 1) {
      time -= 20;
      timeLevel--;   
    }
  }
  
  void increaseSpeed() {
    if (speedLevel < 4) {
      velocity += 3;
      speedLevel++;
    }
  }
  
  void decreaseSpeed() {
    if (speedLevel > 1) {
      velocity -= 3;
      speedLevel--;
    }
  }
  
  void changePlayerCharacter1() {
    player1 = (player1 % 4) + 1;
    if (player1 == player2){  // Ensure player1 and player2 are not the same
        player1 = (player1 % 4) + 1;
  }}

   void changePlayerCharacter2() {
    player2 = (player2 % 4) + 1;
    if (player2 == player1){  // Ensure player2 and player1 are not the same
        player2 = (player2 % 4) + 1;
    }
   }
  
    // Getters
  public int getTime() {
    return this.time;
  }

  public int getVelocity() {
    return this.velocity;
  }

  public int getPlayer1() {
    return this.player1;
  }

  public int getPlayer2() {
    return this.player2;
  }

  public int getMapNum() {
    return this.mapNum;
  }

  // Setters
  public void setTime(int time) {
    this.time = time;
  }

  public void setVelocity(int velocity) {
    this.velocity = velocity;
  }

  public void setPlayer1(int player1) {
    this.player1 = player1;
  }

  public void setPlayer2(int player2) {
    this.player2 = player2;
  }

  public void setMapNum(int mapNum) {
    this.mapNum = mapNum;
  }
  
  void setValues(int time, int vx, int mapNum) {
    this.time = time;
    this.velocity = vx;
    this.mapNum= mapNum;
  }
  
}
