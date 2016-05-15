class Button {
  
  int myId;
  
  float myX;
  float myY;
  float mySize;
  
  color myColor;
  color myDarkColor;
  
  boolean isLightOn = false;
  
  Button(int tempId, float tempX, float tempY, float tempSize, color tempColor) {
    myId = tempId;
    myX = tempX;
    myY = tempY;
    mySize = tempSize;
    myColor = tempColor;
    
    myDarkColor = lerpColor(0, myColor, 0.5);
  }
  
  void display() {
    
    if(isLightOn) {
      fill(myColor);
    }
    else {
      fill(myDarkColor);
    }
    
    rect(myX, myY, mySize, mySize);
  }
  
  boolean isMouseOver() {
  
    if(mouseX > myX && mouseX < (myX + mySize) && 
       mouseY > myY && mouseY < (myY + mySize)) {
        
       return true;
    } else {
      return false;
    }
    
  }
  
}