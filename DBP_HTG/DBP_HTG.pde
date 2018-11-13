/*
DBP_HTG = Double Brother Programmer _ HTileGamer  : take an image and slice into a slide game

TODO: 

- DBP collab warmup exercise ( JBro is 40 )

- NOTE: diamond most isn't right

- this sketch is about to be scrapped

- run Salidas through PS actions, then bring back for dicing

*/

import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;
import fixlib.*;

/* ------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------- */
String SAVE_NAME = "thisShouldBeDynamic"; //  MC HAMMER
String SAVE_TYPE = ".png";  // ".tif";


//  NOTE: bgImgFile is now the currently loaded mainImg
// String bgImgFile = "yellow.png";  //  Background and final frame mask source

//  NOTE: This script now runs off of imgs[] to allow for multi-source image support
//  BG image is still static ATM
String[] imgs = { 
"dbl27.png",
"dbl21.png",
"dbl16.png",
"dbl5.png",
"dbl15.png",
"dbl19.png",
"dbl2.png",
"dbl12.png",
"dbl6.png",
"dbl18.png",
"dbl11.png",
"dbl17.png",
"dbl10.png",
"dbl13.png",
"dbl1.png",
"dbl29.png",
"dbl14.png",
"dbl8.png",
"dbl28.png",
"dbl23.png",
"dbl22.png",
"dbl20.png",
"dbl26.png",
"dbl25.png",
"dbl3.png",
"dbl9.png",
"dbl24.png",
"dbl4.png",
"dbl7.png"
  };


boolean saveFrame = true;
boolean saveLast = true; // NOTE: this switch is hit or miss depending on your source image.
boolean stroke = false;	//	stroke the box

//  MODES
  // boolean p5Filters = false;
  // boolean rotateTiles = false;

  boolean p5Filters = false;
  boolean rotateTiles = true;


  // boolean p5Filters = true;
  // boolean rotateTiles = false;


  // boolean p5Filters = true;
  // boolean rotateTiles = true;
//  END MODES

  //  NOTE : each of these rotate vars require rotateTiles = true

boolean diamond = false;


boolean rotateX = false;  // Rotates each tile's X axis
boolean rotateY = false;  // Rotates each tile's Y axis
boolean rotateZ = false;  // Rotates each tile's Z axis


int frmCt = 1;//  2, 4, 8, 16  //7;  //  NOTE: saving starts @ 0.  7 gets you 8 frames and 1 FINAL
int colCt = 8;//  2, 4, 8, 16
int colSpacing = 0;

/* ------------------------------------------------------------------------- */
boolean dOffset = false;  // helper for diamond mode
int rowCt = colCt;  //  Maintains even 1:1 grid
int drawW, drawH, gridX, gridY; // slice dimensions, grid position
PImage mainImg, bgImg, tmpSlice;

Fixlib fix = Fixlib.init(this);
HDrawablePool pool;
HImage tmpImg, bgHImg;  //  background image reference

HShape hShp;
PShape pShp;
HBox tmpBox;

int imgIdx = 0;
color sClr;
/* ------------------------------------------------------------------------- */

void  settings ()  {
    //  For best results, change size() to match dimensions of mainImgFile
    size(1600, 1600, P3D);
    smooth(8);  //  smooth() can only be used in settings();
    pixelDensity(displayDensity());
}

/* ------------------------------------------------------------------------- */

