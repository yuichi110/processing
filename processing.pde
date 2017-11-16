// These params are default
// Please update values at each setup functions.
boolean PROCESSING_SAVE = false;
boolean PROCESSING_GRID = false;

void settings(){
  // update here
  common_test_settings();
}

void setup(){
  // update here
  common_test_setup();
  String[] fontList = PFont.list();
  printArray(fontList);
}

void draw(){
  // update here
  common_test_draw();  
}