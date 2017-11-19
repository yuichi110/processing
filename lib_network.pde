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
TOPOLOGY 
*/

class NetworkTopology{
  
  class AssetObject{
    String name;
    NetworkAsset object;
    int x;
    int y;
    
    AssetObject(String name, NetworkAsset object, int x, int y){
      this.name = name;
      this.object = object;
      this.x = x;
      this.y = y;
    }
    
    PVector getPortCoordinate(int location, int n){
      PVector bodyPV = object.getBodyXY();
      PVector portPV = object.getPortCoordinate(location, n);
      int portX = int(x - bodyPV.x + portPV.x);
      int portY = int(y - bodyPV.y + portPV.y);
      return new PVector(portX, portY);
    }
  }
  
  class CableObject{
    int x1;
    int y1;
    int x2;
    int y2;
    
    CableObject(int x1, int y1, int x2, int y2){
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
    }
  }
  
  HashMap<String, AssetObject> assetMap;
  ArrayList<CableObject> cableList;
  int width_;
  int height_;
  
  NetworkTopology(int width_, int height_){
    this.width_ = width_;
    this.height_ = height_;
    assetMap = new HashMap<String, AssetObject>();
    cableList = new ArrayList<CableObject>();
  }
  
  void addAsset(String name, NetworkAsset asset, int x, int y){
    assetMap.put(name, new AssetObject(name, asset, x, y));
  }
  
  void connect(String name1, int position1, int n1, String name2, int position2, int n2){
    boolean hasKeys = assetMap.containsKey(name1) && assetMap.containsKey(name2);
    if(!hasKeys){
      return;
    }
    
    AssetObject asset1 = assetMap.get(name1);
    PVector pv1 = asset1.getPortCoordinate(position1, n1);
    AssetObject asset2 = assetMap.get(name2);
    PVector pv2 = asset2.getPortCoordinate(position2, n2);
    
    CableObject cable = new CableObject(int(pv1.x), int(pv1.y), int(pv2.x), int(pv2.y));
    cableList.add(cable);
  }
  
  PGraphics getPGraphics(){
    PGraphics pg = createGraphics(width_ , height_);
    pg.beginDraw();
    
    // Draw Cables
    for(int i=0; i<cableList.size(); i++){
      CableObject cable = cableList.get(i);
      pg.line(cable.x1, cable.y1, cable.x2, cable.y2);
    }
    
    // Draw Assets
    for(String name : assetMap.keySet()) {
      AssetObject assetObject = assetMap.get(name);
      NetworkAsset asset = assetObject.object;
      PGraphics assetPG = asset.getPGraphicsImage();
      PVector pv = asset.getBodyXY();
      pg.image(assetPG, assetObject.x - pv.x, assetObject.y - pv.y);
    }
    
    pg.endDraw();
    return pg;
  }
}

class NetworkAsset{
  int assetWidth;
  int assetHeight;
  int assetR;
  int assetStrokeColor;
  int assetStrokeWeight;
  int assetFillColor;
  int portSquareLength;
  int portStrokeColor;
  int portStrokeWeight;
  
  int[] left;
  int[] bottom;
  int[] right;
  int[] top;

  boolean is_drawText;
  String bodyText;
  int textColor;
  int textSize;
  int textX;
  int textY;
  boolean isTextVertical;

  boolean is_drawIcon;
  int icon;
  int iconSize;
  int iconColor;
  int iconX;
  int iconY;
  
  final static int ROUTER = 0;
  final static int L2SWITCH = 1;
  final static int L3SWITCH = 2;
  final static int PC = 3;
 
  final int PAD_X = 5;
  final int PAD_Y = 5;
  
