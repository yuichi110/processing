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
final int NEPHRITIS = 106;
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

/*
UTILITY
*/

void movePG(PGraphics pgb, PGraphics pg, 
            int x1, int y1, int r1, int x2, int y2, int r2, 
            int currentFrame, int startFrame, int endFrame){
            
  if(currentFrame < startFrame) return;
  if(endFrame < currentFrame) return;
  
  if(processing_debug){
    setPG_stroke(pgb, RED, 2, 255);
    setPG_fill(pgb, RED, 255);
    pgb.line(x1, y1, x2, y2);
    pgb.ellipse(x1, y1, 10, 10);
    pgb.ellipse(x2, y2, 10, 10);
  }
  
  float p = (currentFrame - startFrame)/float(endFrame - startFrame);
  int x = x1 + int((x2 - x1) * p);
  int y = y1 + int((y2 - y1) * p);
  int r = r1 + int((r2 - r1) * p);
  
  if(r1 == 0 && r2 == 0){
    pgb.image(pg, x, y);
  }else{
    // rotate at the center of the moving object
    pgb.pushMatrix();
    pgb.translate(x + pg.width/2, y + pg.height/2);
    pgb.rotate(radians(r));
    pgb.image(pg, -pg.width/2,  -pg.height/2);
    pgb.popMatrix();  
  }
}

