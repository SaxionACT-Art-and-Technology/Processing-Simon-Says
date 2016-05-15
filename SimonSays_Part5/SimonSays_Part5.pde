
Button [] buttons = new Button[4];

SimonToneGenerator simonTones;

int [] simonSentence = new int[32];
int positionInSentence = 0;
int currentLengthOfTheSentence = 0;

int talkTime = 420;

int timeOut = 0;

boolean isSimonsTurn = true;

boolean isWrong = false;

void setup() {
  size(600,600);
  
  buttons[0] = new Button(0,0,0,300,#00ff00);
  buttons[1] = new Button(1,300,0,300,#ff0000);
  buttons[2] = new Button(2,0,300,300,#ffff00);
  buttons[3] = new Button(3,300,300,300,#0000ff);
  
  simonTones = new SimonToneGenerator(this);
  
  textSize(40);
  textAlign(CENTER, CENTER);
  
  simonStartsNewGame();
  
}

void draw() {
  
  simonTones.checkPlayTime();
  
  if(simonTones.isPlayingTone == false) setButtonLightsOff();
  
  if(isSimonsTurn) simonSays();
  
  for(Button currentButton : buttons) {
    currentButton.display();
  }
  
  fill(255);
  
  if(isSimonsTurn) {
     if(currentLengthOfTheSentence == 0) text("Simon Starts", width/2, height/2); 
     else                                text("Simons Turn", width/2, height/2); 
  }
  else {
     text("Your Turn", width/2, height/2);
  }
  
}

void simonSays() {
  
  if(millis() >= timeOut) {
  
    int simonsWord = simonSentence[positionInSentence];
    simonTones.playTone(simonsWord, talkTime);
    buttons[simonsWord].isLightOn = true;
    
    if(positionInSentence < currentLengthOfTheSentence) {
      positionInSentence++;
    }
    else {
      isSimonsTurn = false;
      positionInSentence = 0;
    }
    
    //if(positionInSentence>=simonSentence.length) {
    //  positionInSentence = 0;    
    //}
    
    //println(positionInSentence);
    
    timeOut = millis() + talkTime + 55;
  }  
  
}


void mousePressed() {
    
    if(isSimonsTurn == false) {
    
      for(Button currentButton : buttons) {
        if(currentButton.isMouseOver() == true) {
          
          currentButton.isLightOn = true;
          
          if(simonSentence[positionInSentence] != currentButton.myId) {
            simonTones.playTone(4, 420);
            isWrong = true;
          }
          else {
            simonTones.playTone(currentButton.myId, 420);
          }
        }
      }
    }
    
}

void mouseReleased() {
    //println("released!");
    
    if(isSimonsTurn == false) {
    
      simonTones.stopTone();
      setButtonLightsOff();
      
      if(isWrong) {
        simonStartsNewGame();
        isWrong = false;
      }
      else {
        
        if(positionInSentence < currentLengthOfTheSentence) {
          positionInSentence++; 
          //println(positionInSentence);
        }
        else {
          
          if(currentLengthOfTheSentence == simonSentence.length-1) {
             println("user wins!!!"); 
             simonStartsNewGame();
          }
          else {
          
            currentLengthOfTheSentence++;
            
            if(currentLengthOfTheSentence <6)        talkTime = 420;
            else if(currentLengthOfTheSentence < 14) talkTime = 320;
            else                                     talkTime = 220;
            
            positionInSentence = 0;
            
            timeOut = millis() + 1000;
            isSimonsTurn = true;
          }
        }
        
      }
      
    }
    
}

void setButtonLightsOff() {
  
  for(Button currentButton : buttons) {
    currentButton.isLightOn = false;
  }  
  
}

void simonStartsNewGame() {
  
  makeNewSentence();
  timeOut = millis() + 1000;
  isSimonsTurn = true;
  
}

void makeNewSentence() {
  for(int i = 0; i<simonSentence.length; i++) {
    simonSentence[i] = int(random(0,4));
  }
  
  positionInSentence = 0;
  currentLengthOfTheSentence = 0;
  
  //printArray(simonSentence);
  println(join(nf(simonSentence, 0), ", "));  
}