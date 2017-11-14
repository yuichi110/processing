
void saveFrame(boolean is_save){
  if(is_save){
    String fileName = frameCount + ".png";
    save(fileName);
  }
}

/*
LINE
*/

void drawLine(int x1, int y1, int x2, int y2,
              String strokeColor, int strokeWeight_, int strokeAlpha){
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha); 
  line(x1, y1, x2, y2);
}

void drawDashLine(int x1, int y1, int x2, int y2, int dotLevel,
              String strokeColor, int strokeWeight_, int strokeAlpha){
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha); 

  float  bx, by;
  int    j = 0;  
  String hasen = "0101"; 
  
  strokeWeight(4);
  stroke( 0,0,0);
  bx = x1;
  by = y1;
  
  for( int i = 0; i <= 30; i++ ){
    float px = lerp( x1, x2, i/30.0 );
    float py = lerp( y1, y2, i/30.0 );
    String ptn = hasen.substring(j,j+1);
    j++;
    if( j >= hasen.length() ){ j = 0; }
    
    if( ptn.equals("1") == true ){
      line( bx, by, px, py );
    } else {
      point( px, py );
    }
    bx = px;
    by = py;
  }
  noLoop();
}

              
/*
TEXT
*/

void drawText(int x, int y, String text_, int textSize_, String textColor, int textAlpha){
  textSize(textSize_);  
  fillSwitch(textColor, textAlpha);
  text(text_, x, y);
}


/*
RECTANGLE
*/

void drawRect(int x, int y, int width_, int height_, int r,
               String strokeColor, int strokeWeight_, int strokeAlpha,
               String fillColor, int fillAlpha){

  // DRAW RECTANGLE
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  fillSwitch(fillColor, fillAlpha);
  rect(x, y, width_, height_, r);
}

void drawRectStroke(int x, int y, int width_, int height_, int r,
               String strokeColor, int strokeWeight_, int strokeAlpha){
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  noFill();
  rect(x, y, width_, height_, r);
}

void drawRectText(int x, int y, int width_, int height_, int r,
               String strokeColor, int strokeWeight_, int strokeAlpha,
               String fillColor, int fillAlpha, 
               String text_, int textSize_, String textColor, int textAlpha, int textX, int textY){

  // DRAW RECTANGLE
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  fillSwitch(fillColor, fillAlpha);
  rect(x, y, width_, height_, r);
  
  // DRAW TEXT
  if(!text_.equals("")){
    textSize(textSize_);
    fillSwitch(textColor, textAlpha);
    text(text_, x + textX, y + textY);    
  }
}

/*
ARROW
*/

void drawArrow(int x1, int y1, int x2, int y2, int arrowLen, 
               String strokeColor, int strokeWeight_, int strokeAlpha){
  
  float len = dist(x1, y1, x2, y2);
  float angle = atan2(y2 - y1, x2 - x1);
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  
  pushMatrix();
  translate(x1, y1);
  rotate(angle);
  line(0,0,len, 0);
  line(len, 0, len - arrowLen, -1 * arrowLen);
  line(len, 0, len - arrowLen, arrowLen);
  popMatrix();
}

void draw2wayArrow(int x1, int y1, int x2, int y2, int arrowLen, 
               String strokeColor, int strokeWeight_, int strokeAlpha){
  
  float len = dist(x1, y1, x2, y2);
  float angle = atan2(y2 - y1, x2 - x1);
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  
  pushMatrix();
  translate(x1, y1);
  rotate(angle);
  line(0,0,len, 0);
  line(0, 0, arrowLen, -1 * arrowLen);
  line(0, 0, arrowLen, arrowLen);
  line(len, 0, len - arrowLen, -1 * arrowLen);
  line(len, 0, len - arrowLen, arrowLen);
  popMatrix();
}