void movePG_bezier(PGraphics pgb, PGraphics pg,
                   int x1, int y1, int r1, int x2, int y2, int x3, int y3, int x4, int y4, int r2,
                   int currentFrame, int startFrame, int endFrame){

  if(currentFrame < startFrame) return;
  if(endFrame < currentFrame) return;

  if(processing_debug){
     setPG_stroke(pgb, BLUE, 2, 255);
     setPG_fill(pgb, BLUE, 255);
     pgb.line(x1, y1, x2, y2);
     pgb.line(x3, y3, x4, y4);
     pgb.ellipse(x2, y2, 10, 10);
     pgb.ellipse(x3, y3, 10, 10);
     
     setPG_stroke(pgb, RED, 2, 255);
     setPG_fill(pgb, RED, 255);
     pgb.ellipse(x1, y1, 10, 10);
     pgb.ellipse(x4, y4, 10, 10);
     setPG_fill(pgb, TRANSPARENT, 255);
     pgb.bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  
  float p = (currentFrame - startFrame)/float(endFrame - startFrame);
  float x = bezierPoint(x1, x2, x3, x4, p);
  float y = bezierPoint(y1, y2, y3, y4, p);
  int r = r1 + int((r2 - r1) * p);
  
  if(r1 == 0 && r2 == 0){
    pgb.image(pg, x, y);
  }else{
    // rotate at the center of the moving object
    pgb.pushMatrix();
    pgb.translate(x + pg.width/2, y + pg.height/2);
    pgb.rotate(radians(r));
    pgb.image(pg, -pg.width/2,  -pg.height/2);
    pgb.popMatrix();   
  }
}

class Flow{
  PGraphics pgb;
  PGraphics pg;
  PVector[] flowArray;
  int[] frameArray;
  int[] anchorFrames;
  boolean startMode = false;
  boolean stopMode = false;
  boolean enabled = false;
  
  Flow(int[] xs, int ys[], int frames, int numItems){
    
    this.flowArray = new PVector[frames];
    flowArray[0] = new PVector(xs[0], ys[0]);
    flowArray[flowArray.length-1] = new PVector(xs[xs.length-1], ys[xs.length-1]);
    
    float sum_distance = 0;
    for(int i=0; i<xs.length-1; i++){
      sum_distance += dist(xs[i], ys[i], xs[i+1], ys[i+1]); 
    }
    println("sum distance: " + sum_distance);
    
    anchorFrames = new int[xs.length];
    float sum_distance2 = 0;
    for(int i=0; i<anchorFrames.length-1; i++){
      sum_distance2 += dist(xs[i], ys[i], xs[i+1], ys[i+1]);
      anchorFrames[i+1] = int(frames * (sum_distance2 / sum_distance));
      println("anchorFrames1: " + anchorFrames[i+1]);
    }
    anchorFrames[0] = 0;
    anchorFrames[anchorFrames.length-1] = frames - 1;
    for(int i=0; i<anchorFrames.length; i++){
      println("anchorFrames2: " + anchorFrames[i]);
    }
    
    for(int i=0; i<anchorFrames.length-1; i++){
      int startFrame = anchorFrames[i];
      int x1 = xs[i];
      int y1 = ys[i];
      int endFrame = anchorFrames[i+1];
      int x2 = xs[i+1];
      int y2 = ys[i+1];
      
      for(int currentFrame=startFrame; currentFrame<endFrame; currentFrame++){
        float p = (currentFrame - startFrame)/float(endFrame - startFrame);
        int x = x1 + int((x2 - x1) * p);
        int y = y1 + int((y2 - y1) * p);
        flowArray[currentFrame] = new PVector(x, y);
      }
    }
    
    frameArray = new int[numItems];
    for(int i=0; i<frameArray.length; i++){
      frameArray[i] = -1; 
    }
    
  }
  
  void start(){
    startMode = true;
    stopMode = false;
    enabled = true;
  }
  
  void stop(){
    startMode = false;
    stopMode = true;
  }
  
  void draw(PGraphics pgb, PGraphics pg){  
    if(!enabled){
      // avoid useless computation.
      return; 
    }
    
    if(processing_debug){
      String text = "FrameArray: ";
      for(int i=0; i<frameArray.length; i++){
        text += frameArray[i] + ", ";
      }
      println(text);  
      
      setPG_stroke(pgb, RED, 10, 255);
      setPG_fill(pgb, TRANSPARENT, 0);
      for(int i=0; i<anchorFrames.length; i++){
        int anchorFrame = anchorFrames[i];
        PVector pv = flowArray[anchorFrame];
        if(pv != null){
          pgb.ellipse(pv.x -10, pv.y -10, 20, 20);
        }else{
          println("ERROR");
        }
      }    
    }

    // Start showing object if previous object is at good location
    if(startMode){
      int startLine = flowArray.length / frameArray.length;
      boolean allStarted = true;
      for(int i=0; i<frameArray.length; i++){
        if(i==0){
          if(frameArray[0]==-1){
            frameArray[0] = 0;
          }
        }else{
          if(frameArray[i]==-1 && frameArray[i-1] == startLine){
            frameArray[i] = 0;
          }
        }
        if(frameArray[i] == -1){
          allStarted = false; 
        }
      }
      if(allStarted){
        startMode = false; 
      }
    }
    
    // Draw object which are started
    int itemWidth = pg.width;
    int itemHeight = pg.height;
    for(int i=0; i<frameArray.length; i++){
      if(frameArray[i] == -1){
        continue; 
      }  
      PVector pv = flowArray[frameArray[i]];
      if(pv != null){
        pgb.image(pg, pv.x - itemWidth, pv.y - itemHeight);
      }else{
        println("ERROR");
      } 
    }
    
    // Update frame
    int frameMax = flowArray.length - 1;
    for(int i=0; i<frameArray.length; i++){
      if(frameArray[i] == -1){
        continue; 
      }
      if(frameArray[i] == frameMax){
        if(stopMode){
          frameArray[i] = -1;
          boolean allMinus1 = true;
          for(int j=0; j<frameArray.length; j++){
            if(frameArray[j] != -1){
              allMinus1 = false;
            }
          }
          if(allMinus1){
            // all object are stopped. Disable drawing.
            enabled = false; 
          }
        }else{
          frameArray[i] = 0; 
        }
      }else{
        frameArray[i] = frameArray[i] +1;
      }
    }
  }
}

/*
LINE
*/

void drawPG_line(PGraphics pg, int x1, int y1, int x2, int y2,
                 int strokeColor, float strokeWeight_, int strokeAlpha){
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha); 
  pg.line(x1, y1, x2, y2);
}

void drawPG_lineDash(PGraphics pg, int x1, int y1, int x2, int y2,
                     int strokeColor, int strokeWeight_, int strokeAlpha){
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha); 

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

