final boolean PROCESSING_IS_TEST = false;

final int PROCESSING_TEST_COMMON = 0;
final int PROCESSING_TEST_NETWORK = 1;
final int PROCESSING_TEST = PROCESSING_TEST_NETWORK;

void settings(){
  if(!PROCESSING_IS_TEST){
    network1_settings();
    
    
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_settings(); break;
      case PROCESSING_TEST_NETWORK:
        network_test_settings(); break;
      default:
        println("ERROR");
    }
  }  
}

void setup(){
  if(!PROCESSING_IS_TEST){
    network1_setup();
    
    
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_setup(); break;
      case PROCESSING_TEST_NETWORK:
        network_test_setup(); break;
      default:
        println("ERROR");
    }
  }
  
}

void draw(){
  if(!PROCESSING_IS_TEST){
    network1_draw();
    
    
  }else{
    switch(PROCESSING_TEST){
      case PROCESSING_TEST_COMMON:
        common_test_draw(); break;
      case PROCESSING_TEST_NETWORK:
        network_test_draw(); break;
      default:
        println("ERROR");
    }    
  }
}