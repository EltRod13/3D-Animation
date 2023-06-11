void Intro(){
background(0);                                                               // Background Position
   fill(255);                                                                // Background Colour is black
   textSize(50);                                                             // Text size
   text("Press the Mouse Button to move the character", 115, 320, 600,500);  // Text to be displayed
   if(millis() > time_to_end_instructions){                                  // Condition to display instructions if true
     displayinstruction = false;
   }
}
