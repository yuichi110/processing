/*
SETUP
*/

void network_setup(){
  // load network icons
  
}

/*
 brief format
*/


// L2

void drawEth(int x, int y, String colorEth, String colorData, boolean isReverse){
  if(isReverse){
    drawRectText(x , y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35); 
    drawRectText(x + 50, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRectText(x + 100, y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35);     
  }
}

void drawEthIp(int x, int y, String colorEth, String colorIp, String colorData, boolean isReverse){
  if(isReverse){
    drawRectText(x, y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35); 
    drawRectText(x + 50, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35); 
    drawRectText(x + 100, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRectText(x + 100, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35);  
    drawRectText(x + 150, y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35); 
  }
}

void drawEthIpTransport(int x, int y, String colorEth, String colorIp,
                        String colorTransport, String colorData, boolean isUdp, boolean isReverse){
  String transport = "TCP";
  if(isUdp){
    transport = "UDP";
  }
  
  if(isReverse){
    drawRectText(x, y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35); 
    drawRectText(x + 50, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35);    
    drawRectText(x + 100, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
    drawRectText(x + 175, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRectText(x + 100, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
    drawRectText(x + 175, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35);  
    drawRectText(x + 225, y, 50, 50, 0, "black", 2, 255, colorEth, 255, "Eth", 24, "black", 255, 7, 35);     
  }
}

// L3

void drawIp(int x, int y, String colorIp, String colorData, boolean isReverse){
  if(isReverse){
    drawRectText(x, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 10, 35);  
    drawRectText(x + 50, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 20, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 20, 35);
    drawRectText(x + 100, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 10, 35);      
  }

}

void drawIpTransport(int x, int y, String colorIp, String colorTransport, String colorData, boolean isUdp, boolean isReverse){
  String transport = "TCP";
  if(isUdp){
    transport = "UDP";
  }
  
  if(isReverse){
    drawRectText(x, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35);    
    drawRectText(x + 50, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
    drawRectText(x + 125, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRectText(x + 100, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
    drawRectText(x + 175, y, 50, 50, 0, "black", 2, 255, colorIp, 255, "IP", 24, "black", 255, 15, 35);    
  }
}

// L4

void drawTransport(int x, int y, String colorTransport, String colorData, boolean isUdp, boolean isReverse){
  String transport = "TCP";
  if(isUdp){
    transport = "UDP";
  }
  
  if(isReverse){  
    drawRectText(x, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
    drawRectText(x + 75, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
  }else{
    drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 23, 35);
    drawRectText(x + 100, y, 75, 50, 0, "black", 2, 255, colorTransport, 255, transport, 24, "black", 255, 15, 35);
  }
}

// L7

void drawData(int x, int y, String colorData){
  drawRectText(x, y, 100, 50, 0, "black", 2, 255, colorData, 255, "Data", 24, "black", 255, 20, 35);
}


/*
 Forcus format
*/

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