void drawBigArrow(int x, int y, int width_, int height_,
                  int arrowWidth, int arrowHeight, int angle, 
                  String strokeColor, int strokeWeight_, int strokeAlpha,
                  String fillColor, int fillAlpha){
     
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  
  // draw border less traiangle and rectangle
  noStroke();
  fillSwitch(fillColor, fillAlpha);
  int tx1 = width_ - arrowWidth;
  int ty1 = 0;
  int tx2 = tx1;
  int ty2 = height_;  
  int tx3 = width_;
  int ty3 = height_/2;
  triangle(tx1, ty1, tx2, ty2, tx3, ty3);
  
  int rx1 = 0;
  int ry1 = arrowHeight;
  int rx2 = width_ - arrowWidth;
  int ry2 = ry1;
  int rx3 = rx2;
  int ry3 = height_ - arrowHeight;
  int rx4 = rx1;
  int ry4 = ry3;
  int rectWidth = rx2 - rx1;
  int rectHeight = ry4 - ry1;
  rect(rx1, ry1, rectWidth, rectHeight);
  
  // draw border
  if(!strokeColor.equals("")){
    strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
    line(rx1, ry1, rx2, ry2);
    line(rx2, ry2, tx1, ty1);
    line(tx1, ty1, tx3, ty3);
    line(tx3, ty3, tx2, ty2);
    line(tx2, ty2, rx3, ry3);
    line(rx3, ry3, rx4, ry4);
    line(rx4, ry4, rx1, ry1);    
  }
  popMatrix();                    
}

void draw2wayBigArrow(int x, int y, int width_, int height_,
                  int arrowWidth, int arrowHeight, int angle, 
                  String strokeColor, int strokeWeight_, int strokeAlpha,
                  String fillColor, int fillAlpha){
     
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  
  // draw border less traiangle and rectangle
  noStroke();
  fillSwitch(fillColor, fillAlpha);
  
  int t1x1 = arrowWidth;
  int t1y1 = 0;
  int t1x2 = t1x1;
  int t1y2 = height_;
  int t1x3 = 0;
  int t1y3 = height_/2;
  triangle(t1x1, t1y1, t1x2, t1y2, t1x3, t1y3);
  
  int t2x1 = width_ - arrowWidth;
  int t2y1 = 0;
  int t2x2 = t2x1;
  int t2y2 = height_;  
  int t2x3 = width_;
  int t2y3 = height_/2;
  triangle(t2x1, t2y1, t2x2, t2y2, t2x3, t2y3);
  
  int rx1 = arrowWidth;
  int ry1 = arrowHeight;
  int rx2 = width_ - arrowWidth;
  int ry2 = ry1;
  int rx3 = rx2;
  int ry3 = height_ - arrowHeight;
  int rx4 = rx1;
  int ry4 = ry3;
  int rectWidth = rx2 - rx1;
  int rectHeight = ry4 - ry1;
  rect(rx1, ry1, rectWidth, rectHeight);
  
  // draw border
  if(!strokeColor.equals("")){
    strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
    line(rx1, ry1, rx2, ry2);
    line(rx2, ry2, t2x1, t2y1);
    line(t2x1, t2y1, t2x3, t2y3);
    line(t2x3, t2y3, t2x2, t2y2);
    line(t2x2, t2y2, rx3, ry3);
    line(rx3, ry3, rx4, ry4);
    line(rx4, ry4, t1x2, t1y2);
    line(t1x2, t1y2, t1x3, t1y3);
    line(t1x3, t1y3, t1x1, t1y1);
    line(t1x1, t1y1, rx1, ry1);    
  }
  popMatrix();                    
}

/*
OTHER
*/

