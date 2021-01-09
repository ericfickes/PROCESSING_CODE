//  SEE:   https://ello.co/ericfickes/post/mc6-hti5yn3kpjgqi4jaza
//  GOTO:  https://github.com/ericfickes/FIXLIB
import fixlib.*;
Fixlib fix = Fixlib.init(this);

//  RECT GRID playing with rounded rectangle radiuss

public Boolean isFinal = true;
public Branch br;
public int rectSz = 1;



void settings(){
  size(displayWidth, displayHeight, P3D);
  smooth(8);  //  smooth() can only be used in settings();
  pixelDensity(displayDensity());
}


//////////////////////////////////////////////////////////////////////////
void setup(){
  frameRate(666);
  background(#EF1975);

  smooth();
  noFill();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  br = new Branch( 666, 2 );
}


//////////////////////////////////////////////////////////////////////////
void draw(){
  
 
  
  //  draw all kids
  for( PVector thisPV : br.KIDS ) {
  
    moveSys( thisPV );

    drawSys( thisPV );

  }

//if( frameCount % int(width/2) == 0 )
//{
//    br.Split();
//}

    //  STOPPER when ANY kid hits < 0
    strokeWeight(1);
        
//    if( br.BranchWidth < 1 ){
    if( rectSz > 66 ){
  
      for( PVector thisPV : br.KIDS ) {
        
        stroke(#EF2012);
        rect( thisPV.x, thisPV.y, rectSz, rectSz );
      }      


      textFont(createFont("Silom",37));
      
      fill(#421111);
      text("ERICFICKES.COM", 10, height-10 );
      fill(#EF2012);
      text("ERICFICKES.COM", 11, height-11 );

      if(isFinal){
    String saveName = fix.pdeName() + "-" + fix.getTimestamp();
    save( saveName +".tif" );
    save( saveName +".png" );
      }
      noLoop();
      exit();
    }  
}


//////////////////////////////////////////////////////////////////////////
//  update the X and Y of supplied PVector
void moveSys( PVector pv ) {
 
//   if( br.SplitBy % 3 == 0 ){
   
     // horizontal
      if( pv.x < width ) {
          pv.x += 51;
      } else {
        
        if( pv.y < height )
          pv.y += 51;
        else
          pv.y = 0;
        
        
        pv.x = 0;
      }
      
  if( pv.x >= width && pv.y >= height ){
    pv.x = 0;
    pv.y = 0;
    

    rectSz += 6;
    
  }

  
}

//////////////////////////////////////////////////////////////////////////
//  draw stuff using supplied PVector
void drawSys( PVector pv ) {
  
  noFill();
  //strokeWeight(2);
  
  stroke(random(255) );
  //stroke( random(pv.y+pv.x)%255 );
  //stroke((pv.x/pv.y)%255);

  ellipse( pv.x, pv.y, rectSz, rectSz );
  rect( pv.x, pv.y, 50, 50, rectSz );

}




/***********************************************************************/ 

public class Branch{
  
  public int BranchWidth;
  public int SplitBy;
  public ArrayList<PVector> KIDS;

  private ArrayList<PVector> bebeKIDS;
//  private int[] fibSplit = { 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 };
  private int[] fibSplit = { 2, 3, 6, 7, 8, 9, 10, 11, 12, 13 };
  private int splitCt = 0, splitX;  

  ///////////////////////////////////////////////////////////  
  Branch( int bWidth, int splitBy){

    this.BranchWidth = bWidth;
    this.SplitBy = splitBy;
    
    KIDS = new ArrayList<PVector>();
    KIDS.add( new PVector(0,0) );
  }
  
  //  Use @SplitBy ///////////////////////////////////////////////////////////
  //  - Adjust BranchWidth
  //  - return new list of kids
  public void Split(){
    
    //  make sure we're not growing outside of the array
    if( splitCt == fibSplit.length ) {
      splitCt = 0;  //  reset 
    }
    
    //  UPDATE SplitBy to the next number in the fibonacci sequence
    br.SplitBy = fibSplit[ splitCt ];
    //  UPDATE Split counter
    splitCt++;
    
    int oldSz = br.BranchWidth;
    
    // debug
    text( br.BranchWidth, random(width), height-42 );
    
    
    int pX, pY;  // parent X & Y , split point
    bebeKIDS = new ArrayList<PVector>();  // growing and growing
    
    //  shrink width
    br.BranchWidth = int( br.BranchWidth / this.SplitBy );

    //  grow kids    
    //  LOOP THROUGH OLD KIDS
    for( PVector pv : this.KIDS ) {
      
      //  TRANSITION FROM OLD SIZE TO NEW B4 THE NEW KIDS GET DRAWN
      strokeWeight( 1 );
      for( int sz = oldSz; sz > br.BranchWidth; sz -= 2 ) {
        
        stroke(#EF1975, 100);
        fill(br.BranchWidth, 100);
        rect(  pv.x, 
                  pv.y + br.SplitBy, 
                  sz, sz,
                  sz );
      }
      
      // position kids based on splitBy and parent X/Y
      splitX = br.BranchWidth/2;
      
      //  MAKE NEW KIDS OUT OF THE OLD KIDS
      for( int ct = 0; ct < br.SplitBy; ct++){
//        + (ct*br.SplitBy)
        bebeKIDS.add( new PVector(  pv.x - splitX - (ct*br.SplitBy)  ,
                                    pv.y + splitX + (ct*br.SplitBy) ) );

      }
      //  END MAKE KIDS
    }
    //  END LOOP OLD KIDS
    
    //  YOU'VE GOT NEW KIDS!
    this.KIDS.clear();
    this.KIDS = bebeKIDS;
  }

}

/***********************************************************************/ 
