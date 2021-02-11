//  SEE:   
//  GOTO:  https://github.com/ericfickes/FIXLIB
import fixlib.*;

Fixlib fix = Fixlib.init(this);



//  color collection examples

final int SKETCH_HEIGHT  = 1024;
final int SKETCH_WIDTH   = 768;

final int COLOR_RED = #FF0000;


Boolean isFinal = true;
int alf = 5;

int cX;
int cY;

int shapeSize = 222;

// circles
int cirXX;
int cirYY;
int startX = 0;
int startY = 0;
float angle      = 0; 
float radius     = 50;  //100;
int circleSize   = 5;
int cc = 0;

int maxCC = 0;


////////////////////////////////////////////////////
color[] palette = { #EF0000, #00EF00, #0000EF, #CECE00, #FA7680, #EF1975, #007007, #EFEF00, #FA9187, #007007, #109109 };
//color[] palette = { #EFEF00, #1975EF, #EFEFEF, #75EF19 };


//TODO: FIND OTHER JAVA COLLECTIONS TO STORE COLORS IN

//  DICTIONARY
//  ASSOCIATIVE ARRAY


////////////////////////////////////////////////////
//
void setup() {

  // setup core sketch settings items
//  size(1024,768); );  // Default = JAVA2D
size(1024,768);
//  size(1024,768);, P3D );
//  size(1024,768);, OPENGL );
//  size(1024,768);, PDF );

  background(1);
  fix.alpha(alf);
  //  setup variables
  cX = width/2;
  cY = height/2;

  startX = cX;
  startY = cY;

  maxCC = width*10;


stroke(COLOR_RED);
rect( cX, cY, shapeSize, shapeSize );

}

float xx = 0;
float yy = cY;


////////////////////////////////////////////////////
//
void draw()
{  
  
    noFill();
    smooth();
    
    cirXX = startX - int( cos(radians(angle)) * radius );
    cirYY = startY - int( sin(radians(angle)) * radius );
    
    fix.ranPalStroke(palette);
    strokeWeight( random(shapeSize) );  
    fix.hexagon( xx, yy, shapeSize );
    

    strokeWeight( random(shapeSize) );
    fix.ranPalStroke(palette);
    point( random(xx), random(yy) );//, shapeSize );

    fix.ranPalStroke(palette);
    strokeWeight(1);
    point( xx, cirXX);


    fix.ranPalStroke(palette);
    strokeWeight(2);
    line(cirYY-radius, xx, yy-radius, cirXX);
    strokeWeight(.25);
    fix.ranPalStroke(palette);
    line(cirYY+cX, cirXX, yy+cX, xx);

    fix.ranPalStroke(palette);
    strokeWeight(.75);
    line(cirYY-radius, cirXX, xx, yy);

    //  center circle
    strokeWeight(1.5);
    stroke(#66EF33, alf*2);
    ellipse( cirXX, cirYY, shapeSize, shapeSize );

    if( cc % 5 == 0) {
      ellipse( cirXX, cirYY, shapeSize, shapeSize );  
    } else {
      fix.ranPalStroke(palette)  ;
    }

      if( xx >= width )
      {
          xx = -shapeSize;
          yy += shapeSize;
          radius++;
        
      } else {
        xx += shapeSize*.5;
      }
  
  // 360
    if( cc > ( maxCC - 540 ) ) {
      shapeSize++;
    }

    angle += 15;//4;
    cc++;

  if( cc >= maxCC ) {
    doExit();  
  }
}


///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void doExit() 
{   
  artDaily("ERICFICKES.COM" );

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + fix.getTimestamp() + ".png" );
  }

  noLoop();
  exit();
}



///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  smooth();
  textFont( createFont( "Silom", 15 ) );
  strokeWeight(1);

  fill( #6976EF , 666 );
  text( " "+dailyMsg, this.width-190, this.height-5);
}