void drawCylinder(int x, int y, int width_, int height_, int arcHeight,
                  String bodyColor, String ellipseColor, int bodyAlpha,
                  String strokeColor, int strokeWeight_, int strokeAlpha){        
  // bottom ellipse
  int e1_x = x + width_/2;
  int e1_y = y + height_ - arcHeight;
  int e1_w = width_;
  int e1_h = arcHeight;
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  fillSwitch(bodyColor, bodyAlpha);
  ellipse(e1_x, e1_y, e1_w, e1_h);
  
  // middle rectangle
  int r_x = x;
  int r_y = y + arcHeight;
  int r_w = width_;
  int r_h = height_ - (2 * arcHeight);
  noStroke();
  rect(r_x, r_y, r_w, r_h);
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  line(r_x, r_y, r_x, r_y + r_h);
  line(r_x + r_w, r_y, r_x + r_w, r_y + r_h);
  
  // top ellipse
  int e2_x = e1_x;
  int e2_y = y + arcHeight;
  int e2_w = e1_w;
  int e2_h = e1_h;
  fillSwitch(ellipseColor, bodyAlpha);
  ellipse(e2_x, e2_y, e2_w, e2_h);
}

void drawCloud(int x, int y, int width_,
               String strokeColor, int strokeWeight_, int strokeAlpha,
               String fillColor, int fillAlpha){

  int height_ = width_ * 2 / 3;
  drawRectStroke(x, y, width_, height_, 0, "black", 2, 255);
  
  strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
  fillSwitch(fillColor, fillAlpha);
  ellipse(x + width_/6, y + height_ * 3 / 4, width_ / 3, height_ / 2); 
  ellipse(x + width_ * 5/6, y + height_ *3/4, width_ / 3, height_ / 2);
  ellipse(x + width_ *7/12, y + height_*3/8, width_/2, height_*3/4); 
  ellipse(x + width_/3, y + height_/2, width_/4, width_/4);
                 
  drawRect(x + width_/6, y + height_ * 51/100, width_*2/3, height_ * 49/100, 0,
  fillColor, 0, 255, fillColor, 255);
  drawRect(x + width_/6, y + height_ * 51/100, width_*2/3, height_ * 49/100, 0,
  fillColor, 0, 255, fillColor, 255); 
}


/*
UTILITY
*/

void strokeSwitch(String strokeColor, int strokeWeight_, int strokeAlpha){
  strokeWeight(strokeWeight_);
  strokeColor = strokeColor.toLowerCase();
  
  // BASIC COLORS
  if(strokeColor.equals("")){
    noStroke();
  }else if(strokeColor.equals("black")){
    stroke(0, strokeAlpha);
  }else if(strokeColor.equals("white")){
    stroke(255, strokeAlpha);
    
  // FLAT DESIGN (http://flatuicolors.com/)   
  }else if(strokeColor.equals("turquoise")){
    stroke(26, 188, 156, strokeAlpha);
  }else if(strokeColor.equals("emerald")){
    stroke(46, 204, 113, strokeAlpha);
  }else if(strokeColor.equals("peterriver")){
    stroke(52, 152, 219, strokeAlpha); 
  }else if(strokeColor.equals("amethyst")){
    stroke(155, 89, 182, strokeAlpha);
  }else if(strokeColor.equals("wetasphalt")){
    stroke(52, 73, 94, strokeAlpha);
  }
  
  else if(strokeColor.equals("greensea")){
    stroke(22, 160, 133, strokeAlpha);
  }else if(strokeColor.equals("nepheritis")){
    stroke(39, 174, 96, strokeAlpha);
  }else if(strokeColor.equals("belizehole")){
    stroke(41, 128, 185, strokeAlpha);
  }else if(strokeColor.equals("wisteria")){
    stroke(142, 68, 173, strokeAlpha);
  }else if(strokeColor.equals("midnightblue")){
    stroke(44, 62, 80, strokeAlpha);
  }
  
  else if(strokeColor.equals("sunflower")){
    stroke(241, 196, 15, strokeAlpha);
  }else if(strokeColor.equals("carrot")){
    stroke(230, 126, 34, strokeAlpha);
  }else if(strokeColor.equals("alizarin")){
    stroke(231, 76, 60, strokeAlpha);
  }else if(strokeColor.equals("clouds")){
    stroke(236, 240, 241, strokeAlpha);
  }else if(strokeColor.equals("concrete")){
    stroke(149, 165, 166, strokeAlpha);
  }
  
  else if(strokeColor.equals("orange")){
    stroke(243, 156, 18, strokeAlpha);
  }else if(strokeColor.equals("pumpkin")){
    stroke(211, 84, 0, strokeAlpha);
  }else if(strokeColor.equals("pomegrante")){
    stroke(192, 57, 43, strokeAlpha);
  }else if(strokeColor.equals("silver")){
    stroke(189, 195, 199, strokeAlpha);
  }else if(strokeColor.equals("asbestos")){
    stroke(127, 140, 141, strokeAlpha);
  }
  
  else{
    println("ERROR"); 
  }  
}

