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
  //common_test_drawOthers(pgb);
  //common_test_drawHorizontalVerticalRects(pgb);
  //common_test_drawTable(pgb);
  //common_test_drawBalloon(pgb);
  common_test_drawMove(pgb);
  
  drawPG_grid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
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
  drawPG_line(pgb, 100, 100, 200, 200, BLACK, 2, 255);
  drawPG_lineDash(pgb, 100, 200, 200, 300, BLACK, 2, 255);
  drawPG_lineArrow(pgb, 100, 300, 200, 400, 10, BLACK, 5, 255, false);
  drawPG_lineArrow(pgb, 100, 400, 200, 500, 10, BLACK, 5, 255, true);
}

void common_test_drawText(PGraphics pgb){
  drawPG_text(pgb, 200, 200, "Hello Processing", 32, BLACK, 255);
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
  movePG(LIB_COMMON_PG_RECT, pgb, 
       200, 100, 0, 500, 100, 0,
       currentFrame, 10, 90, true);
       
  movePG(LIB_COMMON_PG_RECT, pgb, 
       200, 300, 0, 500, 300, 720,
       currentFrame, 10, 90, true);
       
  movePG_bezier(LIB_COMMON_PG_RECT, pgb, 
       200, 500, 400, 600, 300, 600, 500, 500, 0, 0,
       currentFrame, 10, 90, true);
       
  movePG_bezier(LIB_COMMON_PG_RECT, pgb, 
       200, 700, 400, 800, 300, 800, 500, 700, 0, 720,
       currentFrame, 10, 90, true);
}

void common_test_drawHorizontalVerticalRects(PGraphics pgb){
  int[] widths = {100, 75, 50, 50};
  int[] fillColors1 = {CONCRETE, CONCRETE, CONCRETE, CONCRETE};
  String[] texts1 = {"AA", "BB", "CC", "DD"};
  int[] textXs1 = {10, 10, 10, 10};
  int[] textColors1 = {WHITE, WHITE, WHITE, WHITE};
  PGraphics pgHorizontalRects = getPG_horizontalRects(BLACK, 1.5, 255, 
                                          widths, 50, fillColors1, 
                                          texts1, 24, textXs1, 20, textColors1);

  pgb.image(pgHorizontalRects, 100, 100);
  
  int[] heights = {100, 75, 50, 50};
  int[] fillColors2 = {CONCRETE, BLACK, CONCRETE, CONCRETE};
  String[] texts2 = {"AA", "BB", "CC", "DD"};
  int[] textXs2 = {50, 50, 50, 50};
  int[] textYs2 = {70, 50, 20, 20};
  int[] textColors2 = {WHITE, WHITE, WHITE, WHITE};
  PGraphics pgVerticalRects = getPG_verticalRects(BLACK, 1.5, 255, 
                                          200, heights, fillColors2, 
                                          texts2, 24, textXs2, textYs2, textColors2);

  pgb.image(pgVerticalRects, 100, 300); 
}

void common_test_drawTable(PGraphics pgb){
  int[] columnWidths = {50, 100, 50, 100};
  String[][] texts = {{"A", "B", "C", "D"}, {"A", "B", "C", "D"}, {"A", "B", "C", "D"}, {"A", "B", "C", "D"}};
  int[][] textXs = {{10, 10, 10, 10}, {10, 10, 10, 10}, {10, 10, 10, 10}, {10, 10, 10, 10}};
  int[][] textColors = {{BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}};
  PGraphics pgVerticalTable = getPG_table(BLACK, 1.5, 255, CONCRETE, 255, 
                                          columnWidths, 200, 
                                          texts, 24, textXs, 30, textColors);
                                          
  pgb.image(pgVerticalTable, 100, 100);  
  noLoop();
}

void common_test_drawBalloon(PGraphics pgb){
  PGraphics pgBalloon = getPG_balloon(0, 0, 200, 100, 10,
                                            50, 90, 150, 90, 300, 200,
                                            40, 80, 150, 21,
                                            BLACK, 2, 255, CONCRETE, 255, CONCRETE);
                                                                        
  pgb.image(pgBalloon, 100, 100);  
  noLoop();
}