void setup() {

  //  init VARIABLES
  if(diamond)
  {
    //  SQUARE BOXES
    drawW = (int)( (width/rowCt)-colSpacing);
    drawH = drawW;

    gridX = 0;
    gridY = 0;

    // colSpacing = (int)(drawW/PI);

  } else {
    drawW = (int)( (width/colCt)-colSpacing);
    drawH = (int)( (height/rowCt)-colSpacing);  

	  gridX = drawW/2;
	  gridY = drawW/2;  
  }


  mainImg = loadImage( imgs[imgIdx] );
  bgImg = loadImage( imgs[imgIdx] );  //  force load

  //  Generate filename containing sketch settings meta NOW
  //  NOTE: SUB STATEMENTS PAST rotateTiles
  SAVE_NAME = imgs[imgIdx] + "" +colCt+"x"+colSpacing + (p5Filters ? "P5F": "" )+ (rotateTiles ? "ROTA" + 
               (rotateX ? "rX": "" ) + (rotateY ? "rY": "" ) + (rotateZ ? "rZ": "" ) : "" ) +  ( diamond ? "DMND": "" ) ;

  //  init HYPE
  H.init(this).background(-1).use3D(true).autoClear(true);
  
  //  BACKGROUND IMAGE
  bgHImg = new HImage( bgImg );
  bgHImg.anchorAt(H.CENTER).loc(width/2, height/2);
  H.add(bgHImg);
  
    //  NOTE : DO NOT USE bgImg anywhere past this line.  Use bgHImg instead
    bgImg = null;

  pool = new HDrawablePool(colCt*rowCt);
  pool.autoAddToStage();

  //  SLICE IT UP

  //  OUTER ROW LOOP ( t - b ) 
  for( int row = 0; row < rowCt; row++)
  {
    //  INNER COLUMN LOOP ( l-r )  
    for( int col = 0; col < colCt; col++)
    {
      //  get image slice
      tmpImg = new HImage( mainImg.get( (drawW*col), (drawH*row), drawW, drawH) );
      tmpImg.anchorAt(H.CENTER);
      
      //  create box to hold slice
      tmpBox = new HBox();
      tmpBox.width(drawW).height(drawH);//.z(row+col);
		
		if(p5Filters)
	    {
	      tmpBox.depth( random( -drawW, drawW ) + ( TWO_PI * (colSpacing+colCt+col+row) ) );
	    }
	    else 
	    {
	      tmpBox.depth( drawH );      
	    }

        if(stroke)
        {
          //  Grab color from the current tmpImg
          sClr = mainImg.get( (drawW*col), (drawH*row) );
          //  stroke it
          tmpBox.stroke( sClr );
          tmpBox.strokeWeight(PI);
        }
        else 
        {
        	tmpBox.noStroke();
        }


      //  APPLY Texture here
      if(p5Filters)
      {
        tmpBox.textureBottom( tmpImg.image() );
          tmpImg.image().filter(INVERT);
        tmpBox.textureTop( tmpImg.image() );
			tmpImg.image().filter(OPAQUE);
        tmpBox.textureFront( tmpImg.image() );


        tmpBox.textureLeft( bgHImg.image() );
			bgHImg.image().filter(OPAQUE);
        tmpBox.textureRight( bgHImg.image() );
        tmpBox.textureBack( bgHImg.image() );

      } else {

      //  assign HBox texture
      tmpBox.texture(tmpImg.image());
        
      }


      //  drop it in the pool
      pool.add( tmpBox );
    }
  }


  pool
      .layout (
        new HGridLayout()
        .startLoc(gridX, gridY)
        .spacing( drawW+colSpacing, drawH+colSpacing, colSpacing )
        .cols(colCt)
        .rows(rowCt)
      )


      .onCreate(
         new HCallback() {
          public void run(Object obj) {
           
           tmpBox = (HBox) obj;

          // diamond row off setter
          if( (pool.currentIndex()>colCt) &&  pool.currentIndex()%colCt==0){
            dOffset = !dOffset;
          }

        if(diamond){


          tmpBox
              .rotationX(45)
              .rotationY(45);

              if(dOffset){
                tmpBox.x( tmpBox.x() + (drawW/2) );
              }

        } else if(rotateTiles){

              //  general rotation
              if( !rotateX && !rotateY && !rotateZ ){
                tmpBox.rotation( 90* pool.currentIndex() );
              }

              //  individual axis rotations
              if(rotateX) tmpBox.rotationX( 90 * pool.currentIndex() );
              if(rotateY) tmpBox.rotationY( 90 * pool.currentIndex() );
              if(rotateZ) tmpBox.rotationZ( 90 * pool.currentIndex() );

            }


          }
         }
        );

}





/* ------------------------------------------------------------------------- */
void draw() {

  // Bernard Purdie would shuffle it
  // pool.shuffleRequestAll();
  pool.requestAll();

  //  rotate obj already known by HYPE
  bgHImg.rotateZ( (frameCount+1)*90);

  
  if(p5Filters)
  {
    // NOTE: this section is kind of ok, not super dope

    ortho();
    rotateX(HALF_PI/PI);
    // rotateY(-HALF_PI/PI);


  } else {
    perspective();
  }

  H.drawStage();

  //  save frame
  if(saveFrame){
    stampAndSave(false);
    saveFrame( SAVE_NAME + "##"+SAVE_TYPE);  //  USE .TIF IF COLOR
  }

  pool.drain();

  //  Move to next image every time frameCount HITS the "(frmCt)"th mark
  if(frameCount%frmCt==0) {

    perspective();

    //  FINAL FRAME
    //  Grab images, do some magic, clear stage, slap down final frame

    //  get stage
    tmpSlice = null;
    tmpSlice = get(0,0, width,height);
    

    //  resize for masking
    mainImg.resize(width,height);
    bgHImg.image().resize(width,height);
    tmpSlice.resize(width,height);

    try{

// TODO: GET MASKING CODE WORKING  
  mainImg.filter(INVERT);
  mainImg.filter(OPAQUE);

//  FINAL FRAME IS PRETTY SKETCH ATM

        //  MASK
        tmpSlice.mask(bgHImg.image());
        tmpSlice.mask(mainImg);

    }catch(Exception exc ){
      println("EXCEPTION: "+ exc.getMessage());
    }

    //  give it back to HYPE
    H.add(new HImage(tmpSlice));
    H.clearStage();

    //  NO grid, just the final frame image
    H.drawStage();
    stampAndSave(saveLast);


    if(imgIdx < imgs.length-1 )
    {
      imgIdx++;

      //  fully reset stage before calling setup()
      H.remove(bgHImg);
      H.clearStage();

      mainImg = null;
      bgImg = null;
      tmpSlice = null;

      setup();
    }
    else
    {
      doExit();
    }

  }
}







/* ------------------------------------------------------------------------- */
/*  NON - P5 BELOW  */
/* ------------------------------------------------------------------------- */

/**
  End of sketch closer
*/
void stampAndSave(boolean saveFinal){
  String msg = "ERICFICKES.COM";

  textFont( createFont("Bitwise", 43));

  // sClr = get( width/2, height/2 );
  // //  fill color from image
  // fill( sClr );
  fill( #242424 );

  textSize(36);
  //  OG BOTTOM RIGHT STAMP
  //text(msg, width-(textWidth(msg)+textAscent())+24, height-textAscent()+24);
  //  NEW RIGHT VERTICAL STAMP
  textAlign(CENTER,BOTTOM);
  pushMatrix();
    translate(width-TWO_PI, (height/2));
    rotate(-HALF_PI);
    text(msg,0,0);
  popMatrix();



  if(saveFinal) save( SAVE_NAME+"_FNL"+SAVE_TYPE );    //  USE .TIF IF COLOR  
}


void doExit(){
    //  cleanup
  fix = null;
  
  noLoop();
  exit();
  System.gc();
  System.exit(1);
}