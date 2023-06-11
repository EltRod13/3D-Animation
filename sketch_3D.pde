///////////////////////////////////////////////////////////////////////////////////////////////////////
// Simple 3D animation of a person walking made using Processing                                      /
// The sketch uses five image files in the data folder:                                               /
//    Person.png is a sprite sheet of  9 linear stickman waling poses                                 /
//    background.png is the main background image                                                     / 
//    hillsback.png is the hill which appear at a distance                                            /
//    hills.png are the hills which appear closer to the person walking                               /    
//    trees.png are the scrolling trees covered in snow                                               /
// Background music used in this animation is Walking in the sky by Nico Staf                         /
// Music file playing during credits is Nostalgia by Blue.P                                           /
// Credit file titled credit.txt is included in the data folder                                       /
// intro is the introduction that plays at the start which asks the user to press the mouse button    /
// SceneOne is the scene with the scrolling background and the stickman walking                       /
// SceneTwo is the scene with the scrolling credits                                                   /
// The sketch animates the stickman walking while layers of the background scroll at different speeds /                        
///////////////////////////////////////////////////////////////////////////////////////////////////////

import processing.sound.*;                               // SoundFile is imported
PImage background, walkingtransp;                         
String [] credits;
SoundFile bgMusic;                                       // Background music for the main animation
SoundFile creditssong;                                   // Music played while the credits scroll

PImage[] person = new PImage[9];                         // Person walking sprite images
PImage[] bg = new PImage[4];                             // The four background images
int[] xpos = new int[4];                                 // x-y coordinates of each background image
int[] ypos = new int[4];                                 //
int[] rate = new int[4];                                 // Horizontal scrolling rate of each background plane
int counter = 0;                                         // Animation counter for walking sprite
boolean displayinstruction=true;                         // To display the instructions at the start
int time_to_end_instructions;                            // Time for the instruction screen

void setup(){
  size(800,800);
  frameRate(15);
  bg[0] = loadImage("background.png");                   // Load the four backgrounds
  bg[1] = loadImage("hillsback.png");
  bg[2] = loadImage("hills.png");
  bg[3] = loadImage("trees.png");
  credits = loadStrings("credit.txt");                   // Load credits
  ypos[0] = 0; rate[0] = 1;                              // Set y positions and scrolling rates
  ypos[1] = 10; rate[1] = 2;
  ypos[2] = 10; rate[2] = 5;
  ypos[3] = -40; rate[3] = 10;
  time_to_end_instructions = millis() + 10;              // To count the amount of time to end the instruction screen
  creditssong = new SoundFile(this,"Creditssong.mp3");   // Load credits music
  bgMusic = new SoundFile(this,"bg.mp3");                // Load background music
  PImage Person = loadImage("Person.png");               // Load the walking sprite sheet and extract the 9 poses
  for(int n = 0; n < 9; n++){
    person[n] = Person.get(n*Person.width/9, 0, Person.width/9, Person.height);
  }                                                      // Divides the walking sprite sheet to nine parts
}

void draw(){
  if(displayinstruction){                                // Condition that checks and confirms whether to display the instruction or not                      
    Intro();                                             // Intro is called
   return;
  } 
  if(mousePressed == true){                  
    SceneOne();                                          // If the mouse button is pressed, SceneOne is executed
    if(!bgMusic.isPlaying())
      bgMusic.play();                                    // If no music is playing, background music begins playing
  }
  else
    if(bgMusic.isPlaying())                              // If any music is playing, it will be paused
    bgMusic.pause();
  
  if(frameCount>600)                                     // SceneTwo plays after SceneOne
  SceneTwo(frameCount-600);
}
