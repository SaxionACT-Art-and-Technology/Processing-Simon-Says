
Button [] buttons = new Button[4];

SimonToneGenerator simonTones;

int [] simonSentence = new int[32];
int positionInSentence = 0;

int timeOut = 0;

void setup() {
  size(600,600);
  
  buttons[0] = new Button(0,0,0,300,#00ff00);
  buttons[1] = new Button(1,300,0,300,#ff0000);
  buttons[2] = new Button(2,0,300,300,#ffff00);
  buttons[3] = new Button(3,300,300,300,#0000ff);
  
  simonTones = new SimonToneGenerator(this);
  
  for(int i = 0; i<simonSentence.length; i++) {
    simonSentence[i] = int(random(0,4));
  }
  
  //printArray(simonSentence);
  println(join(nf(simonSentence, 0), ", "));
  
}

void draw() {
  
  simonTones.checkPlayTime();
  
  if(simonTones.isPlayingTone == false) setButtonLightsOff();
  
  //simonSays();
  
  for(Button currentButton : buttons) {
    currentButton.display();
  }
  
  //if(mousePressed) {
  //  println("pressed!");
  //}
  
}

void simonSays() {
  if(millis() >= timeOut) {
  
    int simonsWord = simonSentence[positionInSentence];
    simonTones.playTone(simonsWord, 420);
    buttons[simonsWord].isLightOn = true;
    
    positionInSentence++;
    if(positionInSentence>=simonSentence.length) {
      positionInSentence = 0;    
    }
    
    //println(positionInSentence);
    
    timeOut = millis() + 420 + 55;
  }  
  
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