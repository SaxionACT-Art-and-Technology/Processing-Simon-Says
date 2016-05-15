/*

    4 colored buttons
      each button has a light
      each button has a unique sound. 
      
    Simon talks by playing a note and lights up a button.
    
    User talks back by pressing the button (light/sound). 
    
    Simon can check if the user gives the right answer. 
    
      if(yes) he goes on...
      if(no) he stops by playing a wrong note/light and restarts again

      The user can win...
    
    ====
    Interface
    
    Green – G4 391.995 Hz
    Red – E4 329.628 Hz
    Yellow – C4 261.626 Hz
    Blue – G3 195.998 Hz
    
    Wrong - G1 48.9994 Hz
    
    Sequence length: 1-5, tone duration 0.42 seconds, pause between tones 0.05 seconds
    Sequence length: 6-13, tone duration 0.32 seconds, pause between tones 0.05 seconds
    Sequence length: 14-31, tone duration 0.22 seconds, pause between tones 0.05 seconds
    
*/