  NetworkAsset(int assetWidth, int assetHeight, int assetR, int assetStrokeColor, int assetStrokeWeight, int assetFillColor, 
               int portSquareLength, int portStrokeColor, int portStrokeWeight,
               int[] left, int[] bottom, int[] right, int[] top){
    
    this.assetWidth = assetWidth;
    this.assetHeight = assetHeight;
    this.assetR = assetR;
    this.assetStrokeColor = assetStrokeColor;
    this.assetStrokeWeight = assetStrokeWeight;
    this.assetFillColor = assetFillColor;
    
    this.portSquareLength = portSquareLength;
    this.portStrokeColor = portStrokeColor;
    this.portStrokeWeight = portStrokeWeight;
    
    this.left = left;
    this.bottom = bottom;
    this.right = right;
    this.top = top;
    
    is_drawText = false;
    is_drawIcon = false;
  }
  
    NetworkAsset(int assetWidth, int assetHeight, int assetR, int assetStrokeColor, int assetStrokeWeight, int assetFillColor, 
               int portSquareLength, int portStrokeColor, int portStrokeWeight, int portFillColor,
               int left, int bottom, int right, int top){
    
    this.assetWidth = assetWidth;
    this.assetHeight = assetHeight;
    this.assetR = assetR;
    this.assetStrokeColor = assetStrokeColor;
    this.assetStrokeWeight = assetStrokeWeight;
    this.assetFillColor = assetFillColor;
    
    this.portSquareLength = portSquareLength;
    this.portStrokeColor = portStrokeColor;
    this.portStrokeWeight = portStrokeWeight;
    
    int[] leftA = new int[left];
    int[] bottomA = new int[bottom];
    int[] rightA = new int[right];
    int[] topA = new int[top];
    int[][] table = {leftA, bottomA, rightA, topA};
    for(int i=0; i<table.length; i++){
      for(int j=0; j<table[i].length; j++){
         table[i][j] = portFillColor; 
      }
    }
    this.left = leftA;
    this.bottom = bottomA;
    this.right = rightA;
    this.top = topA;
    
    is_drawText = false;
    is_drawIcon = false;
  }
  
  PVector getBodyXY(){
    int assetX = PAD_X;
    if(left.length != 0){
      assetX += portSquareLength/2;
    }
    int assetY = PAD_Y;
    if(top.length != 0){
      assetY += portSquareLength/2;
    }
    return new PVector(assetX, assetY);
  }
  
  void setPortColor(int position, int n, int portColor){
    switch(position){
      case LEFT:
        left[n-1] = portColor; break;
      case BOTTOM:
        bottom[n-1] = portColor; break;
      case RIGHT:
        right[n-1] = portColor; break;      
      case TOP:
        top[n-1] = portColor; break;
      default:
        println("ERROR at NetworkAsset setPortColor()");
    }
  }

  PVector getPortCoordinate(int position, int n){
    switch(position){
      case LEFT:
        return getLeftPortCoordinate(n);
      case BOTTOM:
        return getBottomPortCoordinate(n);
      case RIGHT:
        return getRightPortCoordinate(n);     
      case TOP:
        return getTopPortCoordinate(n);
      default:
        println("ERROR at NetworkAsset getPortCoordinate()");
    }
    
    return new PVector(0, 0);
  }
  
  PVector getLeftPortCoordinate(int n){
    int distance = (assetHeight - left.length * portSquareLength)/(left.length + 1);
    int x = PAD_X + portSquareLength/2;
    int y = PAD_Y + (distance * n) + (portSquareLength * (n-1)) + portSquareLength/2;
    if(top.length != 0){
      y += portSquareLength/2;
    }
    return new PVector(x, y); 
  }
  
  PVector getRightPortCoordinate(int n){
    int distance = (assetHeight - right.length * portSquareLength)/(right.length + 1);
    int x = PAD_X + assetWidth;
    if(left.length != 0){
      x += portSquareLength/2;
    }
    int y = PAD_Y + (distance * n) + (portSquareLength * (n-1)) + portSquareLength/2;
    if(top.length != 0){
      y += portSquareLength/2;
    }
    return new PVector(x, y); 
  }
  