void drawPG_lineArrow(PGraphics pg, int x1, int y1, int x2, int y2, int arrowLen, 
                      int strokeColor, int strokeWeight_, int strokeAlpha,
                      boolean twoWay){
  
  float len = dist(x1, y1, x2, y2);
  float angle = atan2(y2 - y1, x2 - x1);
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  
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

void drawPG_text(PGraphics pg, int x, int y, 
                 String text_, int textSize_, int textColor, int textAlpha){
                
  pg.textSize(textSize_);  
  setPG_fill(pg, textColor, textAlpha);
  pg.text(text_, x, y);
}


/*
RECTANGLE
*/
   
   
void drawPG_rect(PGraphics pg, int x, int y, int width_, int height_, int r, 
                 int strokeColor, float strokeWeight_, int strokeAlpha,
                 int fillColor, int fillAlpha){
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, fillColor, fillAlpha);
  pg.rect(x, y, width_, height_, r);
}

PGraphics getPG_rect(int width_, int height_,int r,
                     int strokeColor, float strokeWeight_, int strokeAlpha,
                     int fillColor, int fillAlpha){
                       
  PGraphics pg = createGraphics(width_ , height_);
  pg.beginDraw();
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, fillColor, fillAlpha);
  
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
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, TRANSPARENT, 0);
  
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
                         int textX, int textY, String text_, int textSize_, int textColor, int textAlpha){
                       
  PGraphics pg = createGraphics(width_ , height_);
  pg.beginDraw();
  pg.background(127);
  
  // Rectangle
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, fillColor, fillAlpha);
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  pg.rect(x, y, w, h, r);
  
  // Text
  pg.textSize(textSize_);
  setPG_fill(pg, textColor, textAlpha);
  pg.text(text_, textX, textY);  
    
  pg.endDraw();
  return pg;
}


void drawPG_ellipse(){
  
}

void getPG_ellipse(){
  
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
  setPG_fill(pg, fillColor, fillAlpha);
  
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
    setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
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
  setPG_fill(pg, fillColor, fillAlpha);

  int t1x1 = x + arrowWidth;
  int t1y1 = y;
  int t1x2 = t1x1;
  int t1y2 = y + h;
  int t1x3 = x;
  int t1y3 = y + h/2;
  pg.triangle(t1x1, t1y1, t1x2, t1y2, t1x3, t1y3);
  
  int t2x1 = x + w - arrowWidth;
  int t2y1 = y;
  int t2x2 = t2x1;
  int t2y2 = y + h;  
  int t2x3 = x + w;
  int t2y3 = y + h/2;
  pg.triangle(t2x1, t2y1, t2x2, t2y2, t2x3, t2y3);
  
  int rx1 = x + arrowWidth;
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
    setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
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
                    
  PGraphics pg = createGraphics(width_, height_);
  pg.beginDraw();
  
  // inside size
  int x = ceil(strokeWeight_/2);
  int y = ceil(strokeWeight_/2);
  int w = width_ - ceil(strokeWeight_) - 1;
  int h = height_ - ceil(strokeWeight_) - 1;
  
  // bottom ellipse
  int e1_x = x + w/2;
  int e1_y = y + h - arcHeight;
  int e1_w = w;
  int e1_h = arcHeight;
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, bodyColor, bodyAlpha);
  pg.ellipse(e1_x, e1_y, e1_w, e1_h);
  
  // middle rectangle
  int r_x = x;
  int r_y = y + arcHeight;
  int r_w = w;
  int r_h = h - (2 * arcHeight);
  pg.noStroke();
  pg.rect(r_x, r_y, r_w, r_h);
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  pg.line(r_x, r_y, r_x, r_y + r_h);
  pg.line(r_x + r_w, r_y, r_x + r_w, r_y + r_h);
  
  // top ellipse
  int e2_x = e1_x;
  int e2_y = y + arcHeight;
  int e2_w = e1_w;
  int e2_h = e1_h;
  setPG_fill(pg, ellipseColor, bodyAlpha);
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


