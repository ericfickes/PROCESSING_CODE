Boolean isFinal = true;
int ctMAIN = 0;
int alf = 11;

int cX;
int cY;
float xx = 0;
float yy = 0;

float outerXX = 0;
float outerYY = 0;

int pad = 69;
int cubeSize = 30;

float angle = 0;
float outerAngle = 0;
float maxAngle;
float radius = 10;
float outerRadius = 1000;

float offsetX = 0;
float offsetY = 0;


//  #EF0000, #00EF00, #0000EF, #EFEFEF, #A59DA1, #D96D55, #F36613, #A9ABEA, #D23301, #F6FAFD, #AB6E9C, #D6F9FF, #F8751E, #768A00, #F05510, #FFEE51, #FFB02A, #D7D5FA
color[] p1 = { 
#EF0000, #EFEF00, #000036
};

//  ,#F6FAFD,#AB6E9C,#D6F9FF,#F8751E,#768A00,#F05510,#FFEE51,#FFB02A,#D7D5FA
color[] p2 = { 
#A59DA1,#D96D55,#F36613,#A9ABEA,#D23301
};

////////////////////////////////////////////////////
//
void setup() {
  size(1024, 768 );

  //  ---------------------
  background (18);

  smooth();
  noFill();

  cX = int( this.width / 2 );
  cY = int( this.height / 2 );

  xx = -cubeSize;
  yy = xx;  

  offsetX = cX;
  offsetY = cY;

  //  max angle = where does the circle stop?
  maxAngle = (360 * 20 );

}


////////////////////////////////////////////////////
//
void draw()
{
  smooth();
  noFill();

  xx = ( offsetX - int( cos(radians(angle)) * radius ) );
  yy = ( offsetY - int( sin(radians(angle)) * radius ) );

  outerXX = ( offsetX - int( cos(radians(outerAngle)) * outerRadius ) );
  outerYY = ( offsetY - int( sin(radians(outerAngle)) * outerRadius ) );

      strokeWeight( cubeSize );
      
if( floor(angle) % 3 == 0 ) {
  
  strokeWeight( .5);
  stroke(0);
  ellipse( xx, yy, cubeSize, cubeSize );
  strokeWeight( cubeSize );  

    if( angle < 540 )
    {    
      stroke( #1975EF, alf );
      line( xx, yy, random(outerXX), random(outerYY) );
    }
    else if( angle < 1080 )
    {    
      ranPalStroke(p1);//      stroke( #19EF19, alf );
      line( xx, yy, outerXX+pad, outerYY+pad);
    }
    else
    {
      ranPalStroke(p2);
    }
    
    line( xx, yy, outerXX, outerYY);
}

  angle += alf;
  outerAngle += 2;

//    ellipse( xx, yy, radius, radius  );
//    point( outerXX, outerYY);//, radius, radius, 45 );
//    ellipse( yy, xx, radius, radius  );

  
  if ( angle >= maxAngle )
  {
    doExit();
  }
  
  
  if( floor(angle) % 360 == 0 ) {
      radius += alf;
      outerRadius += alf;
      
//      offsetX -= alf;
//      offsetY -= alf;
      
      cubeSize += 3;

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
    if ( angle % 3 == 0 ) {

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
    if ( angle % modAngle == 0 ) {

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

  fill(#EFefef);
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
