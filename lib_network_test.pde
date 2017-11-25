
void network_test_settings(){
 size(1600, 900); 
}

void network_test_setup(){  
  frameRate(50);
}

void network_test_draw(PGraphics pgb){
  boolean m = false;
  if(m){
    
  }else{
    int f = frameCount % 400;
    int one_sec = 50;
    if(f > one_sec * 7){
      network_test_drawNetworkAsset3(pgb);
    }else if(f > one_sec * 6){
      network_test_drawNetworkAsset2(pgb);
    }else if(f > one_sec * 5){
      network_test_drawIcon(pgb);
    }else if(f > one_sec * 4){
      network_test_drawToplogy(pgb);
    }else if(f > one_sec * 3){
      network_test_drawNetworkAsset(pgb);
    }else if(f > one_sec * 2){
      network_test_drawBriefFormatsSmall(pgb);
    }else{
      network_test_drawBriefFormats(pgb);
    }   
  } 
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



void network_test_drawNetworkAsset(PGraphics pgb){ 
  {
    int[] left = {GREEN, GREEN, GREEN};
    int[] bottom = {GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {};
    NetworkAsset sw = new NetworkAsset(50, 100, 0, BLACK, 2, CONCRETE,
                                           10, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImage();
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 100 - pv.x, 50 - pv.y); 
  }

  {
    /*
    int[] left = {GREEN, GREEN, GREEN};
    int[] bottom = {GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {GREEN};
    NetworkAsset sw = new NetworkAsset(75, 150, 0, BLACK, 2, CONCRETE,
                                           15, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImageWithText("Switch1", WHITE, 18, 20, 20, true);
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 100 - pv.x, 250 - pv.y); 
    */
  }  
  
  {
    int[] left = {GREEN, GREEN, GREEN};
    int[] bottom = {GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {GREEN};
    NetworkAsset sw = new NetworkAsset(100, 200, 0, BLACK, 2, CONCRETE,
                                           25, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImage();
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 100 - pv.x, 500 - pv.y); 
  }  

  {
    int[] left = {GREEN, };
    int[] bottom = {GREEN, GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {GREEN, GREEN};
    NetworkAsset sw = new NetworkAsset(100, 50, 0, BLACK, 2, CONCRETE,
                                           10, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImage();
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 300 - pv.x, 50 - pv.y); 
  }

  {
    /*
    int[] left = {};
    int[] bottom = {GREEN, GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {GREEN, GREEN};
    NetworkAsset sw = new NetworkAsset(150, 75, 0, BLACK, 2, CONCRETE,
                                           15, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImageWithText("Switch1", WHITE, 18, 20, 20, false);
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 300 - pv.x, 250 - pv.y); 
    */
  }  
  
  {
    int[] left = {GREEN};
    int[] bottom = {GREEN, GREEN, GREEN};
    int[] right = {BLUE, GREEN};
    int[] top = {GREEN, GREEN};
    NetworkAsset sw = new NetworkAsset(200, 100, 0, BLACK, 2, CONCRETE,
                                           25, BLACK, 2, left, bottom, right, top);
    PGraphics pgsw = sw.getPGraphicsImage();
    PVector pv = sw.getBodyXY();
    pgb.image(pgsw, 300 - pv.x, 500 - pv.y); 
  }  
}

void network_test_drawToplogy(PGraphics pgb){
  NetworkTopology topology = new NetworkTopology(pgb.width, pgb.height);
  
  NetworkAsset sw1 = new NetworkAsset(100, 100, 10, BLACK, 2, CONCRETE,
                                           25, BLACK, 2, GREEN,
                                           0, 0, 1, 0);

  NetworkAsset sw2 = new NetworkAsset(100, 200, 10, BLACK, 2, CONCRETE,
                                           25, BLACK, 2, GREEN,
                                           2, 0, 0, 0);
  topology.addAsset("SW1", sw1, 100, 100);
  topology.addAssetText("SW1", "e0/1", 18, BLACK, 110, 30);
  
  topology.addAsset("SW2", sw2, 300, 200);
  topology.connect("SW1", RIGHT, 1, "SW2", LEFT, 2);
  topology.addAssetText("SW2", "e0/2", 18, BLACK, -50, 170);
  
  topology.addTopologyText("", 32, BLACK, 100, 50);
  
  pgb.image(topology.getPGraphics(), 0, 0);
}

void network_test_drawIcon(PGraphics pgb){
 
 PGraphics l2sw = getPG_l2SwitchIcon(100, BLACK);
 pgb.image(l2sw, 100, 100);

 PGraphics router = getPG_routerIcon(100, BLACK);
 pgb.image(router, 100, 300);
 
 PGraphics l3sw = getPG_l3SwitchIcon(100, BLACK);
 pgb.image(l3sw, 100, 500);
 
 PGraphics pc = getPG_pcIcon(100, BLACK);
 pgb.image(pc, 100, 700);
 

}

void network_test_drawNetworkAsset2(PGraphics pgb){

  NetworkAsset sw = new NetworkAsset(100, 100, 10, BLACK, 2, PETERRIVER,
                                           15, BLACK, 2, EMERALD,
                                           1, 0, 1, 0);
  sw.setIcon(NetworkAsset.L2SWITCH, WHITE, 80, 12, 12);
  PGraphics pgsw = sw.getPGraphicsImage();
  PVector pv = sw.getBodyXY();
  pgb.image(pgsw, 100 - pv.x, 50 - pv.y); 
    
  NetworkAsset router = new NetworkAsset(100, 100, 10, BLACK, 2, CARROT,
                                           15, BLACK, 2, EMERALD,
                                           2, 0, 0, 0);
  router.setIcon(NetworkAsset.ROUTER, WHITE, 80, 10, 10);
  PGraphics pgrouter = router.getPGraphicsImage();
  PVector pv2 = router.getBodyXY();
  pgb.image(pgrouter, 100 - pv2.x, 250 - pv2.y);  
  
  NetworkAsset l3sw = new NetworkAsset(100, 100, 10, BLACK, 2, CARROT,
                                           15, BLACK, 2, EMERALD,
                                           2, 0, 0, 0);
  l3sw.setIcon(NetworkAsset.L3SWITCH, WHITE, 80, 10, 10);
  PGraphics pgl3sw = l3sw.getPGraphicsImage();
  PVector pvL3sw = l3sw.getBodyXY();
  pgb.image(pgl3sw, 100 - pvL3sw.x, 450 - pvL3sw.y); 
  
  NetworkAsset pc = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST,
                                           15, BLACK, 2, EMERALD,
                                           0, 0, 1, 0);
  pc.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  PGraphics pgpc = pc.getPGraphicsImage();
  PVector pvpc = pc.getBodyXY();
  pgb.image(pgpc, 100 - pvpc.x, 650 - pvpc.y);  
}

void network_test_drawNetworkAsset3(PGraphics pgb){

  NetworkAsset sw = new NetworkAsset(150, 50, 10, BLACK, 2, PETERRIVER,
                                           15, BLACK, 2, EMERALD,
                                           0, 2, 0, 0);
  sw.setText("L2SW1", 40, 30, 24, WHITE, false);
  PGraphics pgsw = sw.getPGraphicsImage();
  PVector pv = sw.getBodyXY();
  pgb.image(pgsw, 100 - pv.x, 50 - pv.y); 
    
  NetworkAsset router = new NetworkAsset(50, 150, 10, BLACK, 2, CARROT,
                                           15, BLACK, 2, EMERALD,
                                           2, 0, 0, 0);
  router.setText("ROUTER1", 20, 20, 24, WHITE, true);
  PGraphics pgrouter = router.getPGraphicsImage();
  PVector pv2 = router.getBodyXY();
  pgb.image(pgrouter, 100 - pv2.x, 250 - pv2.y);
}