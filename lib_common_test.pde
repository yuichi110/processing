PGraphics LIB_COMMON_PG_RECT;
Flow LIB_COMMON_FLOW;
PGraphics LIB_COMMON_RED_BALL;

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
  int xs[] = {100, 200, 300, 400, 500};
  int ys[] = {100, 600, 100, 200, 100};
  LIB_COMMON_FLOW = new Flow(xs, ys, 100, 10);
  LIB_COMMON_FLOW.start();
  
  LIB_COMMON_RED_BALL = createGraphics(10, 10);
  LIB_COMMON_RED_BALL.beginDraw();
  LIB_COMMON_RED_BALL.noStroke();
  LIB_COMMON_RED_BALL.fill(255, 0, 0);
  LIB_COMMON_RED_BALL.ellipse(5, 5, 10, 10);
  LIB_COMMON_RED_BALL.endDraw();
}

void common_test_draw(){
  background(255); 
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  pgb.fill(255, 100);
  
  boolean m = true;
  if(m){
    //common_test_drawMove(pgb);
    LIB_COMMON_FLOW.draw(pgb, LIB_COMMON_RED_BALL, false);
    
    if(frameCount == 1000){
       LIB_COMMON_FLOW.stop();
    }
  }else{
    int f = frameCount % 400;
    int one_sec = 50;
    if(f > one_sec * 7){
      common_test_drawBalloon(pgb);
    }else if(f > one_sec * 6){
      common_test_drawTable(pgb);
    }else if(f > one_sec * 5){
      common_test_drawHorizontalVerticalRects(pgb);
    }else if(f > one_sec * 4){
      common_test_drawOthers(pgb);
    }else if(f > one_sec * 3){
      common_test_drawRectangle(pgb);
    }else if(f > one_sec * 2){
      common_test_drawText(pgb);
    }else{
      common_test_drawLine(pgb);
    }   
  }


  
  drawPG_grid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
  pgb.endDraw();
  image(pgb, 0, 0);  
  
  if(frameCount <= 200){
    String fileName = String.format("%04d", frameCount) + ".png";
    saveCurrentFrame(pgb, fileName);
  }
  
  //noLoop();
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
  PGraphics pgRectText = getPG_rectText(200, 100, 0, BLACK, 2, 255, WHITE, 255,  50, 50, "Hello", 32, BLACK, 255);
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
  movePG(pgb, LIB_COMMON_PG_RECT, 
       200, 100, 0, 500, 100, 0,
       currentFrame, 10, 90, true);
       
  movePG(pgb, LIB_COMMON_PG_RECT, 
       200, 300, 0, 500, 300, 720,
       currentFrame, 10, 90, true);
       
  movePG_bezier(pgb, LIB_COMMON_PG_RECT, 
       200, 500, 0, 400, 600, 300, 600, 500, 500, 0,
       currentFrame, 10, 90, true);
       
  movePG_bezier(pgb, LIB_COMMON_PG_RECT, 
       200, 700, 0, 400, 800, 300, 800, 500, 700, 720,
       currentFrame, 10, 90, true);
}

void common_test_drawHorizontalVerticalRects(PGraphics pgb){
  int[] widths = {100, 75, 50, 50};
  int[] fillColors1 = {CONCRETE, CONCRETE, CONCRETE, CONCRETE};
  int[] fillAlphas = {255,255,255,255};
  String[] texts1 = {"AA", "BB", "CC", "DD"};
  int[] textXs1 = {10, 10, 10, 10};
  int[] textColors1 = {WHITE, WHITE, WHITE, WHITE};
  int[] textAlphas = {255,255,255,255};
  PGraphics pgHorizontalRects = getPG_horizontalRects(widths, 50, BLACK, 1.5, 255, 
                                                      fillColors1, fillAlphas,
                                                      textXs1, 20, texts1, 24, textColors1, textAlphas);

  pgb.image(pgHorizontalRects, 100, 100);
  
  int[] heights = {100, 75, 50, 50};
  int[] fillColors2 = {CONCRETE, BLACK, CONCRETE, CONCRETE};
  String[] texts2 = {"AA", "BB", "CC", "DD"};
  int[] textXs2 = {50, 50, 50, 50};
  int[] textYs2 = {70, 50, 20, 20};
  int[] textColors2 = {WHITE, WHITE, WHITE, WHITE};
  PGraphics pgVerticalRects = getPG_verticalRects(200, heights, 
                                                  BLACK, 1.5, 255, 
                                                  fillColors2, fillAlphas,
                                                  textXs2, textYs2, texts2, 24, textColors2, textAlphas);

  pgb.image(pgVerticalRects, 100, 300); 
}

void common_test_drawTable(PGraphics pgb){
  int[] columnWidths = {50, 100, 50, 100};
  String[][] texts = {{"A", "B", "C", "D"}, {"A", "B", "C", "D"}, {"A", "B", "C", "D"}, {"A", "B", "C", "D"}};
  int[][] textXs = {{10, 10, 10, 10}, {10, 10, 10, 10}, {10, 10, 10, 10}, {10, 10, 10, 10}};
  int[][] textColors = {{BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}, {BLACK, BLACK, BLACK, BLACK}};
  int[][] textAlphas = {{255,255,255,255},{255,255,255,255},{255,255,255,255},{255,255,255,255}};
  PGraphics pgVerticalTable = getPG_table(columnWidths, 200, 
                                          BLACK, 1.5, 255, CONCRETE, 255,
                                          textXs, 30, texts, 24, textColors, textAlphas);
                                          
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