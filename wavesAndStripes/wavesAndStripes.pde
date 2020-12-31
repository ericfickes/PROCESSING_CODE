//  SEE:   https://ello.co/ericfickes/post/2runlu6csqxmi7pqsmbnoa
//  GOTO:  https://github.com/ericfickes/FIXLIB
import fixlib.*;

Fixlib fix = Fixlib.init(this);
Boolean isFinal = true;
int alf = 45;
float angle, radius = alf, x, y, cX, cY, pad;

//color[] p3 = { #001919, #191919, #000019, #331919, #176819, #4C1919, #663333, #7F4C33, #191768, #331768, #661919, #994C33, #7F3319, #99664C, #4C3333, #993319, #B24C19, #7F3333, #663319, #7F1768, #4C0000, #7F1919, #330000, #4C1768, #B24C33, #661768, #994C19, #176800, #B23319, #993300, #7F3300, #991768, #993333, #4C3319, #333319, #333333, #193319, #334C33, #4C4C33, #4C6633, #4C664C, #667F4C, #66664C, #193333, #331933, #4C4C4C, #666666, #664C4C, #001768, #7F6666, #667F66, #7F7F66, #4C6666, #334C19, #334C4C, #7F664C, #7F7F7F, #B24C4C, #7F997F, #B26633, #CC4C33, #CC6633, #4C4C19, #99997F, #664C33, #4C6619, #666633, #667F7F, #4C4C66, #667F33, #33334C, #4C334C, #191933, #666619, #664C66, #4C6600, #667F19, #997F7F, #193300, #333300, #7F7F33, #7F7F19, #7F7F4C, #997F4C, #99994C, #999999, #7F994C, #997F33, #B2B2B2, #B2B299, #B29999, #99B299, #999933, #999966, #997F66, #B2997F, #B29966, #CCB2B2, #CCCCB2, #B2CCB2, #B2B27F, #CCB299, #CCB27F, #CCCC99, #CCCCCC, #E5CCB2, #E5CCCC, #E5E5CC, #000000, #CCE5CC, #336619, #E5E5E5, #E5FFE5, #E5E5B2, #FFE5E5, #FFFFE5, #CCCC7F, #CCCC66, #B2B266, #FFFFFF, #CCB266, #CCCC4C, #B2B24C, #CCB24C, #B2B233, #B29933, #B2994C, #E5CC99, #997F19, #999919, #7F6619, #7F6633, #664C19, #4C4C00, #CCE599, #E5E599, #FFFFCC, #E5FFCC, #334C00, #CCE5B2, #99B27F, #FFE5CC, #FFE5B2, #FFFFB2, #E5B299, #CC9966, #B27F33, #B27F4C, #FFCCB2, #CC994C, #FFCC99, #E5B27F, #E5B266, #CC997F, #B27F66, #B26619, #CC6619, #CC7F66, #CC7F33, #CC7F4C, #CC4C19, #B2664C, #996633, #B27F19, #7F4C19, #B26600, #B24C00, #E5B2B2, #7F4C4C, #996666, #CC7F19, #CC6600, #B23300, #B2CC99, #994C00, #4C3300, #E57F33, #996619, #E57F19, #7F4C00, #7F9933, #663300, #7F9919, #E59933, #E59919 }; 
color[] p3 = { #005555, #555555, #5555AA, #55AAAA, #AAAAAA, #AAAAFF, #AAFFFF, #FFFFFF, #005500, #000000, #AAAA55, #AA5555, #FFFFAA, #555500, #FFAAAA, #55AA55, #AAFFAA, #000055, #550000, #FFAA55, #AA5500, #AA55AA, #550055, #FFAA00, #AAAA00, #FF5500, #AA0000, #FF5555, #FFFF55, #FFFF00 }; 

//  keep track of the waves peaking
float maxY1 = 0;

float rX, rY, r2X, r2Y;
int i = 0; 
int a = 1;
int b = 1;
int m = 12;
int n1 = 5;
int n2 = 6;
int n3 = alf; //48;
float r, f;

PVector pvLast; // used to draw lines around the SUPER circle

void settings(){
  size(displayWidth, displayHeight, P3D);
  smooth(8);  //  smooth() can only be used in settings();
  pixelDensity(displayDensity());
}



void setup() {
  // setup core sketch settings items

  background(#161616);
  fix.alpha(alf);
  //  setup variables
  cX = width/2;
  cY = height/2;

  noFill();

}


////////////////////////////////////////////////////
//
void draw()
{

    angle = ( frameCount %2==0) ? frameCount : frameCount*noise(frameCount);

    x = cX - int( cos(radians(frameCount)) * radius );
    y = cY - int( sin(radians(frameCount)) * radius );


/*
r = noise(frameCount) + pow((pow(abs(cos(m*f/4)/a),n2) + pow(abs(sin(m*f/4)/b), n3)), -(1/n1));
r = noise(frameCount) + pow((pow(abs(cos(m*f/4)/a), random(n2)   ) + pow(abs(sin(m*f/4)/b), random(n3)  )), -(1/n1));


  x = r * cos(f) * int( alf * radians(frameCount) );
  y = r * sin(f) * int( alf * radians(frameCount) );

*/


//  r = noise(frameCount) + pow((pow(abs(cos(m*f/4)/a),n2) + pow(abs(sin(m*f/4)/b), n3)), -(1/n1));
    r = noise(angle) + pow((pow(abs(cos(m*f/4)/a), random(n2)   ) + pow(abs(sin(m*f/4)/b), random(n3)  )), -(1/n1));
    rX = cX - int( cos(radians(angle)) * (radius*r) );
    rY = cY - int( sin(radians(angle)) * (radius*r) );

    if( null != pvLast ){


      strokeWeight(.75);

      //  TRIANGLE HORIZONTAL WAVE STRIPES
      pad = alf*PI;
      
      strokeWeight(11);
      stroke(255);
      point(i, y-pad, -radius);

      strokeWeight(9);
      stroke(#161616);
      point(i, y-pad, -radius);


      if(frameCount%12==0){
        fix.ranPalStroke100(p3);
        strokeWeight(1);
        point(i,y);
      }

      strokeWeight(11);
      stroke(#161616);
      point(i, y+pad, radius);

      strokeWeight(9);
      stroke(255);
      point(i, y+pad, radius);
    }

    f+=TWO_PI;

    //  persist this point for the next time through the loop
    pvLast = new PVector(rX, rY);

if( angle % 90 == 0 ){
  strokeWeight(.45);
  stroke(#EF1975);
  line(0, y-pad, width, y-pad);
  stroke(#1975EF);
  line(0, y+pad, width, y+pad);
}

    // if( frameCount % 360 == 0 ){//////////////////////////////////////
if( frameCount % 360 == 0 ){

    radius += 11;

    a+=PI;  //1;
    b+=PI;  //1;
    m+=PI;
    n1+=PI;  //5;
    n2+=11;  //6;
    n3+=20; //48;
    f += PI;
    }
 
    // move over a pixel
    if (i < width) {
        i++;
    } else {
        i = 0; 
    }
 
    if(radius*3 > height){
      doExit();
    }

}




///////////////////////////////////////////////////////////
//  End handler, saves png
void doExit() 
{


  // artDaily("ERICFICKES.COM" );
  artDaily( "ERICFICKES.COM" );

  //  if final, save output to png
  if ( isFinal )
  {
    String saveName = fix.pdeName() + "-" + fix.getTimestamp();
    save( saveName +".tif" );
    save( saveName +".png" );

  }




  noLoop();
  exit();
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

textFont( createFont( "Silom", 21 ) );
smooth();

  fill(0);
  text( " "+dailyMsg, 0, height-21 );
  fill(#20EF12);
  text( " "+dailyMsg, 0, height-22 );
  fill(#2012EF);
  text( " "+dailyMsg, 0, height-23 );
}
