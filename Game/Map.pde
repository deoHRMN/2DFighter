class Map  {
  
    ArrayList<Base> bases; 
    PImage background;
    int level;
    int groundLevel = 0;
    String textureSrc;

    
    Map(int level) {
      this.level = level;
      bases = new ArrayList<Base>();
      this.textureSrc = "/images/textures/texture" + str(level) + ".png";
      String imgSrc = "/images/maps/" + str(level) + ".jpg";
      background = loadImage(imgSrc);
  
    }
    
    int getGround() {
      return groundLevel;
    }
    
    void render() {
      createMap();
      imageMode(CORNER);
      background.resize(1080, 720);
      image(background, 0, 0);
      for (Base base : bases) {
        base.render();
      }
    }
    
    
    
    void addBase(float x, float y, float w, float h) {
      bases.add(new Base(x, y, w, h, textureSrc));
    }
    
        void createMap() {
      bases.clear();
      switch(level) {
        case 0:
          addBase(width/2-400, 560, 300, 20);
          addBase(width/2 + 140, 560, 300, 20);
          addBase(width/2 - 150, 440, 200, 20);
          addBase(width/2-400, 320, 300, 20);
          addBase(width/2 + 140, 320, 300, 20);
          addBase(width/2 - 150, 220, 300, 20);
          this.groundLevel = 680;
          break;
        case 1:
          
          addBase(width/2, 480, 200, 20);
          addBase(width/2 - 400, 350, 400, 20);
          addBase(width/2, 230, 400, 20);
          this.groundLevel = 600;
          break;
        case 2:
          addBase(width/2, 480, 200, 20);
          addBase(width/2 - 400, 350, 400, 20);
          addBase(width/2, 230, 400, 20);
          this.groundLevel = 640;
          break;
      }
      
    }
}