PGraphics getPG_horizontalRects(int[] widths, int height_, 
                                int strokeColor, float strokeWeight_, int strokeAlpha,
                                int[] fillColors, int[] fillAlpha,
                                int[] textXs, int textY, String[] texts, int textSize, int[] textColors, int[] textAlpha){

  int[] xs = new int[widths.length];
  int y = ceil(strokeWeight_/2);
  int width_ = 0;
  int w = 0;
  int h = height_ - ceil(strokeWeight_) - 1;
  
  // update width and x positions
  for(int i=0; i<widths.length; i++){
    width_ += widths[i];
    
    if(i==0){
      xs[i] = ceil(strokeWeight_/2);
    }else{
      //sum of previous rects width + X
      xs[i] = w + xs[0]; 
    }
    
    if(widths.length == 0){
      widths[i] = widths[i] - ceil(strokeWeight_);
    }else if(i==0 || i==widths.length-1){
      widths[i] = widths[i] - ceil(strokeWeight_/2) - 1;
    }
    w += widths[i];
  }
  
  PGraphics pg = createGraphics(width_ + 1 , height_);
  pg.beginDraw();
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  
  for(int i=0; i<widths.length; i++){
    // rect
    setPG_fill(pg, fillColors[i], 255);
    pg.rect(xs[i], y, widths[i], h);
    
    // text
    if(!texts[i].equals("")){
      drawPG_text(pg, xs[i] + textXs[i], textY, texts[i], textSize, textColors[i], 255);
    }
  }
  
  pg.endDraw();
  return pg;                 
}

PGraphics getPG_verticalRects(int width_, int[] heights, 
                              int strokeColor, float strokeWeight_, int strokeAlpha,
                              int[] fillColors, int[] fillAlphas,
                               int[] textXs, int[] textYs, String[] texts, int textSize, int[] textColors, int[] textAlphas){

  int x = ceil(strokeWeight_/2);
  int[] ys = new int[heights.length];
  int w = width_ - ceil(strokeWeight_) - 1;
  int height_ = 0;
  int h = 0;
  
  // update width and x positions
  for(int i=0; i<heights.length; i++){
    height_ += heights[i];
    
    if(i==0){
      ys[i] = ceil(strokeWeight_/2);
    }else{
      //sum of previous rects heights + Y
      ys[i] = h + ys[0]; 
    }
    
    if(heights.length == 0){
      heights[i] = heights[i] - ceil(strokeWeight_);
    }else if(i==0 || i==heights.length-1){
      heights[i] = heights[i] - ceil(strokeWeight_/2) - 1;
    }
    h += heights[i];
  }
  
  PGraphics pg = createGraphics(width_ + 1 , height_);
  pg.beginDraw();
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  
  for(int i=0; i<heights.length; i++){
    // rect
    setPG_fill(pg, fillColors[i], 255);
    pg.rect(x, ys[i], w, heights[i]);
    
    // text
    if(!texts[i].equals("")){
      drawPG_text(pg, x + textXs[i], ys[i] + textYs[i], texts[i], textSize, textColors[i], 255);
    }
  }
  
  pg.endDraw();
  return pg;                 
}

PGraphics getPG_table(int[] columnWidths, int height_, 
                      int strokeColor, float strokeWeight_, int strokeAlpha,
                      int fillColor, int fillAlpha,
                      int[][] textXs, int textY, String[][] texts, int textSize, int[][] textColors, int[][] textAlphas){
  
  int width_ = 0;
  for(int i=0; i<columnWidths.length; i++){
    width_ += columnWidths[i]; 
  }
  PGraphics pg = getPG_rect(width_, height_, 0, strokeColor, strokeWeight_, strokeAlpha, fillColor, fillAlpha);
  pg.beginDraw();
  
  // Draw Row lines
  int row = texts.length;
  int row_height = height_ / row;
  println(row_height);
  for(int i=1; i<row; i++){
    drawPG_line(pg, 0, row_height * i, width_, row_height * i, 
             strokeColor, strokeWeight_, strokeAlpha);
    println("draw" + i);
  }
  
  // Draw Column Lines
  int columnX = 0;
  for(int i=0; i<columnWidths.length - 1; i++){
    drawPG_line(pg, columnX + columnWidths[i], 0, columnX + columnWidths[i], height_, 
             strokeColor, strokeWeight_, strokeAlpha);  
    columnX += columnWidths[i];
  }                        
              
  // Draw Texts
  for(int i=0; i<row; i++){
    int cx = 0;
    for(int j=0; j<columnWidths.length; j++){
      int x = cx + textXs[i][j];
      int y = row_height * i + textY;
      String text = texts[i][j];
      int textColor = textColors[i][j];
      drawPG_text(pg, x, y, text, textSize, textColor, 255);
      cx += columnWidths[j];
    }
  }
  
  pg.endDraw();
  return pg;
}

