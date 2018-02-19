import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import fixlib.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class IBR3a extends PApplet {

// https://github.com/ericfickes/FIXLIB 


Fixlib fix = Fixlib.init(this);

//  make rounded rect that match the app group
//  http://en.wikipedia.org/wiki/Silver_(color)

public Boolean isFinal = true;
int rowCt = 10, colCt = 5, dWidth, dHeight;
float rowH, colW, startX = 0, startY = 0, xx = 0, yy = 0, shapeSz, strokeSz;
int clr = 0xff228B22;

//  silvers - http://en.wikipedia.org/wiki/Silver_(color)
//color[] p2 = { #C0C0C0, #C9C0BB, #C4AEAD, #BFC1C2, #ACACAC, #838996, #848482, #757575 };

int[] p3 = { 0xff750000, 0xff676800, 0xff420000, 0xff370000, 0xff110000, 0xffEF2012 };  


//  Vermilion
//http://en.wikipedia.org/wiki/Vermilion#Orange-red
//color[] p3 = { #EF2012, #E34234, #FF5349, #FF3F00, #D9603B, #AA381E, #C0C0C0, #C9C0BB, #C4AEAD, #BFC1C2, #ACACAC, #838996, #848482, #757575, #19EF75, #87A96B, #006400, #71BC78, #228B22, #49796B, #29AB87, #A9BA9D, #90EE90, #74C365, #ADDFAD, #317873, #98FB98, #01796F, #009E60, #008080, #00FF00, #008000, #00A550, #009F6B, #00A877, #4B5320, #006A4E, #66FF00, #1B4D3E, #1E4D2B, #00563F, #00703C, #50C878, #4D5D53, #00AB66, #ADFF2F, #3FFF00, #355E3B, #138808, #009768, #00A86B, #4CBB17, #004953, #18453B, #39FF14, #00853E, #006600, #00A693, #2E8B57, #014421 };

//////////////////////////////////////////////////////////////////////////////////////////////////////////
public void setup() {

  dWidth = 1024;  //640;  //  
  dHeight = 768;  //960; //    
  
  
  background(255);
  frameRate(666);
  
  noFill();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  
  rowH = 175;
  colW = 153;
  
  startX = -62;
  startY = 126-rowH;

  strokeSz = 8;
  shapeSz = (rowH+colW);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
public void draw() {


  
  strokeWeight(strokeSz);
    
    
  //  move
  if( xx < dWidth+colW ){
    xx += (colW*.75f);
  } else {
    xx = 0;
    yy += (rowH*.75f);    
  }
  
  if( xx >= dWidth+colW && yy >= dHeight+rowH ) {
    xx = 0;
    yy = 0;
  
    shapeSz -= 5;
    if(strokeSz>2)
      strokeSz -= .125f;
    else
      strokeSz -= .01f;
      
      if(strokeSz<=0)
      {
        strokeSz = 0.5f;
      }
  }

  if(frameCount%69==0) {
    stroke( p3[ PApplet.parseInt(random( p3.length )) ] );
    ellipse( startX+xx, startY+yy, shapeSz, shapeSz);
    rect( startX+xx, startY+yy, shapeSz, shapeSz, 11);
  } else {
    stroke(random(21), 200);
    rect( startX+xx, startY+yy, shapeSz, shapeSz, noise(frameCount));
  }

      
  if( shapeSz <= 11 ) {
  
      fill(255);
      textFont(createFont("Silom",23));
      
      //    TOP RIGHT CORNER-ISH ( between the time and the battery )
      text("ERICFICKES.COM", (dWidth/2)*1.2f, 25 );  // 28

//      Bottom left corner
//      text("ERICFICKES.COM", -2, height-2 );

      if(isFinal){
        save( fix.pdeName() + fix.getTimestamp() + ".png" );
      }
      noLoop();
      exit();
  }
}
  public void settings() {  size( 1024, 768 );  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "IBR3a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
