//
//  Draw a heart pattern using circle logic and fibonacci numbers
//  UPDATE: this has morphed into a sun type explosion
//  grayscale background, hot color overlayed
//

Boolean isFinal = true;
int alf = 42;

int cX;
int cY;

//  #EF0000, #00EF00, #0000EF, #EFEFEF, #A59DA1, #D96D55, #F36613, #A9ABEA, #D23301, #F6FAFD, #AB6E9C, #D6F9FF, #F8751E, #768A00, #F05510, #FFEE51, #FFB02A, #D7D5FA
color[] palette = { 
#000000, #efefef, #efefef
};

color[] p2 = { 
#A59DA1,#D96D55,#F36613,#A9ABEA,#D23301,#F6FAFD,#AB6E9C,#D6F9FF,#F8751E,#768A00,#F05510,#FFEE51,#FFB02A,#D7D5FA,
#EF0000, #EFEF11, #36EF75, #EF7535, #FF1234, #EF3619
};

float xx, yy;
float outerXX = 0;
float outerYY = 0;

float angle = 0;
float outerAngle = 0;
float maxAngle;
float radius = 1;
float outerRadius = 2;

float offsetX = 0;
float offsetY = 0;


int ct = 0;
int maxCt = 0;

////////////////////////////////////////////////////
//
void setup() {
  // setup core sketch settings items
  size(1024, 768);
  frameRate(303);
  background(alf);

  //  setup variables
  cX = width/2;
  cY = height/2;

  offsetX = width - cX;
  offsetY = height - cY;

  maxCt = 10000;
  strokeWeight( 10 );
}


////////////////////////////////////////////////////
//

void draw()
{
  smooth();

  stroke( random(25, 255), alf);
  noFill();

  xx = ( offsetX - int( cos(radians(angle)) * radius ) );
  yy = ( offsetY - int( sin(radians(angle)) * radius ) );

  outerXX = ( offsetX - int( cos(radians(outerAngle)) * outerRadius ) );
  outerYY = ( offsetY - int( sin(radians(outerAngle)) * outerRadius ) );

    strokeWeight(10);      
    if( angle > ( maxCt * .75 ) ) {
      ranPalStroke(p2);
    } else {
      ranPalStroke(palette);
    }
    point( yy, xx );


    
    if( angle > ( maxCt * .75 ) ) {
      ranPalStroke(p2);
    } else {
      ranPalStroke(palette);
    }
    point( outerXX, outerYY );

//    stroke( random( 2, alf ), alf );
    strokeWeight(.5);
    line( xx, yy, outerXX, outerYY );

    angle++;
    outerAngle++;

radius = nextFib( int(radius) );
if( radius > height || radius < 0 ) {
  radius = alf;

  circle( outerXX, outerYY, alf, alf, random(alf) );
}

outerRadius++;
if( outerRadius > height || outerRadius < 0 ) {
  outerRadius = alf;
  circle( outerXX, outerYY, alf, alf, alf );
}

offsetY ++;
if( offsetY > height || offsetY < 0 ) {
  offsetY = random( cY, height);
}
offsetX++;
if( offsetX > width || offsetX < 0 ) {
  offsetX = random(cX, width);
}
  
    if ( angle < -maxCt || angle > maxCt ) {
    doExit();
  }
  
  
}

//////////////////////////
int f0 = 0;
int f1 = 1;
//int f2 = 1;

int nextFib( int f2)
{
//   int result = f2;
   f0 = f1;
   f1 = f2;
   f2 = f0 + f1;
   
   return f0 + f1;
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



//////////////////////////////////////////////////////////////////////////
//  Draw manual circle
void circle( float startX, float startY, float w, float h ) {

  float angle = 0;
  float xx, yy;
  noFill();
  
  while ( angle < 360 ) {

    // make circle draw faster by skipping angles
    if( angle % 3 == 0 ) {

    xx = startX - int( cos(radians(angle)) * w );
    yy = startY - int( sin(radians(angle)) * w );


    ellipse( xx, yy, w, h );
    }
    angle++;
  }
}


//////////////////////////////////////////////////////////////////////////
//  Draw manual circle
//  OVERRIDE : @modAngle - restrict drawing to angle % @modAngle
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
void doExit() 
{

  artDaily("ERICFICKES.COM"+getTimestamp() );

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + "-" + fix.getTimestamp()+".png" );
  }

  noLoop();
  doExit();
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

  textFont( createFont( "Silom", 18 ) );
  smooth();

  fill(#EF0000);
  text( " "+dailyMsg, this.width-430, this.height-14);
/*
float yy = 0;
while( yy <= height ) {

  fill(#EFEFEF, yy*.15);
 text( " "+dailyMsg, 5, yy);
 yy += 18; 
}
*/

}