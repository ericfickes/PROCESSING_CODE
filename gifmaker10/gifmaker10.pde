import gifAnimation.*;

boolean gif = true;
GifMaker gifExport;
float xx, sz;
int ct = 1;

/* Vertical bars drawing left to right across the stage */

void setup() 
{
  size(250,250);
  background(255);
  smooth();
  
  frameRate(32);
  if(gif){
	  gifExport = new GifMaker(this, sketchName()+".gif");
	  gifExport.setRepeat(0);             // make it an "endless" animation
	  //  SCRIVNER: multiples of 16 frames
	//  gifExport.setTransparent(0,0,0);    // black is transparent
	  gifExport.setTransparent(255);    // white is transparent
	}
  strokeWeight(PI);

  sz=PI+2;
  noFill();

}



void draw() 
{
    // stroke(frameCount);
    
    

if(ct==0){
	stroke(255);
	line( xx-sz/2, 0, xx-sz/2, height );
	line( xx, 0, xx, height );	
}else{
	stroke(frameCount);
	line( xx, 0, xx, height );
}

    if( xx < width )
    {
      if(gif){
	      gifExport.setDelay(1);
	      gifExport.addFrame();
      }
      xx += sz;
    }
    else
    {
    	if(ct>0)
    	{
    		stroke(255);
    		xx = -sz;
			ct--;
    	}
    	else
    	{
			if(gif){
				gifExport.finish();  // write file
			}
	      stop();
      }
    }


}

////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
PVector circleXY( float centerX, float centerY, float radius, float angle )
{
  return new PVector(
                centerX - int( cos(radians(angle)) * radius ),
                centerY - int( sin(radians(angle)) * radius )
                );
}

//  return unique filename_timestamp string
public String sketchName(){
  return split( this.toString(), "[")[0];
}
//  return unique filename_timestamp string
public String fileStamp(){
  return split( this.toString(), "[")[0] + "_" +month()+day()+year()+hour()+minute()+millis();
}
