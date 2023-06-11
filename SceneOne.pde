void SceneOne(){
  for(int n = 0; n < 4; n++){
    image(bg[n], -xpos[n], ypos[n]);              // Draw the four background images
    image(bg[n], bg[n].width-xpos[n], ypos[n]);   // With wrap-around.
    xpos[n] = (xpos[n] + rate[n]) % bg[n].width;  // Each plane scrolls at its own rate
  }
  image(person[counter], 0, -40);                 // Draw animated walking person sprite
  counter = (counter + 1) % 9;
}
