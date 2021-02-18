//  SEE:   https://ello.co/ericfickes/post/9a2oeuuqburwws1ubt8p6g
//  GOTO:  https://github.com/ericfickes/FIXLIB
import fixlib.*;

Fixlib fix = Fixlib.init(this);



Boolean isFinal = true;
int alf = 360;
float sz=0;

int cX;
int cY;

ArrayList p3;
PImage img;

float xoff, x, y;
float n,i = 0;


void settings(){
  size(displayWidth, displayHeight, FX2D);
  smooth(8);  //  smooth() can only be used in settings();
  pixelDensity(displayDensity());
}

/////////////////////////////////////////////////////////////////////////
void setup() {
  background(#370000);
  frameRate(420);
  noFill();
  
  
  img = loadImage("fz.png");
  p3 = fix.getImgColors(img);

  cX = width/2;
  cY = height/2;
  
  strokeWeight(TWO_PI);
  stroke(#EF2012);
  fix.circleGrid(width,height);
  
  strokeWeight(PI);
  stroke(#EF0000);
  fix.circleGrid(width,height);
  stroke(0);
} 

/////////////////////////////////////////////////////////////////////////
void draw() {
  smooth();

  i = frameCount*noise(frameCount, i, sz);
  sz = i/noise(frameCount);
  strokeWeight(PI);

  fix.evenOddStroke(255);
  rect( frameCount, frameCount, sz, sz ); 
  
  fix.evenOddStroke(#EF2012);
  rect( width-frameCount, width-frameCount, i, i ); 



  //    stop
  if ( frameCount > height*1.1 ) {

  fix.circleGrid(height,width);
  fix.paletteGridFull(p3);


    doExit();
  }
}




///////////////////////////////////////////////////////////
//  End handler, saves png
void doExit() 
{

  artDaily("ERICFICKES.COM" );

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + "-" + fix.getTimestamp()+".png" );
  }

  noLoop();
  exit();
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "Silom", 37 ) );
  smooth();

  fill(#370000);
  text( " "+dailyMsg, -15, height-5);
  
  fill(#EF0000);
  text( " "+dailyMsg, -17, height-7);
}

