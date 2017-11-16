// BASIC COLORS
final int TRANSPARENT = 0;
final int BLACK = 1;
final int WHITE = 2;
final int RED = 3;
final int BLUE = 4;
final int GREEN = 5;

// FLAT DESIGN COLORS
final int TURQUOISE = 100;
final int EMERALD = 101;
final int PETERRIVER = 102;
final int AMETHYST = 103;
final int WETASPHALT = 104;
final int GREENSEA = 105;
final int NEPHERITIS = 106;
final int BELIZEHOLE = 107;
final int WISTERIA = 108;
final int MIDNIGHTBLUE = 109;
final int SUNFLOWER = 110;
final int CARROT = 111;
final int ALIZARIN = 112;
final int CLOUDS = 113;
final int CONCRETE = 114;
final int ORANGE = 115;
final int PUMPKIN = 116;
final int POMEGRANATE = 117;
final int SILVER = 118;
final int ASBESTOS = 119;

final int ALMONDFROST = 0;
final int IRONGRAY = 0;
final int BLUEGEM = 0;
final int WHITESMOKE = 0;
final int TERRACOTTA = 0;

// SAVE
String SAVE_MODE_BACKGROUND = "save_bg";
String SAVE_MODE_TRANSPARENT = "save_transparent";

/*
UTILITY
*/

void move(PGraphics pg, PGraphics pgb, int x1, int y1, int r1, int x2, int y2, int r2, 
          int currentFrame, int startFrame, int endFrame){
            
  if(currentFrame < startFrame) return;
  if(endFrame < currentFrame) return;
  
  float p = (currentFrame - startFrame)/float(endFrame - startFrame);
  int x = x1 + int((x2 - x1) * p);
  int y = y1 + int((y2 - y1) * p);
  int r = r1 + int((r2 - r1) * p);
  
  if(r1 == 0 && r2 == 0){
    pgb.image(pg, x, y);
  }else{
    pgb.pushMatrix();
    pgb.translate(x, y);
    pgb.rotate(radians(r));
    pgb.image(pg, 0, 0);
    pgb.popMatrix();    
  }
}

void saveGraphics(PGraphics pg, String fpath){
  if(PROCESSING_SAVE){
    String fileName = frameCount + ".png";
    save(fileName);
  }
}

/*
LINE
*/

void drawLine(PGraphics pg, int x1, int y1, int x2, int y2,
              int strokeColor, int strokeWeight_, int strokeAlpha){
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha); 
  pg.line(x1, y1, x2, y2);
}

void drawDashLine(PGraphics pg, int x1, int y1, int x2, int y2,
              int strokeColor, int strokeWeight_, int strokeAlpha){
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha); 

  float  bx, by;
  int    j = 0;  
  String hasen = "0101"; 
  bx = x1;
  by = y1;
  
  for( int i = 0; i <= 30; i++ ){
    float px = lerp( x1, x2, i/30.0 );
    float py = lerp( y1, y2, i/30.0 );
    String ptn = hasen.substring(j,j+1);
    j++;
    if( j >= hasen.length() ){ j = 0; }
    
    if( ptn.equals("1") == true ){
      pg.line(bx, by, px, py);
    } else {
      pg.point(px, py);
    }
    bx = px;
    by = py;
  }
}

void drawArrowLine(PGraphics pg, int x1, int y1, int x2, int y2, int arrowLen, 
               int strokeColor, int strokeWeight_, int strokeAlpha,
               boolean twoWay){
  
  float len = dist(x1, y1, x2, y2);
  float angle = atan2(y2 - y1, x2 - x1);
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  
  pg.pushMatrix();
  pg.translate(x1, y1);
  pg.rotate(angle);
  pg.line(0,0,len, 0);
  
  // at x2, y2
  pg.line(len, 0, len - arrowLen, -1 * arrowLen);
  pg.line(len, 0, len - arrowLen, arrowLen);
  
  // at x1, y1
  if(twoWay){
    pg.line(0, 0, arrowLen, -1 * arrowLen);
    pg.line(0, 0, arrowLen, arrowLen);    
  }
  
  pg.popMatrix();
}


/*
TEXT
*/