  PVector getTopPortCoordinate(int n){
    int distance = (assetWidth - top.length * portSquareLength)/(top.length + 1);
    int x = PAD_X + (distance * n) + (portSquareLength * (n-1)) + portSquareLength/2;
    
    if(left.length != 0){
      x += portSquareLength/2;
    }
    int y = PAD_Y + portSquareLength/2;
    return new PVector(x, y); 
  }
  
  PVector getBottomPortCoordinate(int n){
    int distance = (assetWidth - bottom.length * portSquareLength)/(bottom.length + 1);
    int x = PAD_X + (distance * n) + (portSquareLength * (n-1)) + portSquareLength/2;
    
    if(left.length != 0){
      x += portSquareLength/2;
    }
    int y = PAD_Y + assetHeight;
    if(top.length != 0){
      y += portSquareLength/2;
    }   
    return new PVector(x, y); 
  }
  
  void setText(String bodyText, int textColor, int textSize, 
               int textX, int textY, boolean isTextVertical){
    this.bodyText = bodyText;
    this.textColor = textColor;
    this.textSize = textSize;
    this.textX = textX;
    this.textY = textY;
    this.isTextVertical = isTextVertical;
    is_drawText = true;
  }
  
  void removeText(){
    is_drawText = false; 
  }
  
  void setIcon(int icon, int iconColor, int iconSize, int iconX, int iconY){
    boolean isIconOK = false;
    int[] icons = {ROUTER, L2SWITCH, L3SWITCH, PC};
    for(int i=0; i<icons.length; i++){
        if(icon == icons[i]){
           isIconOK = true; 
        }
    }
    if(!isIconOK){
      return;
    }
    
    this.icon = icon;
    this.iconColor = iconColor;
    this.iconSize = iconSize;
    this.iconX = iconX;
    this.iconY = iconY;
    is_drawIcon = true;
  }
  
  void removeIcon(){
    is_drawIcon = false;
  }
  
  PGraphics getPGraphicsImage(){
    int w = PAD_X * 2 + assetWidth;
    if(left.length != 0){
      w += portSquareLength/2;
    }
    if(right.length != 0){
      w += portSquareLength/2;
    }
    
    int h = PAD_Y * 2 + assetHeight;
    if(bottom.length != 0){
      h += portSquareLength/2;
    }
    if(top.length != 0){
      h += portSquareLength/2;
    }    
    
    PGraphics pg = createGraphics(w , h);
    pg.beginDraw();
    
    // BODY
    int assetX = PAD_X;
    if(left.length != 0){
      assetX += portSquareLength/2;
    }
    int assetY = PAD_Y;
    if(top.length != 0){
      assetY += portSquareLength/2;
    }    
    setPG_stroke(pg, assetStrokeColor, assetStrokeWeight, 255);
    setPG_fill(pg, assetFillColor, 255);
    pg.rect(assetX, assetY, assetWidth, assetHeight, assetR);
    
    // PORTS
    setPG_stroke(pg, portStrokeColor, portStrokeWeight, 255);
    pg.rectMode(CENTER);
    
    for(int i=0; i<left.length; i++){
      PVector pv = getLeftPortCoordinate(i+1);
      setPG_fill(pg, left[i], 255);
      pg.rect(pv.x, pv.y, portSquareLength, portSquareLength);
    }
    
    for(int i=0; i<right.length; i++){
      PVector pv = getRightPortCoordinate(i+1);
      setPG_fill(pg, right[i], 255);
      pg.rect(pv.x, pv.y, portSquareLength, portSquareLength);
    }    

    for(int i=0; i<top.length; i++){
      PVector pv = getTopPortCoordinate(i+1);
      setPG_fill(pg, top[i], 255);
      pg.rect(pv.x, pv.y, portSquareLength, portSquareLength);
    } 

    for(int i=0; i<bottom.length; i++){
      PVector pv = getBottomPortCoordinate(i+1);
      setPG_fill(pg, bottom[i], 255);
      pg.rect(pv.x, pv.y, portSquareLength, portSquareLength);
    } 
    
    // ICON
    if(is_drawIcon){
      PVector pv = getBodyXY();
      int ix = iconX + int(pv.x);
      int iy = iconY + int(pv.y);
      switch(icon){
        case ROUTER:
          pg.image(getPG_routerIcon(iconSize, iconColor), ix, iy); break;
        case L2SWITCH:
          pg.image(getPG_l2SwitchIcon(iconSize, iconColor), ix, iy); break;
        case L3SWITCH:
          pg.image(getPG_l3SwitchIcon(iconSize, iconColor), ix, iy); break;
        case PC:
          pg.image(getPG_pcIcon(iconSize, iconColor), ix, iy); break;
        default:
          println("ERROR");
      }
    }
    
    // TEXT
    if(is_drawText){
      PVector pv = getBodyXY();
      if(!isTextVertical){
        drawPG_text(pg, textX + int(pv.x), textY + int(pv.y), bodyText, textSize, textColor, 255);
      }else{
        pg.pushMatrix();
        pg.translate(textX + int(pv.x), textY + int(pv.y));
        pg.rotate(radians(90));
        drawPG_text(pg, 0, 0, bodyText, textSize, textColor, 255);
        pg.popMatrix(); 
      }      
    }

    // ICON
    if(is_drawIcon){
      
    }
    
    pg.endDraw();
    return pg;
  }
  
}

