
Button [] buttons = new Button[4];

SimonToneGenerator simonTones;

void setup() {
  size(600,600);
  
  buttons[0] = new Button(0,0,0,300,#00ff00);
  buttons[1] = new Button(1,300,0,300,#ff0000);
  buttons[2] = new Button(2,0,300,300,#ffff00);
  buttons[3] = new Button(3,300,300,300,#0000ff);
  
  simonTones = new SimonToneGenerator(this);
  
}

void draw() {
  
  simonTones.checkPlayTime();
  
  if(simonTones.isPlayingTone == false) setButtonLightsOff();
  
  for(Button currentButton : buttons) {
    currentButton.display();
  }
  
  //if(mousePressed) {
  //  println("pressed!");
  //}
  
}

void mousePressed() {
    //println("pressed!");
    
    for(Button currentButton : buttons) {
      if(currentButton.isMouseOver() == true) {
        simonTones.playTone(currentButton.myId, 420);
        currentButton.isLightOn = true;
      }
    }
    
}

void mouseReleased() {
    //println("released!");
    
    simonTones.stopTone();
    setButtonLightsOff();
    
}

void setButtonLightsOff() {
  
  for(Button currentButton : buttons) {
    currentButton.isLightOn = false;
  }  
  
}