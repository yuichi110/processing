PGraphics LIB_COMMON_PG_RECT;

void common_test_settings(){
 size(1200, 800); 
}

void common_test_setup(){
  // global
  common_guidegrid_enabled = true;
  common_save_enabled = false;
  common_save_mode = SAVE_MODE_TRANSPARENT ;
  
  frameRate(50);
  LIB_COMMON_PG_RECT = getPG_rect(200, 100, 0, BLACK, 2, 255, WHITE, 255);
}

void common_test_draw(){
  background(255); 
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  pgb.fill(255, 100);
  
  // TEST FUNCTION
  //common_test_drawLine(pgb);
  //common_test_drawText(pgb);
  //common_test_drawRectangle(pgb);
  common_test_drawOthers(pgb);
  //common_test_drawMove(pgb);
  
  drawGrid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
  pgb.endDraw();
  image(pgb, 0, 0);  
  
  if(frameCount <= 200){
    String fileName = String.format("%04d", frameCount) + ".png";
    saveCurrentFrame(pgb, fileName);
  }
}

/*
TEST FUNCTIONS
*/

void common_test_drawLine(PGraphics pgb){
  drawLine(pgb, 100, 100, 200, 200, BLACK, 2, 255);
  drawDashLine(pgb, 100, 200, 200, 300, BLACK, 2, 255);
  drawArrowLine(pgb, 100, 300, 200, 400, 10, BLACK, 5, 255, false);
  drawArrowLine(pgb, 100, 400, 200, 500, 10, BLACK, 5, 255, true);
}

void common_test_drawText(PGraphics pgb){
  drawText(pgb, 200, 200, "Hello Processing", 32, BLACK, 255);
}

void common_test_drawRectangle(PGraphics pgb){
  PGraphics pgRect = getPG_rect(200, 100, 5, BLACK, 2, 255, WHITE, 255);
  PGraphics pgRectStroke = getPG_rectStroke(200, 100, 0, BLACK, 2, 255);
  PGraphics pgRectText = getPG_rectText(200, 100, 0, BLACK, 2, 255, WHITE, 255, "Hello", 32, BLACK, 255, 50, 50);
  pgb.image(pgRect, 100, 100);
  pgb.image(pgRectStroke, 100, 300);
  pgb.image(pgRectText, 100, 500);
}

void common_test_drawOthers(PGraphics pgb){
  PGraphics pgba = getPG_bigArrow(400, 200, 50, 50, BLACK, 2, 255, WHITE, 255);
  PGraphics pg2ba = getPG_2wayBigArrow(400, 200, 50, 50, BLACK, 2, 255, WHITE, 255);
  PGraphics pgc = getPG_cylinder(200, 200, 50, BLACK, 2, 255, CONCRETE, WHITE, 255);
  
  pgb.image(pgba, 100, 50);
  pgb.image(pg2ba, 100, 300);
  pgb.image(pgc, 100, 500);
}

void common_test_drawMove(PGraphics pgb){  
  int currentFrame = frameCount % 100;
  move(LIB_COMMON_PG_RECT, pgb, 200, 200,
       0, 500, 200, 0,
       currentFrame, 10, 90);
}


void old(){
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  
  PGraphics pg = getPG_rect(200, 100, 0, BLACK, 2, 255, BLACK, 255);
  pgb.pushMatrix();
  pgb.translate(200, 200);
  pgb.rotate(radians(0));
  pgb.image(pg, 0, 0);
  pgb.popMatrix();
  
  pgb.endDraw();
  image(pgb, 0, 0);
}