import processing.sound.*;

class SimonToneGenerator {

  // Green: G4, Red: E4, Yellow: C4, Blue: G3, Wrong: G1
  float [] simonTones = { 391.995, 329.628, 261.626, 195.998, 48.9994 };
  
  SqrOsc wave;

  int toneStopTime;
  
  boolean isPlayingTone = false;

  SimonToneGenerator(PApplet p) {
    wave = new SqrOsc(p);
    wave.play();
    wave.amp(0.0);
  }
  
  void playTone(int index, int toneDuration) {
    
    wave.amp(0.6);  
    wave.freq(simonTones[index]);
    
    toneStopTime = millis() + toneDuration;
    isPlayingTone = true;
  }
  
  void checkPlayTime() {
    
    if(isPlayingTone) {
      if(millis() >= toneStopTime) {
        stopTone();
      }
    }
  }
  
  void stopTone() {
    
    if(isPlayingTone) {
      wave.amp(0.0);
      isPlayingTone = false; 
    }
    
  }
  
}