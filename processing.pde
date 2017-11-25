// WHICH PROGRAM
final boolean PROCESSING_IS_TEST = true;
final int PROCESSING_TEST_COMMON = 0;
final int PROCESSING_TEST_NETWORK = 1;
final int PROCESSING_TEST = PROCESSING_TEST_COMMON;

// DEBUG
boolean processing_debug = false;
boolean processing_drawGrid = false;
boolean processing_drawMouseXY = false;

// SAVE
boolean processing_saveFrame = false;
String processing_saveFrame_prefix = "frame-";
int processing_saveFrame_mode = 0;
final int PROCESSING_SAVEFRAME_MODE_BACKGROUND = 0;
final int PROCESSING_SAVEFRAME_MODE_TRANSPARENT = 1;

void settings(){
  if(!PROCESSING_IS_TEST){
    network1_settings();
    
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_settings(); break;
      case PROCESSING_TEST_NETWORK:
        network_test_settings(); break;
      default:
        println("ERROR");
    }
  }  
}

void setup(){
  if(!PROCESSING_IS_TEST){
    network1_setup();
    
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_setup(); break;
      case PROCESSING_TEST_NETWORK:
        network_test_setup(); break;
      default:
        println("ERROR");
    }
  }
  
}

void draw(){
  background(255); 
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  
  if(!PROCESSING_IS_TEST){
    network1_draw(pgb);
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_draw(pgb); break;
      case PROCESSING_TEST_NETWORK:
        network_test_draw(pgb); break;
      default:
        println("ERROR");
    }    
  }
  
  if(processing_drawGrid){
    drawPG_grid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
  }
  if(processing_drawMouseXY){
    drawPG_mouseXY(pgb); 
  }
  if(processing_saveFrame){
    String fileName = processing_saveFrame_prefix + String.format("%04d", frameCount) + ".png";
    saveCurrentFrame(pgb, fileName, processing_saveFrame_mode);
  }
  
  pgb.endDraw();
  image(pgb, 0, 0); 
}


void drawPG_grid(PGraphics pg, int strokeColor, int strokeWeight_, 
              int strongStrokeWeight, int strokeAlpha,
              int wPitch, int wsPitch, int hPitch, int hsPitch){  
  
  for(int x=wPitch; x<width; x+=wPitch){
      if(x % wsPitch == 0){
          drawPG_line(pg, x, 0, x, pg.height, strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          drawPG_line(pg, x, 0, x, pg.height, strokeColor, strokeWeight_, strokeAlpha);
      }
  }
  
  for(int y=hPitch; y<height; y+=hPitch){
      if(y % hsPitch == 0){
          drawPG_line(pg, 0, y, pg.width, y, strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          drawPG_line(pg, 0, y, pg.width, y, strokeColor, strokeWeight_, strokeAlpha);
      }
  }
}

void drawPG_mouseXY(PGraphics pg){
  if(mousePressed == true){
    int drawX = pg.width - 250;
    int drawY = pg.height - 50;
    String text = "X:" + mouseX + ", Y:" + mouseY;
    drawPG_text(pg, drawX, drawY, text, 32, BLACK, 255);
  }
}

void saveCurrentFrame(PGraphics pg, String fileName, int save_mode){  
  switch(save_mode){
    case PROCESSING_SAVEFRAME_MODE_BACKGROUND:
      save(fileName); break;
    case PROCESSING_SAVEFRAME_MODE_TRANSPARENT:
      pg.save(fileName); break;
    default:
      println("ERROR: saveCurrentFrame");
  }
}