import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import fixlib.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class InputAndLevel3 extends PApplet {


// https://github.com/ericfickes/FIXLIB 


Fixlib fix = Fixlib.init(this);


Minim minim;
AudioInput in;
int y, x, z, cx, cy, bfSz, radSz;
float x1, x2;

public void setup()
{
  //fullScreen(P2D);
  

  // Pulling the display's density dynamically
  
  background(0);
  
  
  cx = PApplet.parseInt(width/2);
  cy = PApplet.parseInt(height/2);

  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  bfSz = in.bufferSize();
}


public void draw()
{
 //<>//
  x = (frameCount%width);
  y = (frameCount%height);

  // the value returned by the level method is the RMS (root-mean-square) 
  // value of the current buffer of audio.
  // see: http://en.wikipedia.org/wiki/Root_mean_square
  //  EX: 0.022453465
  radSz = PApplet.parseInt(11 * (1 + in.left.level() + in.right.level()) );
  z = (frameCount%radSz);

// debug
println("radSz = "+radSz);

  //  LEVELS
  noFill();
  strokeWeight(1);
  stroke( x%255, (radSz*y)%200, y%255, 200+radSz );

  //  TOP
  pushMatrix();
    sphereDetail( (int)random(2,sqrt(radSz)) );  //random(2,5) );
    translate(x, cy - (in.left.level()*height), z);
    rotate(radSz);
    sphere(radSz);
  popMatrix();
  
  //  BOTTOM
  pushMatrix();
    //boxDetail( (int)random(2,5) );  
    translate(x, cy + (in.right.level()*height), z);
    rotate(radSz);
    box(radSz);
  popMatrix();
 

  //  WAVEFORMS
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < bfSz - 1; i++)
  {
    x1 = map( i, 0, bfSz, 0, width );
    x2 = map( i+1, 0, bfSz, 0, width );
  
    //  LOWER WAVEFORMS
    strokeWeight(PI + (1 + in.left.level() + in.right.level()) );
    stroke( i%255, x%255, y%255, 100);
    point( x1, cy - (in.left.get(i) * 42) - (in.left.level()*cy) , z-11); 
    point( x2, cy + (in.right.get(i+1)* 42) + (in.right.level()*cy) , z-11);
  
    strokeWeight(HALF_PI);
    stroke( random( frameCount%255 ), 200 );
    point( x1, cy - (in.left.get(i) * 42) - (in.left.level()*cy) , z-PI);
    point( x2, cy + (in.right.get(i+1)* 42) + (in.right.level()*cy) , z-11);

  }
  


/*
  //  LEVELS REFERENCE
  strokeWeight(PI + (1 + in.left.level() + in.right.level()) );
  stroke( #EF2016 );
  point( x, cy/3 + (in.right.level()*cy) ); 
  
  strokeWeight(PI + (1 + in.left.level() + in.right.level()) );
  stroke( #2016EF ); 
  point( x, cy/3 - (in.left.level()*cy) );
*/


  //  AUTO SAVER
  //if(frameCount%1800==0){
//  5 minutes?
    if(frameCount%9000==0){
    save( fix.pdeName() + fix.getTimestamp() + ".png");
    minim = null;
    noLoop();
    exit();
  }

}

public void keyPressed()
{
  
  switch(key)
  {
    case 's':
    save( fix.pdeName() + fix.getTimestamp() + ".png");
    break;
  }
  
  
  
}
  public void settings() {  size(1024, 768, P3D);  smooth();  pixelDensity(displayDensity()); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "InputAndLevel3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