void drawText(PGraphics pg, int x, int y, 
              String text_, int textSize_, int textColor, int textAlpha){
                
  pg.textSize(textSize_);  
  setFill(pg, textColor, textAlpha);
  pg.text(text_, x, y);
}


/*
RECTANGLE
*/
   
PGraphics getPG_rect(int width_, int height_,int r,
                     int strokeColor, float strokeWeight_, int strokeAlpha,
                     int fillColor, int fillAlpha){
                       
  PGraphics pg = createGraphics(width_ , height_);
  pg.beginDraw();
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setFill(pg, fillColor, fillAlpha);
  
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  pg.rect(x, y, w, h, r);
  
  pg.endDraw();
  return pg;
}

PGraphics getPG_rectStroke(int width_, int height_,int r,
                     int strokeColor, float strokeWeight_, int strokeAlpha){
                       
  PGraphics pg = createGraphics(width_ , height_);
  pg.beginDraw();
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setFill(pg, TRANSPARENT, 0);
  
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) -1;
  int h = height_ - ceil(strokeWeight_) -1;
  pg.rect(x, y, w, h, r);
  
  pg.endDraw();
  return pg;
}

PGraphics getPG_rectText(int width_, int height_,int r,
                         int strokeColor, float strokeWeight_, int strokeAlpha,
                         int fillColor, int fillAlpha,
                         String text_, int textSize_, int textColor, int textAlpha, int textX, int textY){
                       
  PGraphics pg = createGraphics(width_ , height_);
  pg.beginDraw();
  pg.background(127);
  
  // Rectangle
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setFill(pg, fillColor, fillAlpha);
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  pg.rect(x, y, w, h, r);
  
  // Text
  pg.textSize(textSize_);
  setFill(pg, textColor, textAlpha);
  pg.text(text_, textX, textY);  
    
  pg.endDraw();
  return pg;
}


/*
OTHER Objects
*/

PGraphics getPG_bigArrow(int width_, int height_,
                  int arrowWidth, int arrowHeight,
                  int strokeColor, int strokeWeight_, int strokeAlpha,
                  int fillColor, int fillAlpha){
                    
  PGraphics pg = createGraphics(width_, height_);
  pg.beginDraw();
  
  // draw border less traiangle and rectangle
  pg.noStroke();
  setFill(pg, fillColor, fillAlpha);
  
  // inside size
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  
  int tx1 = x + w - arrowWidth;
  int ty1 = y;
  int tx2 = tx1;
  int ty2 = y + h;  
  int tx3 = x + w;
  int ty3 = y + h/2;
  pg.triangle(tx1, ty1, tx2, ty2, tx3, ty3);
  
  int rx1 = x;
  int ry1 = y + arrowHeight;
  int rx2 = x + w - arrowWidth;
  int ry2 = ry1;
  int rx3 = rx2;
  int ry3 = y + h - arrowHeight;
  int rx4 = rx1;
  int ry4 = ry3;
  int rectWidth = rx2 - rx1;
  int rectHeight = ry4 - ry1;
  pg.rect(rx1, ry1, rectWidth, rectHeight);
  
  // draw border
  if(strokeColor != TRANSPARENT){
    setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
    pg.line(rx1, ry1, rx2, ry2);
    pg.line(rx2, ry2, tx1, ty1);
    pg.line(tx1, ty1, tx3, ty3);
    pg.line(tx3, ty3, tx2, ty2);
    pg.line(tx2, ty2, rx3, ry3);
    pg.line(rx3, ry3, rx4, ry4);
    pg.line(rx4, ry4, rx1, ry1);    
  }
  
  pg.endDraw();
  return pg;        
}