void fillSwitch(String fillColor, int fillAlpha){
  fillColor = fillColor.toLowerCase();
  
  // BASIC COLORS
  if(fillColor.equals("")){
    noFill();
  }else if(fillColor.equals("black")){
    fill(0, fillAlpha);
  }else if(fillColor.equals("white")){
    fill(255, fillAlpha);
  }

  // FLAT DESIGN (http://flatuicolors.com/)
  else if(fillColor.equals("turquoise")){
    fill(26, 188, 156, fillAlpha);
  }else if(fillColor.equals("emerald")){
    fill(46, 204, 113, fillAlpha);
  }else if(fillColor.equals("peterriver")){
    fill(52, 152, 219, fillAlpha); 
  }else if(fillColor.equals("amethyst")){
    fill(155, 89, 182, fillAlpha);
  }else if(fillColor.equals("wetasphalt")){
    fill(52, 73, 94, fillAlpha);
  }
  
  else if(fillColor.equals("greensea")){
    fill(22, 160, 133, fillAlpha);
  }else if(fillColor.equals("nepheritis")){
    fill(39, 174, 96, fillAlpha);
  }else if(fillColor.equals("belizehole")){
    fill(41, 128, 185, fillAlpha);
  }else if(fillColor.equals("wisteria")){
    fill(142, 68, 173, fillAlpha);
  }else if(fillColor.equals("midnightblue")){
    fill(44, 62, 80, fillAlpha);
  }
  
  else if(fillColor.equals("sunflower")){
    fill(241, 196, 15, fillAlpha);
  }else if(fillColor.equals("carrot")){
    fill(230, 126, 34, fillAlpha);
  }else if(fillColor.equals("alizarin")){
    fill(231, 76, 60, fillAlpha);
  }else if(fillColor.equals("clouds")){
    fill(236, 240, 241, fillAlpha);
  }else if(fillColor.equals("concrete")){
    fill(149, 165, 166, fillAlpha);
  }
  
  else if(fillColor.equals("orange")){
    fill(243, 156, 18, fillAlpha);
  }else if(fillColor.equals("pumpkin")){
    fill(211, 84, 0, fillAlpha);
  }else if(fillColor.equals("pomegrante")){
    fill(192, 57, 43, fillAlpha);
  }else if(fillColor.equals("silver")){
    fill(189, 195, 199, fillAlpha);
  }else if(fillColor.equals("asbestos")){
    fill(127, 140, 141, fillAlpha);
  }
  
  // NOTHING
  else{
    println("ERROR"); 
  }  
}

void drawGrid(String strokeColor, int strokeWeight_, int strongStrokeWeight, int strokeAlpha,
              int wPitch, int wsPitch, int hPitch, int hsPitch){  
  int x;
  for(x=wPitch; x<width; x+=wPitch){
      if(x % wsPitch == 0){
          strokeSwitch(strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
      }
      line(x, 0, x, height);
  }
  
  int y;
  for(y=hPitch; y<height; y+=hPitch){
      if(y % hsPitch == 0){
          strokeSwitch(strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          strokeSwitch(strokeColor, strokeWeight_, strokeAlpha);
      }
      line(0, y, width, y);  
  }
}