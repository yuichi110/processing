/*
SETUP
*/


/*
 brief format
*/

final int LIB_NETWORK_BF_ETH_WIDTH = 50;
final int LIB_NETWORK_BF_ETH_X = 7;
final int LIB_NETWORK_BF_IP_WIDTH = 50;
final int LIB_NETWORK_BF_IP_X = 15;
final int LIB_NETWORK_BF_TCPUDP_WIDTH = 75;
final int LIB_NETWORK_BF_TCPUDP_X = 15;
final int LIB_NETWORK_BF_DATA_WIDTH = 100;
final int LIB_NETWORK_BF_DATA_X = 25;
final int LIB_NETWORK_BF_HEIGHT = 50;
final int LIB_NETWORK_BF_Y = 34;
final int LIB_NETWORK_BF_TEXT_SIZE = 24;

// L2

PGraphics getPG_network_bfEth(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_ETH_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcEth, fcData};
    String[] texts = {"Eth", "Data"};
    int[] textXs = {LIB_NETWORK_BF_ETH_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcEth, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_ETH_WIDTH};
    int[] fillColors = {fcData, fcEth};
    String[] texts = {"Data", "Eth"};
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_ETH_X};
    int[] textColors = {tcData, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfEthIp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcIp, int tcIp, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_ETH_WIDTH, LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcEth, fcIp, fcData};
    String[] texts = {"Eth", "IP", "Data"};
    int[] textXs = {LIB_NETWORK_BF_ETH_X, LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcEth, tcIp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_ETH_WIDTH};
    int[] fillColors = {fcData, fcIp, fcEth};
    String[] texts = {"Data", "IP", "Eth"};
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_ETH_X};
    int[] textColors = {tcData, tcIp, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfEthIpTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcIp, int tcIp, int fcTcp, int tcTcp, int fcData, int tcData, 
                               boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_ETH_WIDTH, LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_TCPUDP_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcEth, fcIp, fcTcp, fcData};
    String[] texts = {"Eth", "IP", "TCP", "Data"};
    if(isUDP){
      texts[2] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_ETH_X, LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_TCPUDP_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcEth, tcIp, tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_TCPUDP_WIDTH, LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_ETH_WIDTH};
    int[] fillColors = {fcData, fcTcp, fcIp, fcEth};
    String[] texts = {"Data", "TCP", "IP", "Eth"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_TCPUDP_X, LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_ETH_X};
    int[] textColors = {tcData, tcTcp, tcIp, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfIp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcIp, int tcIp, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcIp, fcData};
    String[] texts = {"IP", "Data"};
    int[] textXs = {LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcIp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_IP_WIDTH};
    int[] fillColors = {fcData, fcIp};
    String[] texts = {"Data", "IP"};
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_IP_X, };
    int[] textColors = {tcData, tcIp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfIpTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                                int fcIp, int tcIp, int fcTcp, int tcTcp, int fcData, int tcData, 
                                boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_IP_WIDTH, LIB_NETWORK_BF_TCPUDP_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcIp, fcTcp, fcData};
    String[] texts = {"IP", "TCP", "Data"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_IP_X, LIB_NETWORK_BF_TCPUDP_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcIp, tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_TCPUDP_WIDTH, LIB_NETWORK_BF_IP_WIDTH};
    int[] fillColors = {fcData, fcTcp, fcIp};
    String[] texts = {"Data", "TCP", "IP"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_TCPUDP_X, LIB_NETWORK_BF_IP_X};
    int[] textColors = {tcData, tcTcp, tcIp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                                int fcTcp, int tcTcp, int fcData, int tcData, 
                                boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BF_TCPUDP_WIDTH, LIB_NETWORK_BF_DATA_WIDTH};
    int[] fillColors = {fcTcp, fcData};
    String[] texts = {"TCP", "Data"};
    if(isUDP){
      texts[0] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_TCPUDP_X, LIB_NETWORK_BF_DATA_X};
    int[] textColors = {tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BF_DATA_WIDTH, LIB_NETWORK_BF_TCPUDP_WIDTH};
    int[] fillColors = {fcData, fcTcp};
    String[] texts = {"Data", "TCP"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BF_DATA_X, LIB_NETWORK_BF_TCPUDP_X, };
    int[] textColors = {tcData, tcTcp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);    
  }
}

PGraphics getPG_network_bfData(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcData, int tcData){
  
  int[] widths = {LIB_NETWORK_BF_DATA_WIDTH};
  int[] fillColors = {fcData};
  String[] texts = {"Data"};
  int[] textXs = {LIB_NETWORK_BF_DATA_X};
  int[] textColors = {tcData};
  
  return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                         widths, LIB_NETWORK_BF_HEIGHT, fillColors, 
                         texts, LIB_NETWORK_BF_TEXT_SIZE, textXs, LIB_NETWORK_BF_Y, textColors);  
}


/*
 brief format
*/

final int LIB_NETWORK_BFS_ETH_WIDTH = 40;
final int LIB_NETWORK_BFS_ETH_X = 5;
final int LIB_NETWORK_BFS_IP_WIDTH = 30;
final int LIB_NETWORK_BFS_IP_X = 7;
final int LIB_NETWORK_BFS_TCPUDP_WIDTH = 45;
final int LIB_NETWORK_BFS_TCPUDP_X = 5;
final int LIB_NETWORK_BFS_DATA_WIDTH = 60;
final int LIB_NETWORK_BFS_DATA_X = 10;
final int LIB_NETWORK_BFS_HEIGHT = 25;
final int LIB_NETWORK_BFS_Y = 19;
final int LIB_NETWORK_BFS_TEXT_SIZE = 18;