PGraphics getPG_2wayBigArrow(int width_, int height_,
                  int arrowWidth, int arrowHeight,
                  int strokeColor, int strokeWeight_, int strokeAlpha,
                  int fillColor, int fillAlpha){
     
  PGraphics pg = createGraphics(width_, height_);
  pg.beginDraw();
  
  // inside size
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  
  // draw border less traiangle and rectangle
  pg.noStroke();
  setFill(pg, fillColor, fillAlpha);


  
  int t1x1 = arrowWidth;
  int t1y1 = 0;
  int t1x2 = t1x1;
  int t1y2 = height_;
  int t1x3 = 0;
  int t1y3 = height_/2;
  pg.triangle(t1x1, t1y1, t1x2, t1y2, t1x3, t1y3);
  
  int t2x1 = width_ - arrowWidth;
  int t2y1 = 0;
  int t2x2 = t2x1;
  int t2y2 = height_;  
  int t2x3 = width_;
  int t2y3 = height_/2;
  pg.triangle(t2x1, t2y1, t2x2, t2y2, t2x3, t2y3);
  
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
  pg.rect(rx1, ry1, rectWidth, rectHeight);
  
  // draw border
  if(strokeColor != TRANSPARENT){
    setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
    pg.line(rx1, ry1, rx2, ry2);
    pg.line(rx2, ry2, t2x1, t2y1);
    pg.line(t2x1, t2y1, t2x3, t2y3);
    pg.line(t2x3, t2y3, t2x2, t2y2);
    pg.line(t2x2, t2y2, rx3, ry3);
    pg.line(rx3, ry3, rx4, ry4);
    pg.line(rx4, ry4, t1x2, t1y2);
    pg.line(t1x2, t1y2, t1x3, t1y3);
    pg.line(t1x3, t1y3, t1x1, t1y1);
    pg.line(t1x1, t1y1, rx1, ry1);    
  }
  
  pg.endDraw();
  return pg;
}


PGraphics getPG_cylinder(int width_, int height_, int arcHeight,
                         int strokeColor, int strokeWeight_, int strokeAlpha,
                         int bodyColor, int ellipseColor, int bodyAlpha){   
                    
  PGraphics pg = createGraphics(width_ + 10, height_ + 10);
  pg.beginDraw();
  
  // bottom ellipse
  int e1_x = width_/2;
  int e1_y = height_ - arcHeight;
  int e1_w = width_;
  int e1_h = arcHeight;
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setFill(pg, bodyColor, bodyAlpha);
  pg.ellipse(e1_x, e1_y, e1_w, e1_h);
  
  // middle rectangle
  int r_x = 0;
  int r_y = arcHeight;
  int r_w = width_;
  int r_h = height_ - (2 * arcHeight);
  pg.noStroke();
  pg.rect(r_x, r_y, r_w, r_h);
  setStroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  pg.line(r_x, r_y, r_x, r_y + r_h);
  pg.line(r_x + r_w, r_y, r_x + r_w, r_y + r_h);
  
  // top ellipse
  int e2_x = e1_x;
  int e2_y = arcHeight;
  int e2_w = e1_w;
  int e2_h = e1_h;
  setFill(pg, ellipseColor, bodyAlpha);
  pg.ellipse(e2_x, e2_y, e2_w, e2_h);
  
  pg.endDraw();
  return pg;
}

/*
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
*/

/*
UTILITY
*/

void setStroke(PGraphics pg, int strokeColor, float strokeWeight_, int strokeAlpha){
  pg.strokeWeight(strokeWeight_);
  
  switch(strokeColor){
    // BASIC COLORS
    case 0:
      pg.noStroke(); break;
    case BLACK:
      pg.stroke(0, strokeAlpha); break;
    case WHITE:
      pg.stroke(255, strokeAlpha); break;
    
    // FLAT DESIGN (http://flatuicolors.com/)
    case TURQUOISE:
      pg.stroke(26, 188, 156, strokeAlpha); break;
    case EMERALD:
      pg.stroke(46, 204, 113, strokeAlpha); break;
    case PETERRIVER:
      pg.stroke(52, 152, 219, strokeAlpha); break;
    case AMETHYST:
      pg.stroke(155, 89, 182, strokeAlpha); break;
    case WETASPHALT:
      pg.stroke(52, 73, 94, strokeAlpha); break;
    case GREENSEA:
      pg.stroke(22, 160, 133, strokeAlpha); break;
    case NEPHERITIS:
      pg.stroke(39, 174, 96, strokeAlpha); break;
    case BELIZEHOLE:
      pg.stroke(41, 128, 185, strokeAlpha); break;
    case WISTERIA:
      pg.stroke(142, 68, 173, strokeAlpha); break;
    case MIDNIGHTBLUE:
      pg.stroke(44, 62, 80, strokeAlpha); break;
    case SUNFLOWER:
      pg.stroke(241, 196, 15, strokeAlpha); break;
    case CARROT:
      pg.stroke(230, 126, 34, strokeAlpha); break;
    case ALIZARIN:
      pg.stroke(231, 76, 60, strokeAlpha); break;
    case CLOUDS:
      pg.stroke(236, 240, 241, strokeAlpha); break;
    case CONCRETE:
      pg.stroke(149, 165, 166, strokeAlpha); break;
    case ORANGE:
      pg.stroke(243, 156, 18, strokeAlpha); break;
    case PUMPKIN:
      pg.stroke(211, 84, 0, strokeAlpha); break;
    case POMEGRANATE:
      pg.stroke(192, 57, 43, strokeAlpha); break;
    case SILVER:
      pg.stroke(189, 195, 199, strokeAlpha); break;
    case ASBESTOS:
      pg.stroke(127, 140, 141, strokeAlpha); break;
    default:
      println("ERROR: COLOR HAS PROBLEM");
  }
}

