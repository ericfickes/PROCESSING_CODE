//  SEE:   https://ello.co/ericfickes/post/dwl_aiarfdzpkji8b-ciba  
//  GOTO:  https://github.com/ericfickes/FIXLIB 
import fixlib.*;

Fixlib fix = Fixlib.init(this);

Boolean isFinal = true;
int alf = 69;
float x,y, t;
float angle = 0;
float xx, yy, startX, startY;
float w = 69;


// image
PImage img;
ArrayList p3;

int i = 0, cX, cY, rad = 69; 
Boolean on = false;


/* ------------------------------------------------------------------------- */

void  settings ()  {
    size(displayWidth, displayHeight, P3D);//, P3D, P2D, FX2D  NOTE: P2D throwing tesselation errors
    smooth(8);  //  smooth() can only be used in settings();
    pixelDensity(displayDensity());
}

/*****************************************************************************/
void setup() 
{
  background(#EF6969);

  background(0);
  frameRate(666);

  fix.alpha(alf);
  noFill();
  smooth();
  ellipseMode(CENTER);
  //  setup variables
  cX = floor(displayWidth*.42);
  cY = displayHeight/2;
  
  img = loadImage("./WhatYouEC2b-11420201012240.png");

  //  MAKE TILED BACKGROUND
  for( int yy = 0; yy <= 768; yy += img.height ){

    for( int xx = 0; xx <= 1024; xx += img.width ){
      image( img, xx, yy );
    }
  }
    
  filter(GRAY);  //  INVERT);//
  
  p3 = fix.getImgColors( img );
    
  
   xx = yy = -(w/2); 

}


////////////////////////////////////////////////////
//
void draw()
{
    strokeWeight(1);  
    if( yy < displayHeight ) {
      fix.ranPalStroke( p3 );
      fix.drawLissajous( xx, yy, alf/HALF_PI );
    }
    
    if( xx < displayHeight ) {
      fix.ranPalStroke( p3 );
      fix.drawLissajous( yy, xx, alf/HALF_PI );
    }

//    stroke(#EF1975, alf);
    fix.ranPalStroke( p3 );
    bezier( xx, yy, yy, xx, xx, yy, xx, yy );
//    stroke(#1975EF, alf);
    fix.ranPalStroke( p3 );
    bezier( yy, xx, xx, yy, yy, xx, yy, xx );

    strokeWeight(1);  
    stroke( #370000,100 );
    curve( xx, yy, rad, frameCount, alf, frameCount, yy, xx );
    curve( yy, xx, rad, frameCount, alf, frameCount, xx, yy );

    strokeWeight(HALF_PI);  
    stroke(0, 99);
    fix.systems( yy, xx );

    fix.systems( rad, frameCount );
    fix.systems( frameCount, rad );
    
    strokeWeight( random(TWO_PI) );
    stroke(random(25,75) );
    fix.systems( xx, yy );
    
    strokeWeight(QUARTER_PI);
    stroke( #003700,100 );
    fix.systems( xx, yy ); 
    fix.systems( yy, xx );
    fix.systems( rad, frameCount );
    fix.systems( frameCount, rad );
    
  //  circles
  
 if( frameCount % alf == 0){
        on = !on;
    }
 
    //  bring the noise
    
    if(on){
//        stroke(random(255),100);
        x = floor( cX+cos(radians(frameCount))*rad );
        y = floor( cY+sin(radians(frameCount))*rad )+noise(frameCount)+noise(rad);
 
    } else {
//       stroke(random(111), 100);
        x = floor( cX+cos(radians(frameCount))*rad );
        y = floor( cY+sin(radians(frameCount))*rad );
    }

    fix.ranPalStroke(p3);
    strokeWeight(random(11));
    point( x, y );
    point( y, x );

    strokeWeight(random(TWO_PI));
    
    stroke( random(rad), random(rad), random(rad), alf*PI );
    fix.systems( x+rad, y+rad );//, rad, rad );
    stroke( random(rad), random(rad), random(alf), alf*PI );
    fix.systems( y-rad, x-rad);//, rad, rad );


 
    if( frameCount % 360 == 0){
        rad += 42;
        on = !on;
    }
  
  //  circles


  
  t++;

  if( xx > displayWidth ) {
    xx = -(w/2);
    yy += w;
  } else {
    xx += w; 
  }




  if( yy > displayWidth ) {
    doExit();
  }

}



///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void doExit() 
{

  //  artDaily("The difference between who you are and who you want to be is WHAT YOU DO");
  artDaily("ERICFICKES.COM");

  ec2Stamp(cX, cY);

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

  textFont(createFont("Silom",11));
  smooth();
  
  fix.ranPalFill( p3 );
  text( " "+dailyMsg, displayWidth-222, displayHeight-10);
  
  fix.ranPalFill( p3 );
  text( " "+dailyMsg, displayWidth-222, displayHeight-9);
  
  fill(#EFEFEF);
  text( " "+dailyMsg, displayWidth-222, displayHeight-8);
}

///////////////////////////////////////////////////////////
//
//  e][c stamp
void ec2Stamp( int x, int y ){

//  OCRAStd
//  test stamp
//AmericanTypewriter-Bold
//  RosewoodStd-Regular
// AmericanTypewriter  Monaco  AmericanTypewriter-Bold "Silom"
  smooth();
  
  textFont( createFont( "MesquiteStd", 222 ) );
  fill(0);
  text( "e", x-4, y );//  text( "e", cX-4, cY );
  
  textFont( createFont( "MesquiteStd", 217 ) );
  fill(#EFEFEF);
  text( "e", x-4, y-2 );//  text( "e", cX-4, cY-2 );

  fill(0);
  textFont( createFont( "MesquiteStd", 345 ) );
  text( "]", x+32, y+46 );//text( "]", cX+32, cY+46 );
  text( "[", x+80, y+46 );//text( "[", cX+80, cY+46 );
  
  fill(#EFEFEF);
  textFont( createFont( "MesquiteStd", 340 ) );
  text( "]", x+32, y+44 );//text( "]", cX+32, cY+44 );
  text( "[", x+80, y+44 );//text( "[", cX+80, cY+44 );
  
  fill(0);
  textFont( createFont( "MesquiteStd", 222 ) );
  text( "c", x+127, y );//text( "c", cX+127, cY );
  
  textFont( createFont( "MesquiteStd", 217 ) );
  fill(#EFEFEF);
  text( "c", x+127, y-2 );//text( "c", cX+127, cY-2 );
}
