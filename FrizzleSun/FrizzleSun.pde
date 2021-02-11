//  SEE:   
//  GOTO:  https://github.com/ericfickes/FIXLIB
import fixlib.*;

Fixlib fix = Fixlib.init(this);



Boolean isFinal = true;
int alf = 42;
float sz=0;

int cX;
int cY;

ArrayList p3;
PImage img;

float xoff, x, y;
float n,i = 0;
/////////////////////////////////////////////////////////////////////////
void setup() {
  background(alf);
  size(1024, 768 );
  noFill();
  
  img = loadImage("indies.jpg");
  p3 = fix.getImgColors(img, true);

  cX = width/2;
  cY = height/2;

  stroke(#00EF00);
  fix.circleGrid(width,height);
  
  strokeWeight(TWO_PI);
  stroke(#0000EF);
  fix.circleGrid(width,height);
  
  strokeWeight(PI);
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
  rect( width-frameCount, width-frameCount, sz, sz );   



  //    stop
  if ( frameCount > height ) {

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

  fill(255,360);
  text( " "+dailyMsg, -15, height-5);
}

