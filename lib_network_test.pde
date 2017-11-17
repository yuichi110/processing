
void network_test_settings(){
 size(1200, 900); 
}

void network_test_setup(){
  // global
  common_guidegrid_enabled = false;
  common_save_enabled = false;
  common_save_mode = SAVE_MODE_TRANSPARENT ;
  
  frameRate(50);
}

void network_test_draw(){
  background(255); 
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  pgb.fill(255, 100);
  
  //TEST
  network_test_drawBriefFormatsSmall(pgb);
  
  drawGrid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
  pgb.endDraw();
  image(pgb, 0, 0);  
  if(frameCount <= 200){
    String fileName = String.format("%04d", frameCount) + ".png";
    saveCurrentFrame(pgb, fileName);
  }
}

void network_test_drawSerialBox(PGraphics pgb){
  int[] widths = {100, 75, 50, 50};
  int[] fillColors = {CONCRETE, CONCRETE, CONCRETE, CONCRETE};
  String[] texts = {"AA", "BB", "CC", "DD"};
  int[] textXs = {10, 10, 10, 10};
  int[] textColors = {WHITE, WHITE, WHITE, WHITE};
  PGraphics pgSerialBox = getPG_serialBox(BLACK, 1.5, 255, 
                                          widths, 25, fillColors, 
                                          texts, 18, textXs, 20, textColors);

  pgb.image(pgSerialBox, 100, 100);
}

void network_test_drawBriefFormats(PGraphics pgb){
  // L2
  PGraphics pgEth = getPG_network_bfEth(BLACK, 2, 255, CONCRETE, WHITE, CONCRETE, BLACK, false);
  PGraphics pgEthR = getPG_network_bfEth(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgEthIp = getPG_network_bfEthIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false);
  PGraphics pgEthIpR = getPG_network_bfEthIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgEthIpTcp = getPG_network_bfEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgEthIpTcpR = getPG_network_bfEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgEthIpUdp = getPG_network_bfEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgEthIpUdpR = getPG_network_bfEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgEth, 100, 50);
  pgb.image(pgEthR, 100, 150);
  pgb.image(pgEthIp, 100, 250);
  pgb.image(pgEthIpR, 100, 350);
  pgb.image(pgEthIpTcp, 100, 450);
  pgb.image(pgEthIpTcpR, 100, 550);
  pgb.image(pgEthIpUdp, 100, 650);
  pgb.image(pgEthIpUdpR, 100, 750);
  
  PGraphics pgIp = getPG_network_bfIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, false);
  PGraphics pgIpR = getPG_network_bfIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgIpTcp = getPG_network_bfIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgIpTcpR = getPG_network_bfIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgIpUdp = getPG_network_bfIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgIpUdpR = getPG_network_bfIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgIp, 400, 250);
  pgb.image(pgIpR, 400, 350);
  pgb.image(pgIpTcp, 400, 450);
  pgb.image(pgIpTcpR, 400, 550);
  pgb.image(pgIpUdp, 400, 650);
  pgb.image(pgIpUdpR, 400, 750);
  
  PGraphics pgTcp = getPG_network_bfTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgTcpR = getPG_network_bfTcp(BLACK, 2, 255,  CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgUdp = getPG_network_bfTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgUdpR = getPG_network_bfTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgTcp, 700, 450);
  pgb.image(pgTcpR, 700, 550);
  pgb.image(pgUdp, 700, 650);
  pgb.image(pgUdpR, 700, 750);
  
  PGraphics pgData = getPG_network_bfData(BLACK, 2, 255, CONCRETE, BLACK);
  pgb.image(pgData, 900, 750);
}

void network_test_drawBriefFormatsSmall(PGraphics pgb){
  // L2
  PGraphics pgEth = getPG_network_bfsEth(BLACK, 2, 255, CONCRETE, WHITE, CONCRETE, BLACK, false);
  PGraphics pgEthR = getPG_network_bfsEth(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgEthIp = getPG_network_bfsEthIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false);
  PGraphics pgEthIpR = getPG_network_bfsEthIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgEthIpTcp = getPG_network_bfsEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgEthIpTcpR = getPG_network_bfsEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgEthIpUdp = getPG_network_bfsEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgEthIpUdpR = getPG_network_bfsEthIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgEth, 100, 50);
  pgb.image(pgEthR, 100, 150);
  pgb.image(pgEthIp, 100, 250);
  pgb.image(pgEthIpR, 100, 350);
  pgb.image(pgEthIpTcp, 100, 450);
  pgb.image(pgEthIpTcpR, 100, 550);
  pgb.image(pgEthIpUdp, 100, 650);
  pgb.image(pgEthIpUdpR, 100, 750);
  
  PGraphics pgIp = getPG_network_bfsIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, false);
  PGraphics pgIpR = getPG_network_bfsIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true);
  PGraphics pgIpTcp = getPG_network_bfsIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgIpTcpR = getPG_network_bfsIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgIpUdp = getPG_network_bfsIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgIpUdpR = getPG_network_bfsIpTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgIp, 400, 250);
  pgb.image(pgIpR, 400, 350);
  pgb.image(pgIpTcp, 400, 450);
  pgb.image(pgIpTcpR, 400, 550);
  pgb.image(pgIpUdp, 400, 650);
  pgb.image(pgIpUdpR, 400, 750);
  
  PGraphics pgTcp = getPG_network_bfsTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, false, false);
  PGraphics pgTcpR = getPG_network_bfsTcp(BLACK, 2, 255,  CONCRETE, BLACK, CONCRETE, BLACK, false, true); 
  PGraphics pgUdp = getPG_network_bfsTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true, false);
  PGraphics pgUdpR = getPG_network_bfsTcp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, true, true);
  
  pgb.image(pgTcp, 700, 450);
  pgb.image(pgTcpR, 700, 550);
  pgb.image(pgUdp, 700, 650);
  pgb.image(pgUdpR, 700, 750);
  
  PGraphics pgData = getPG_network_bfsData(BLACK, 2, 255, CONCRETE, BLACK);
  pgb.image(pgData, 900, 750);
}