PGraphics getPG_network_bfsEth(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_ETH_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcEth, fcData};
    String[] texts = {"Eth", "Data"};
    int[] textXs = {LIB_NETWORK_BFS_ETH_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcEth, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_ETH_WIDTH};
    int[] fillColors = {fcData, fcEth};
    String[] texts = {"Data", "Eth"};
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_ETH_X};
    int[] textColors = {tcData, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsEthIp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcIp, int tcIp, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_ETH_WIDTH, LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcEth, fcIp, fcData};
    String[] texts = {"Eth", "IP", "Data"};
    int[] textXs = {LIB_NETWORK_BFS_ETH_X, LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcEth, tcIp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_ETH_WIDTH};
    int[] fillColors = {fcData, fcIp, fcEth};
    String[] texts = {"Data", "IP", "Eth"};
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_ETH_X};
    int[] textColors = {tcData, tcIp, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsEthIpTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcEth, int tcEth, int fcIp, int tcIp, int fcTcp, int tcTcp, int fcData, int tcData, 
                               boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_ETH_WIDTH, LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_TCPUDP_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcEth, fcIp, fcTcp, fcData};
    String[] texts = {"Eth", "IP", "TCP", "Data"};
    if(isUDP){
      texts[2] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_ETH_X, LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_TCPUDP_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcEth, tcIp, tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_TCPUDP_WIDTH, LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_ETH_WIDTH};
    int[] fillColors = {fcData, fcTcp, fcIp, fcEth};
    String[] texts = {"Data", "TCP", "IP", "Eth"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_TCPUDP_X, LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_ETH_X};
    int[] textColors = {tcData, tcTcp, tcIp, tcEth};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsIp(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcIp, int tcIp, int fcData, int tcData, 
                               boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcIp, fcData};
    String[] texts = {"IP", "Data"};
    int[] textXs = {LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcIp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_IP_WIDTH};
    int[] fillColors = {fcData, fcIp};
    String[] texts = {"Data", "IP"};
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_IP_X, };
    int[] textColors = {tcData, tcIp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsIpTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                                int fcIp, int tcIp, int fcTcp, int tcTcp, int fcData, int tcData, 
                                boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_IP_WIDTH, LIB_NETWORK_BFS_TCPUDP_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcIp, fcTcp, fcData};
    String[] texts = {"IP", "TCP", "Data"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_IP_X, LIB_NETWORK_BFS_TCPUDP_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcIp, tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_TCPUDP_WIDTH, LIB_NETWORK_BFS_IP_WIDTH};
    int[] fillColors = {fcData, fcTcp, fcIp};
    String[] texts = {"Data", "TCP", "IP"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_TCPUDP_X, LIB_NETWORK_BFS_IP_X};
    int[] textColors = {tcData, tcTcp, tcIp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsTcp(int strokeColor, float strokeWeight_, int strokeAlpha,
                                int fcTcp, int tcTcp, int fcData, int tcData, 
                                boolean isUDP, boolean isReverse){
  
  if(isReverse){
    int[] widths = {LIB_NETWORK_BFS_TCPUDP_WIDTH, LIB_NETWORK_BFS_DATA_WIDTH};
    int[] fillColors = {fcTcp, fcData};
    String[] texts = {"TCP", "Data"};
    if(isUDP){
      texts[0] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_TCPUDP_X, LIB_NETWORK_BFS_DATA_X};
    int[] textColors = {tcTcp, tcData};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
                           
  }else{
    int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH, LIB_NETWORK_BFS_TCPUDP_WIDTH};
    int[] fillColors = {fcData, fcTcp};
    String[] texts = {"Data", "TCP"};
    if(isUDP){
      texts[1] = "UDP";
    }
    int[] textXs = {LIB_NETWORK_BFS_DATA_X, LIB_NETWORK_BFS_TCPUDP_X, };
    int[] textColors = {tcData, tcTcp};
    
    return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                           widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                           texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);    
  }
}

PGraphics getPG_network_bfsData(int strokeColor, float strokeWeight_, int strokeAlpha,
                               int fcData, int tcData){
  
  int[] widths = {LIB_NETWORK_BFS_DATA_WIDTH};
  int[] fillColors = {fcData};
  String[] texts = {"Data"};
  int[] textXs = {LIB_NETWORK_BFS_DATA_X};
  int[] textColors = {tcData};
  
  return getPG_horizontalRects(strokeColor, strokeWeight_, strokeAlpha, 
                         widths, LIB_NETWORK_BFS_HEIGHT, fillColors, 
                         texts, LIB_NETWORK_BFS_TEXT_SIZE, textXs, LIB_NETWORK_BFS_Y, textColors);  
}

/*
 Forcus format
*/

/*
void drawEthDetail(int x, int y, String colorEth, String colorData, String dstMac, String srcMac, boolean isReverse){
  if(isReverse){
    drawRectText(x , y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35); 
    drawRectText(x + 50, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRect(x + 100, y, 300, 50, 0, "black", 2, 255, colorEth, 255);
    
    drawText(x + 150, y + 20, "src mac", 16, "black", 255);
    drawText(x + 300, y + 20, "dst mac", 16, "black", 255);
    drawText(x + 110, y + 45, srcMac, 16, "black", 255);
    drawText(x + 260, y + 45, dstMac, 16, "black", 255);
    
  }
}

void drawEthDetailDot1Q(){
  
}

void drawEthIpDetail(){
  
}

void drawEthIpDetailDot1Q(){
  
}

void drawIpDetail(){
  
}

*/

/*
UTILITY
*/