//  SEE:   https://ello.co/ericfickes/post/uuabublnsdadpvfxznew-q
//  GOTO:  https://github.com/ericfickes/FIXLIB
//  source
//  http://studio.sketchpad.cc/sp/pad/view/ro.9ZdbPHUvjZkMn/latest
//  clone
//  http://studio.sketchpad.cc/sp/pad/newsketch?clonePadId=ro.9ZdbPHUvjZkMn&cloneRevNum=5
import fixlib.*;

Fixlib fix = Fixlib.init(this);


Boolean isFinal = true;
int buf;
int alf = 123, tX, tY, inLeft, inRight, wvStart,i;


////  CIRCLEY THING
float cX, cY, inc, m; 
float r, g, b;
int tmr_Interval = 9;  // seconds

float x, y, angle, sz=75;
float x2, y2, angle2, sz2; 
float x3, y3, angle3, sz3; 
float x4, y4, angle4, sz4; 


void settings(){
  size(displayWidth, displayHeight, P3D);
  smooth(8);  //  smooth() can only be used in settings();
  pixelDensity(displayDensity());
}


////////////////////////////////////////////////////////////////////////
void setup() {

  background(#2020EF); 
  noFill();
  ellipseMode(CENTER);
  rectMode(CENTER); 
  strokeCap(ROUND); 
  strokeJoin(ROUND);

  
  fix.alpha(alf);

  cX = width/2;
  cY = height/2;
  sz = random(100,200);
  sz2 = random(109,209);
  sz3 = random(150,250);
  sz4 = random(185,285);


  y = cY;

//  minim = new Minim(this);
//
//  // use the getLineIn method of the Minim object to get an AudioInput
//  in = minim.getLineIn();
}

/////////////////////////////////////////////////////////////////
void draw()
{
    smooth();

       
    //  CIRCLE CIRCLE DOT DOT
    x = cX - int( cos(radians(angle)) * sz +noise(frameCount) );
    y = cY - int( sin(radians(angle)) * sz +noise(frameCount) );
 
    strokeWeight(1);
    stroke(frameCount%2==0?0:255,alf);
    ellipse( cX, cY, angle, angle );
 
    strokeWeight(14);
    stroke(frameCount%2==0?0:255);
    point( x, y );
    point( width-x, height-y );
 
    strokeWeight(9);
    stroke(frameCount%2==0?255:0);
    point( x, y );
    point( width-x, height-y );
    
    strokeWeight(4);
    stroke(frameCount%2==0?0:255);
    point( x, y );
    point( width-x, height-y );
 
    if( frameCount % 45 == 0 ){
      sz+=15;
    }

    if( angle < width)
        angle+=TWO_PI;
    else
        angle = 0;
    
     x = cX - int( cos(radians(angle)) * sz +noise(frameCount) );
     y = cY - int( sin(radians(angle)) * sz +noise(frameCount) );

 
getFlowery( random(cX), random(cY), 
            y-i, x-i,
            x+noise(frameCount), y+noise(frameCount),
            random(width-x), random(height-y) );
 

 
 
    if (i < (height/2) ) {
        i+=2;
    } else {
        i = 0; 
    }


    
  ////  STOPPER
  if ( frameCount > width ) {
    doExit();
  }
}


///////////////////////////////////////////////
//  bezier helper
void getFlowery(
  float x, float y,
  float x2, float y2,
  float x3, float y3, 
  float x4, float y4
)
{

    strokeWeight(12);
    stroke(#EF0000);
    bezier( x, y, x2, y2, x3, y3, x4, y4);
 
    strokeWeight(6);
    stroke(#EFEF00);
    bezier( x, y, x2, y2, x3, y3, x4, y4);
 
    strokeWeight(2);
    stroke(#000045);
    bezier( x, y, x2, y2, x3, y3, x4, y4);
}






///////////////////////////////////////////////////////////
//  End handler, saves png
void doExit() 
{

  artDaily( "ERICFICKES.COM" );

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + "-" + fix.getTimestamp()+".hdr" );
  }

  noLoop();
  exit();
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "QuickSand", 37 ) );  //  "TrajanPro-Bold"
  smooth();

  fill(#EFEFEF);
  text( " "+dailyMsg, width-300, height-2);

  fill(0);
  text( " "+dailyMsg, width-301, height-3);
}
//  REMEMBER, FUCK JVASCRIPT
