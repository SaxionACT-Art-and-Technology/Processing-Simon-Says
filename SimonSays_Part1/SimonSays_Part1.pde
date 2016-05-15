
Button [] buttons = new Button[4];

void setup() {
  size(600,600);
  
  buttons[0] = new Button(0,0,300,#00ff00);
  buttons[1] = new Button(300,0,300,#ff0000);
  buttons[2] = new Button(0,300,300,#ffff00);
  buttons[3] = new Button(300,300,300,#0000ff);
  
}


void draw() {
  
  for(Button currentButton : buttons) {
    currentButton.display();
  }
  
  //if(mousePressed) {
  //  println("pressed!");
  //}
  
}

void mousePressed() {
    println("pressed!");
    
    for(Button currentButton : buttons) {
      if(currentButton.isMouseOver() == true) {
        currentButton.isLightOn = true;
      }
    }
    
}

void mouseReleased() {
    println("released!");
    
    for(Button currentButton : buttons) {
        currentButton.isLightOn = false;
    }
}