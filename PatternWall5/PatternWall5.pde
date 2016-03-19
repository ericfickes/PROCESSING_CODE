//
//  Rotate the circles so the crown looking opening points up

Boolean isFinal = true;
float alf = 9;
float ii = 0;

float cX, cY;

float shapeSize = 10;
float ct, maxCt;
Boolean flip = true;

////////////////////////////////////////////////////
//
void setup() {
  // setup core sketch settings items
  size(1024, 768);
  frameRate(303);
  background(9);

  cX = width/2;
  cY = height/2;

  noFill();
  smooth();

  ct = 0;
  maxCt = width;
  stroke(#36EF36, alf/2);
}



void draw()
{

  strokeWeight( 2 );
  stroke( random(36, 69), random(36, 69), random(36, 69), alf*.69 );

  //  vertical
  line( ii, 0, ii, height );
  //  horizontal
  line( 0, ii, width, ii );

  
//  strokeWeight(.5);
  circle( ii, 0, shapeSize, shapeSize, 3 );
  circle( 0, ii, shapeSize, shapeSize, 3 );
  
  circle( ii, height, shapeSize, shapeSize, 3 );
  circle( width, ii, shapeSize, shapeSize, 3 );

  if( ii >= width ) {
    shapeSize += nextFib( (int)shapeSize );//1.4;
    flip = !flip;
  } else if( ii < 0 ) {
    ii = 0;
   flip = !flip; 
  }

//  control the counter ( fwd or bwd )
if(flip) {
 ii += shapeSize; 
} else {
  ii -= shapeSize;
}


  // max count or size is too big
  if( ct > maxCt ) {
      exit();
  } else if (shapeSize > height) {
     shapeSize = floor( sqrt( shapeSize ) );
      stroke(0, alf/2);
  } else {
    stroke(#36EF36, alf);
  }

  // keep track of the loop
  ct++;
}



//////////////////////////
int f0 = 0;
int f1 = 1;
//int f2 = 1;

int nextFib( int f2)
{
  int result = f2;
  f0 = f1;
  f1 = f2;
  f2 = f0 + f1;
  return result;
}

//////////////////////////
//  Calculate max loop count
float getMax( float shapeSize ) {
  return ( ( width * height ) / shapeSize );
}




//////////////////////////////////////////////////////////////////////////
//  Draw manual circle
//  ellipse(x, y, width, height)



void circle( float startX, float startY, float w, float h ) {

  float angle = 0;
  float xx, yy;

  while ( angle < 360 ) {

    // make circle draw faster by skipping angles
    if( angle % 10 == 0 ) {

      xx = startX - int( cos(radians(angle)) * w );
      yy = startY - int( sin(radians(angle)) * w );
  
      smooth();
      ellipse( xx, yy, w, h );
    }
    angle++;
  }
}

void circle( float startX, float startY, float w, float h, float modAngle ) {

  float angle = 0;
  float xx, yy;

  while ( angle < 360 ) {

    // make circle draw faster by skipping angles
    if( angle % modAngle == 0 ) {

      xx = startX - int( cos(radians(angle)) * w );
      yy = startY - int( sin(radians(angle)) * w );
  
      smooth();
      ellipse( xx, yy, w, h );
    }
    angle++;
  }
}

//////////////////////////////////////////////////////////////////////////
//  HEXAGON inspired by http://www.rdwarf.com/lerickson/hex/index.html
void hexagon( float startX, float startY, float shapeSize ) {

  line( startX, startY+(shapeSize*.5), startX+(shapeSize*.25), startY );
  line( startX+(shapeSize*.25), startY, startX+(shapeSize*.75), startY );
  line( startX+(shapeSize*.75), startY, startX+(shapeSize), startY+(shapeSize*.5) );

  line( startX+(shapeSize), startY+(shapeSize*.5), startX+(shapeSize*.75), startY+shapeSize );
  line( startX+(shapeSize*.75), startY+shapeSize, startX+(shapeSize*.25), startY+shapeSize );
  line( startX+(shapeSize*.25), startY+shapeSize, startX, startY+(shapeSize*.5) );
}




///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void exit() 
{

  artDaily("ERICFICKES.COM" );

  //  if final, save output to png
  if ( isFinal )
  {
    save( pdeName() + "-" + getTimestamp()+".png" );
  }

  System.gc();

  super.stop();
  noLoop();
}

////////////////////////////////////////////////////
//  Randomly stroke using image from color list
void ranPalStroke(color[] palette)
{
  // pallete
  stroke( palette[ int(random( palette.length-1 )) ], alf );
}
void ranPalStroke100(color[] palette)
{
  // pallete
  stroke( palette[ int(random( palette.length-1 )) ], 100 );
}

void ranPalFill(color[] palette)
{
  fill( palette[ int(random( palette.length-1 )) ], alf );
}


///////////////////////////////////////////////////////////
//  Helper to random(255) stroke
void randFill() {  
  fill( random(255), random(255), random(255), alf );
}
void randStroke() {  
  stroke( random(255), random(255), random(255), alf );
}
void randStroke100() {  
  stroke( random(255), random(255), random(255), 100 );
}




String getTimestamp() {
  return ""+month()+day()+year()+hour()+second()+millis();
}


/////////////
//  TODO: Is there a better way to get the current sketch name?
String pdeName() {
  return split( this.toString(), "[")[0];
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "Silom", 21 ) );
  smooth();

  fill(#EFEFEF);
  text( " "+dailyMsg, this.width-510, this.height-20);
/*
float yy = 0;
while( yy <= height ) {

  fill(#EFEFEF, yy*.15);
 text( " "+dailyMsg, 5, yy);
 yy += 18; 
}
*/

}