PGraphics getPG_routerIcon(int iconSize, int iconColor){
  //DEBUG
  /*
  setPG_stroke(pg, iconColor, 2, 255);
  setPG_fill(pg, TRANSPARENT, 0);
  pg.rect(x, y, iconSize, iconSize);
  */
  
  PGraphics pg = createGraphics(iconSize , iconSize);
  pg.beginDraw();
  
  setPG_stroke(pg, TRANSPARENT, 0, 0);
  setPG_fill(pg, iconColor, 255);
  pg.pushMatrix();  
  pg.translate(iconSize/2, iconSize/2);
  
  float base = iconSize/15.0;
  float rw = ceil(base * 5) + 1;
  float rh = base * 2;
  
  // OUTSIDE ARROW
  float rx = base * 2;
  float ry = -base * 1;
  float tx1 = floor(base * 7);
  float ty1 = -base * 2;
  float tx2 = tx1;
  float ty2 = ty1 * -1;
  float tx3 = tx1 + base * 2;
  float ty3 = 0;
  int[] a = {135, 180};
  for(int i=0; i<a.length; i++){
    pg.rotate(radians(a[i]));
    pg.rect(rx, ry, rw, rh);
    pg.triangle(tx1, ty1, tx2, ty2, tx3, ty3);  
  }
  
  // INSIDE ARROW
  tx1 = base * 2;
  ty1 = 0;
  tx2 = tx1 + base * 2;
  ty2 = base * 2;
  tx3 = tx2;
  ty3 = -base * 2;
  rx = floor(base * 4) - 1;
  ry = -base * 1;
  int[] b = {90, 180};
  for(int i=0; i<a.length; i++){
    pg.rotate(radians(b[i]));
    pg.rect(rx, ry, rw, rh);
    pg.triangle(tx1, ty1, tx2, ty2, tx3, ty3);  
  }
  
  pg.popMatrix();  
  pg.endDraw();
  return pg;
}