PGraphics getPG_balloon(int rectX, int rectY, int rectW, int rectH, int r,
                        int triX1, int triY1, int triX2, int triY2, int triX3, int triY3,
                        int fillRectX, int fillRectY, int fillRectW, int fillRectH,
                        int strokeColor, float strokeWeight_, int strokeAlpha,
                        int fillColor, int fillAlpha, int fillRectColor){
                          
  int[] xvalues = {rectX + rectW, triX1, triX2, triX3};
  int width_ = max(xvalues) + ceil(strokeWeight_);
  int[] yvalues = {rectY + rectH, triY1, triY2, triY3};
  int height_ = max(yvalues) + ceil(strokeWeight_);
  
  PGraphics pg = createGraphics(width_ + 1 , height_);
  pg.beginDraw();
  
  setPG_stroke(pg, strokeColor, strokeWeight_, strokeAlpha);
  setPG_fill(pg, fillColor, fillAlpha);
  if(rectX < strokeWeight_) rectX = ceil(strokeWeight_);
  if(rectY < strokeWeight_) rectY = ceil(strokeWeight_);
  pg.rect(rectX, rectY, rectW, rectH, r);
  
  if(triX1 < strokeWeight_) triX1 = ceil(strokeWeight_);
  if(triY1 < strokeWeight_) triY1 = ceil(strokeWeight_);  
  if(triX2 < strokeWeight_) triX2 = ceil(strokeWeight_);
  if(triY2 < strokeWeight_) triY2 = ceil(strokeWeight_); 
  if(triX3 < strokeWeight_) triX3 = ceil(strokeWeight_);
  if(triY3 < strokeWeight_) triY3 = ceil(strokeWeight_); 
  pg.triangle(triX1, triY1, triX2, triY2, triX3, triY3);
  
  pg.noStroke();
  setPG_fill(pg, fillRectColor, fillAlpha);
  pg.rect(fillRectX, fillRectY, fillRectW, fillRectH);
  
  pg.endDraw();                        
  return pg;
}
/*
UTILITY
*/

void setPG_stroke(PGraphics pg, int strokeColor, float strokeWeight_, int strokeAlpha){
  pg.strokeWeight(strokeWeight_);
  
  switch(strokeColor){
    // BASIC COLORS
    case TRANSPARENT:
      pg.noStroke(); break;
    case BLACK:
      pg.stroke(0, strokeAlpha); break;
    case WHITE:
      pg.stroke(255, strokeAlpha); break;
    case RED:
      pg.stroke(255, 0, 0, strokeAlpha); break;
    case GREEN:
      pg.stroke(0, 255, 0, strokeAlpha); break;
    case BLUE:
      pg.stroke(0, 0, 255, strokeAlpha); break;
      
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
    case NEPHRITIS:
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

void setPG_fill(PGraphics pg, int fillColor, int fillAlpha){
  switch(fillColor){
    // BASIC COLORS
    case TRANSPARENT:
      pg.noFill(); break;
    case BLACK:
      pg.fill(0, fillAlpha); break;
    case WHITE:
      pg.fill(255, fillAlpha); break;
    case RED:
      pg.fill(255, 0, 0, fillAlpha); break;
    case GREEN:
      pg.fill(0, 255, 0, fillAlpha); break;
    case BLUE:
      pg.fill(0, 0, 255, fillAlpha); break;
      
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
    case NEPHRITIS:
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