void setFill(PGraphics pg, int fillColor, int fillAlpha){
  switch(fillColor){
    // BASIC COLORS
    case TRANSPARENT:
      pg.noFill(); break;
    case BLACK:
      pg.fill(0, fillAlpha); break;
    case WHITE:
      pg.fill(255, fillAlpha); break;
    
    // FLAT DESIGN (http://flatuicolors.com/)
    case TURQUOISE:
      pg.fill(26, 188, 156, fillAlpha); break;
    case EMERALD:
      pg.fill(46, 204, 113, fillAlpha); break;
    case PETERRIVER:
      pg.fill(52, 152, 219, fillAlpha); break;
    case AMETHYST:
      pg.fill(155, 89, 182, fillAlpha); break;
    case WETASPHALT:
      pg.fill(52, 73, 94, fillAlpha); break;
    case GREENSEA:
      pg.fill(22, 160, 133, fillAlpha); break;
    case NEPHERITIS:
      pg.fill(39, 174, 96, fillAlpha); break;
    case BELIZEHOLE:
      pg.fill(41, 128, 185, fillAlpha); break;
    case WISTERIA:
      pg.fill(142, 68, 173, fillAlpha); break;
    case MIDNIGHTBLUE:
      pg.fill(44, 62, 80, fillAlpha); break;
    case SUNFLOWER:
      pg.fill(241, 196, 15, fillAlpha); break;
    case CARROT:
      pg.fill(230, 126, 34, fillAlpha); break;
    case ALIZARIN:
      pg.fill(231, 76, 60, fillAlpha); break;
    case CLOUDS:
      pg.fill(236, 240, 241, fillAlpha); break;
    case CONCRETE:
      pg.fill(149, 165, 166, fillAlpha); break;
    case ORANGE:
      pg.fill(243, 156, 18, fillAlpha); break;
    case PUMPKIN:
      pg.fill(211, 84, 0, fillAlpha); break;
    case POMEGRANATE:
      pg.fill(192, 57, 43, fillAlpha); break;
    case SILVER:
      pg.fill(189, 195, 199, fillAlpha); break;
    case ASBESTOS:
      pg.fill(127, 140, 141, fillAlpha); break;
    default:
      println("ERROR: COLOR HAS PROBLEM");
  }
}

void drawGrid(PGraphics pg, int strokeColor, int strokeWeight_, 
              int strongStrokeWeight, int strokeAlpha,
              int wPitch, int wsPitch, int hPitch, int hsPitch){  

  for(int x=wPitch; x<width; x+=wPitch){
      if(x % wsPitch == 0){
          drawLine(pg, x, 0, x, pg.height, strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          drawLine(pg, x, 0, x, pg.height, strokeColor, strokeWeight_, strokeAlpha);
      }
  }
  
  for(int y=hPitch; y<height; y+=hPitch){
      if(y % hsPitch == 0){
          drawLine(pg, 0, y, pg.width, y, strokeColor, strongStrokeWeight, strokeAlpha);
      }else{
          drawLine(pg, 0, y, pg.width, y, strokeColor, strokeWeight_, strokeAlpha);
      }
  }
}