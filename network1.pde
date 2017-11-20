PGraphics network1_background;
PGraphics network1_packet;

void network1_settings(){
 common_guidegrid_enabled = false;
 size(1800, 1000); 
}

void network1_setup(){
  frameRate(50);
  makeBackground();
  makePacket();
}

void network1_draw(){
  background(255);
  
  PGraphics pgb = createGraphics(width, height);
  pgb.beginDraw();
  pgb.image(network1_background, 0, 0);
  
  int f = frameCount % 300;
  boolean debug = false;
  int x1 = 125;
  int y1 = 150;
  int x2 = 350;
  int y2 = 250;
  int x3 = 600;
  int y3 = 400;
  int x4 = 850;
  int y4 = 225;
  int x5 = 1100;
  int y5 = 225;
  
  movePG(pgb, network1_packet, x1, y1, 0, x2, y2, 0, f, 50, 100, debug);
  movePG(pgb, network1_packet, x2, y2, 0, x3, y3, 0, f, 100, 150, debug);
  movePG(pgb, network1_packet, x3, y3, 0, x4, y4, 0, f, 150, 200, debug);
  movePG(pgb, network1_packet, x4, y4, 0, x5, y5, 0, f, 200, 250, debug);
  
  drawPG_grid(pgb, CONCRETE, 1, 2, 255, 50, 250, 50, 250); 
  pgb.endDraw();
  image(pgb, 0, 0);
}

void makePacket(){
  network1_packet = getPG_network_bfEthIp(BLACK, 2, 255, CONCRETE, BLACK, CONCRETE, BLACK, CONCRETE, BLACK, false);
}

void makeBackground(){
  // PC
  NetworkAsset pc1 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 0, 0, 1, 0);
  pc1.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  NetworkAsset pc2 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 0, 0, 1, 0);
  pc2.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  NetworkAsset pc3 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 0, 0, 1, 0);
  pc3.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  NetworkAsset pc4 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 0, 0, 1, 0);
  pc4.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  NetworkAsset pc5 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 1, 0, 0, 0);
  pc5.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  NetworkAsset pc6 = new NetworkAsset(100, 100, 10, BLACK, 2, AMETHYST, 15, BLACK, 2, EMERALD, 1, 0, 0, 0);
  pc6.setIcon(NetworkAsset.PC, WHITE, 80, 12, 15);
  
  // L2SW
  NetworkAsset l2sw1 = new NetworkAsset(100, 100, 10, BLACK, 2, PETERRIVER, 15, BLACK, 2, EMERALD, 2, 0, 1, 0);
  l2sw1.setIcon(NetworkAsset.L2SWITCH, WHITE, 80, 12, 12);
  NetworkAsset l2sw2 = new NetworkAsset(100, 100, 10, BLACK, 2, PETERRIVER, 15, BLACK, 2, EMERALD, 2, 0, 1, 0);
  l2sw2.setIcon(NetworkAsset.L2SWITCH, WHITE, 80, 12, 12);
  
  // L3SW
  NetworkAsset l3sw1 = new NetworkAsset(100, 100, 10, BLACK, 2, CARROT, 15, BLACK, 2, EMERALD, 2, 0, 2, 0);
  l3sw1.setIcon(NetworkAsset.L3SWITCH, WHITE, 80, 10, 10);
  NetworkAsset l3sw2 = new NetworkAsset(100, 100, 10, BLACK, 2, CARROT, 15, BLACK, 2, EMERALD, 1, 0, 1, 0);
  l3sw2.setIcon(NetworkAsset.L3SWITCH, WHITE, 80, 10, 10);  
  
  // Router
  NetworkAsset router1 = new NetworkAsset(100, 100, 10, BLACK, 2, CARROT, 15, BLACK, 2, EMERALD, 1, 0, 1, 0);
  router1.setIcon(NetworkAsset.ROUTER, WHITE, 80, 10, 10);
  
  NetworkTopology topology = new NetworkTopology(width, height);
  int x1 = 100;
  topology.addAsset("PC1", pc1, x1, 100);
  topology.addAssetText("PC1", "PC1", 24, BLACK, 30, 130);
  topology.addAsset("PC2", pc2, x1, 300);
  topology.addAssetText("PC2", "PC2", 24, BLACK, 30, 130);
  topology.addAsset("PC3", pc3, x1, 500);
  topology.addAssetText("PC3", "PC3", 24, BLACK, 30, 130);
  topology.addAsset("PC4", pc4, x1, 700);
  topology.addAssetText("PC4", "PC4", 24, BLACK, 30, 130);
  
  int x2 = 350;
  topology.addAsset("L2SW1", l2sw1, x2, 200);
  topology.addAssetText("L2SW1", "L2 Switch1", 24, BLACK, -10, 130);
  topology.connect("L2SW1", LEFT, 1, "PC1", RIGHT, 1);
  topology.connect("L2SW1", LEFT, 2, "PC2", RIGHT, 1);
  
  topology.addAsset("L2SW2", l2sw2, x2, 600);
  topology.addAssetText("L2SW2", "L2 Switch2",  24, BLACK, -10, 130);
  topology.connect("L2SW2", LEFT, 1, "PC3", RIGHT, 1);
  topology.connect("L2SW2", LEFT, 2, "PC4", RIGHT, 1);
  
  int x3 = 600;
  topology.addAsset("L3SW1", l3sw1, x3, 400);
  topology.addAssetText("L3SW1", "L3 Switch1",  24, BLACK, -10, 130);
  topology.connect("L3SW1", LEFT, 1, "L2SW1", RIGHT, 1);
  topology.connect("L3SW1", LEFT, 2, "L2SW2", RIGHT, 1);
  
  int x4 = 850;
  topology.addAsset("RT1", router1, x4, 200);
  topology.addAssetText("RT1", "Router1", 24, BLACK, 10, 130);
  topology.connect("RT1", LEFT, 1, "L3SW1", RIGHT, 1);
  
  topology.addAsset("L3SW2", l3sw2, x4, 600);
  topology.addAssetText("L3SW2", "L3 Switch2",  24, BLACK, -10, 130);
  topology.connect("L3SW2", LEFT, 1, "L3SW1", RIGHT, 2);
  
  int x5 = 1100;
  topology.addAsset("PC5", pc5, x5, 200);
  topology.addAssetText("PC5", "PC5", 24, BLACK, 30, 130);
  topology.connect("PC5", LEFT, 1, "RT1", RIGHT, 1);
  topology.addAsset("PC6", pc6, x5, 600);
  topology.addAssetText("PC6", "PC6", 24, BLACK, 30, 130);
  topology.connect("PC6", LEFT, 1, "L3SW2", RIGHT, 1);
  
  network1_background = topology.getPGraphics();
}