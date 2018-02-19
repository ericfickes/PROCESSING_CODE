// https://github.com/ericfickes/FIXLIB	
import fixlib.*;

Fixlib fix = Fixlib.init(this);
// circles
Boolean isFinal = true;
int ctMAIN = 0;
int alf = 13;

int cX;
int cY;

int cubeSize = 150;

int dotSize     = 20;  //16;  // size of ellipse used to draw sine wave
int xspacing    = 10, yspacing = xspacing;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta     = 0.0;  // Start angle at 0
float amplitude = 15;  // Height of wave
float period    = 100.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] xvalues, yvalues;  // Using an array to store height values for the wave
float x = 0;

int xx = 0;
int yy = 0;

int outerXX = 0;
int outerYY = 0;

float angle = 0;
float maxAngle;
float radius = 25;
float outerRadius = 75;

int offsetX = 0;
int offsetY = 0;

Boolean gotGrid = false;

Boolean flip = false;

color[] palette = { #484547, #4c4434, #575550, #3c3a2f, #44432b, #3f3f2c, #383828, #32382a, #373c2d, #3b3b2d, #424636, #23261e, #262921, #444b3d, #394337, #485346, #434d45, #454e45, #52554b, #d8f8f8, #848c94, #e4fcfc, #323531, #838d8a, #73736c, #7b8283, #817e86, #d3d4dd, #f0f7f8, #dad7dc, #fafefe, #fbfefe,
#574f50, #55443e, #5c4e48, #725644, #785c49, #4d453f, #9c8e83, #86684f, #997046, #be8649, #787571, #b19866, #6d6a64, #dabe82, #7c7a72, #313728, #333c2c, #5a5b49, #4c4c3e, #4c4f42, #4a5346, #4a4b40, #465147, #5e5a65, #5d5b65, #575159, #74787f, #707970, #6f7570, #797b7d,
#959394, #bbb9ba, #787878, #273121, #2b3323, #31382a, #22251c, #373b2f, #414638, #41453a, #4c4e45, #3e453f, #575e55, #59605c, #a7b0b4, #7c7e81, #757874, #3c3c3a, #494b4a, #979599, #767977, #a19fa3, #b3b6b7, #606262, #959898, #9b9d9e, #828381, #9c9e9d, #9f9ea0, #b1b2b3, #d8d7d9,
#5a5555, #a29b9b, #9a9191, #827e7e, #8e8785, #928986, #7d736f, #7b6f6a, #d2cbc8, #aca5a2, #a59f9c, #887f7a, #aca5a1, #87807b, #c4b9b1, #a39b95, #bcb4ae, #b0a8a2, #9f9791, #a8a39f, #b8b1ab, #b9b6b3, #a39e98, #a29d97, #98938c, #757068, #7d7a75, #75736f, #8b8882, #a6a196, #767469
 };

////////////////////////////////////////////////////
//
void setup() {
  // size to match image
  size(1024, 768);
  frameRate(303);
  background(9);
  fix.alpha(alf);

  smooth();
  noFill();


  cX = int( this.width / 2 );
  cY = int( this.height / 2 );


  offsetX = cX;///2;
  offsetY = cY;///2;

  //  max angle = where does the circle stop?
  maxAngle = (360*55);

//  outerRadius = (radius + (PI+alf) );  //pow( radius, 2 );


  w = int(width+16+alf);
  dx = (TWO_PI / period) * xspacing;
  xvalues = new float[w/yspacing];
  yvalues = new float[w/xspacing];

  
  strokeWeight(.75);

}


////////////////////////////////////////////////////
//
void draw()
{
  smooth();
  noFill();


    xx = ( offsetX - int( sin(radians(angle)) * radius ) );
    yy = ( offsetY - int( cos(radians(angle)) * radius ) );

    outerXX = ( int(offsetX+alf) - int( cos(radians(angle)) * outerRadius ) );
    outerYY = ( int(offsetY+alf) - int( sin(radians(angle)) * outerRadius ) );


    fix.randStroke();
    
    strokeWeight(.25);
    line( random(xx), random(yy), width-random(outerXX), height-random(outerYY) );
    stroke( #EFEFEF, alf );
    strokeWeight(.75);    
    //  ellipse( outerXX, outerYY, outerRadius, outerRadius );
    point( xx, yy);
    point( outerXX, outerYY);
    
    fix.ranPalStroke(palette);
    sineWave( xx, yy );
    sineWave( outerXX, outerYY );
    
    stroke( #EFEFEF, alf );
    fix.hexagon( xx, yy, alf );
    fix.ranPalStroke(palette);
    fix.hexagon( outerXX, outerYY, alf );

if( angle % 180 == 0 ) {
  outerRadius+=alf;
  radius+=alf;
//  stroke(#75EF91, alf*4);
alf*=3;
  fix.randStroke();
  fix.hexagon( xx, yy, radius );
//  stroke(#EF7519, alf*4);
  fix.hexagon( outerXX, outerYY, outerRadius );
alf/=3;
}

//    if( angle % 180 == 0 ) {
//      offsetX += alf;
//    } else {
    angle += 4;
    radius+=alf;
//    }

  if ( angle >= maxAngle )
  {    
    doExit();
  }
}





///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void doExit() 
{
  
  artDaily("ERICFICKES.COM");

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName()+fix.getTimestamp()+".png" );
  }

  noLoop();
  exit();
}



///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  PFont font = createFont( "Silom", 18 );

  smooth();
  textFont( font );
  strokeWeight(1);

//  fill( #000000 , 666 );
  fill(#EFEFEF, pow(alf,3) );
  text( " "+dailyMsg, this.width-225, this.height-15);
  
//  fill( #003600 , 666 );
  fill(#CADDAC, pow(alf,3) );
  text( " "+dailyMsg, this.width-226, this.height-16);
}



/////

// NOTE : this function can NOT be moved because of the usage of xvalues and yvalues

//  Sine Wave grid, axii starting and supplied x and y
void sineWave( float startX, float startY ) {

  // Increment theta (try different values for 'angular velocity' here
  float theta = 0.2;

// NOTE: all of this code assumes the same settings for x and yvalues

  // For every x value, calculate a y value with sine function
  float x = theta;
  float y = theta;
  for (int i = 0; i < yvalues.length; i++) {
    xvalues[i] = sin(y)*amplitude;
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
    y+=dx;
    
  }


//  noStroke();    

  // A simple way to draw the wave with an ellipse at each location
  int yy = 0;
  for (int xx = 0; xx < yvalues.length; xx++) {

    smooth();    
    strokeWeight(2);
    alpha(111);
    fix.ranPalStroke(palette);


    //  HORIZONTAL
//    ellipse(xx*xspacing,startY+yvalues[xx], dotSize, dotSize);
//    point(xx*xspacing,startY+yvalues[xx]);

    //  VERTICAL
point(startX+yvalues[xx], yy*yspacing);//,dotSize, dotSize);
    
    yy++;
  }
}