PGraphics getPG_l2SwitchIcon(int iconSize, int iconColor){
  //DEBUG
  /*
  setPG_stroke(pg, iconColor, 2, 255);
  setPG_fill(pg, TRANSPARENT, 0);
  pg.rect(x, y, iconSize, iconSize);
  */
  
  PGraphics pg = createGraphics(iconSize , iconSize);
  pg.beginDraw();
  
  setPG_stroke(pg, TRANSPARENT, 0, 0);
  setPG_fill(pg, iconColor, 255);
  float base = iconSize/15.0;
  float rw = ceil(base * 5) + 1;
  float rh = base * 2;
  float r1x = floor(base * 2);
  float r1y = base * 5;
  float r2x = r1x;
  float r2y = base * 11;
  float r3x = ceil(base * 8);
  float r3y = base * 2;
  float r4x = r3x;
  float r4y = base * 8;
  pg.rect(r1x, r1y, rw, rh);
  pg.rect(r2x, r2y, rw, rh);
  pg.rect(r3x, r3y, rw, rh);
  pg.rect(r4x, r4y, rw, rh);
  
  float tw = ceil(base * 2);
  float th = base * 2;
  float t1x = ceil(base * 2);
  float t1y = base * 4;
  float t2x = t1x;
  float t2y = base * 10;
  float t3x = floor(base * 13);
  float t3y = base * 1;
  float t4x = t3x;
  float t4y = base * 7;
  pg.triangle(t1x, t1y, t1x - tw, t1y + th, t1x, t1y + 2 * th);
  pg.triangle(t2x, t2y, t2x - tw, t2y + th, t2x, t2y + 2 * th);
  pg.triangle(t3x, t3y, t3x + tw, t3y + th, t3x, t3y + 2 * th);
  pg.triangle(t4x, t4y, t4x + tw, t4y + th, t4x, t4y + 2 * th);
  
  pg.endDraw();
  return pg;
}

PGraphics getPG_l3SwitchIcon(int iconSize, int iconColor){
  //DEBUG
  /*
  setPG_stroke(pg, iconColor, 2, 255);
  setPG_fill(pg, TRANSPARENT, 0);
  pg.rect(x, y, iconSize, iconSize);
  */
  PGraphics pg = createGraphics(iconSize , iconSize);
  pg.beginDraw();
  
  setPG_stroke(pg, TRANSPARENT, 0, 0);
  setPG_fill(pg, iconColor, 255);
  pg.pushMatrix();  
  pg.translate(iconSize/2.0, iconSize/2.0);
  
  float base = iconSize/15.0;
  pg.ellipse(0, 0, base * 3, base * 3);
  
  float rw = ceil(base * 4) + 1;
  float rh = base * 2;
  
  // OUTSIDE ARROW
  float rx = base * 3;
  float ry = -base * 1;
  float tx1 = floor(base * 7);
  float ty1 = -base * 2;
  float tx2 = tx1;
  float ty2 = ty1 * -1;
  float tx3 = tx1 + base * 2;
  float ty3 = 0;
  int[] a = {45, 90, 90, 90};
  for(int i=0; i<a.length; i++){
    pg.rotate(radians(a[i]));
    pg.rect(rx, ry, rw, rh);
    pg.triangle(tx1, ty1, tx2, ty2, tx3, ty3);  
  }
  
  pg.popMatrix(); 
  
  pg.endDraw();
  return pg;
}

PGraphics getPG_pcIcon(int iconSize, int iconColor){
  //DEBUG
  /*
  setPG_stroke(pg, iconColor, 2, 255);
  setPG_fill(pg, TRANSPARENT, 0);
  pg.rect(x, y, iconSize, iconSize);
  */
  
  PGraphics pg = createGraphics(iconSize , iconSize);
  pg.beginDraw();
  
  float base = iconSize/15.0;
  
  // DISPLAY
  setPG_stroke(pg, iconColor, base, 255);
  setPG_fill(pg, TRANSPARENT, 0);
  pg.rect(base, base, base * 13, base * 10, 10);
  
  setPG_stroke(pg, TRANSPARENT, 0, 0);
  setPG_fill(pg, iconColor, 255);
  pg.rect(base, base * 9, base * 13, base * 2);
  
  pg.rect(base * 5, base * 10 + 1, base * 5, base * 3);
  pg.rect(base * 3, base * 13, base * 9, base * 1);
  
  pg.endDraw();
  return pg; 
}

void drawPG_firewallIcon(){
  
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