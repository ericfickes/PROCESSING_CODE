import nervoussystem.obj.*;
import fixlib.*;
Fixlib fix = Fixlib.init(this);
/*
AR2019 seed incubator sketch

seed: NEW shapeJuan shape generator for stamp shapes

* amp : ideal sizes TBD
* inc :  only work with 9, 10, 12 and 20 as the lisaJous incrementor value

*/

    int cX, cY;
    int ct = 0, w = 81;    //51;
    // int[] cts = { 9, 10, 12, 20 };  // instead of sequential, only stick to approved incrementors
    int[] cts = { 5, 6, 7, 9, 11, 13, 18, 20, 34, 30 };  // instead of sequential, only stick to approved incrementors
    int colCt = 1;
    PShape tmp = new PShape();
    int shapeX, shapeY;


    //  TODO: is there a smarter way to "get relative" when saving PNGs from a running PApplet?
    String OUT_TYPE = ".png";   // ".tif";
    String PNG_OUT = "";
    String msg = "ericfickes.com";


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public  void  settings ()  {
        // size(612, 460, P3D);
        size(1836, 1380, P3D);
        smooth(8);
        pixelDensity(displayDensity());
        sketchSmooth();
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public  void  setup ()  {

        setupStage();

        //  setup variables
        cX = width/2;
        cY = height/2;

        w = (int)(cY/colCt);

        ct = cts[0];
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public  void  draw ()  {
        background(255);
        noFill();

        shapeX = mouseX+0;
        shapeY = mouseY+0;

        tmp = shapeJuan(shapeX, shapeY, w, ct); 
        // translate(0,0,1);
        //  SHAPE1
        for(int rr = 0; rr < colCt; rr++ ){
            for(int cc = 0; cc < colCt; cc++ ){

                // if(rr==0 && cc == 0){
                //   fill(#EF1975);
                //   stroke(#EF1975);
                translate(cX, cY, 1);
                shape(tmp, w*cc, w*rr);
                //   // shape(tmp, 0,0);
                // }
                // else
                //   stroke(0);
// shape(createShape(SPHERE, w), w*cc, w*rr);
                

            }
        }
         
      ////  stamp bottom right based on textSize
      fill(#EFEFEF);
      textSize(75);
      msg = "(" + shapeX +"-"+ shapeY +"-"+ w +"-"+ ct + ")";
      //  OG BOTTOM RIGHT STAMP
      //text(msg, width-(textWidth(msg)+textAscent())+24, height-textAscent()+24);
      //  NEW RIGHT VERTICAL STAMP
      textAlign(CENTER,BOTTOM);
      pushMatrix();
        translate(width-TWO_PI, cY);
        rotate(-HALF_PI);
        text(msg,0,0);
      popMatrix();
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    void mouseClicked() {
        
        println( "(" + shapeX +"-"+ shapeY +"-"+ w +"-"+ ct + ")");
        
      ////  stamp bottom right based on textSize
      fill(0);
      textSize(75);
      msg = "(" + shapeX +"-"+ shapeY +"-"+ w +"-"+ ct + ")";
      //  OG BOTTOM RIGHT STAMP
      //text(msg, width-(textWidth(msg)+textAscent())+24, height-textAscent()+24);
      //  NEW RIGHT VERTICAL STAMP
      textAlign(CENTER,BOTTOM);
      pushMatrix();
        translate(width-TWO_PI, cY);
        rotate(-HALF_PI);
        text(msg,0,0);
      popMatrix();

        savePng();

        System.gc();
    }



    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public void keyPressed(){

        switch(keyCode){

            case ESC:{
                doExit();
            }
            break;

            //  GET A NEW INCREMENTOR
            case 'i':
            case 'I':
            {
                ct = cts[(int)random(cts.length)];

            }

            case 's':
            case 'S':
            {
                savePng();
            }
            break;
        }

    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * exit function
     */
    private void doExit(){
        noLoop();
        System.gc();
        exit();
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * SAVE PNG helper
     */
    void savePng(){
        save(  PNG_OUT + fix.pdeName() + shapeX +"-"+ shapeY +"-"+ w +"-"+ ct + OUT_TYPE);
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * Helper function to clear stage
     */
    private void setupStage() {

        //  reset stage
        background(-1);

        strokeCap(ROUND);
        strokeJoin(ROUND);
        strokeWeight(TWO_PI);

        noFill();

    }





    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     *  STILL NORMING
     * @param a X
     * @param b Y
     * @param amp "amplitude"
     * @param inc incrementor, "slicer of the max point count : typically 360/inc"
     * @return PShape
     */
    private PShape shapeJuan( float a, float b, float amp, int inc )
    {
        //  PROTOTYPING : trying to locate universal ideal INCrementor for lisajouss loop
        //  Ideal range is someplace between 1 and 36
        if( ( inc < 1 ) || ( inc > 36 ) ) {
            inc = 1;
        }

        PShape shp = createShape();
        shp.beginShape();

        float x, y;

        for ( int t = 0; t <= 90; t+=inc)  //  180 instead of 360?
        {
            //  NEW HOTNESS!
            // x = a - amp * cos((a * t * TWO_PI)/360);
            // y = b - amp * sin((b * t * TWO_PI)/360);
            // x = a - amp * cos((a * t * TWO_PI)/180);
            // y = b - amp * sin((b * t * TWO_PI)/180);
            x = amp * cos((a * t * TWO_PI)/180);
            y = amp * sin((b * t * TWO_PI)/180);

            //  Z mods INC
            // shp.vertex(x, y, t%inc);
            shp.vertex(x, y);
        }
        shp.endShape();

        return shp;
    }
