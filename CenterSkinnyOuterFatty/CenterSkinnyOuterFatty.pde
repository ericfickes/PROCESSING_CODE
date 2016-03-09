//
//  This is a PRocessing sketch
//
Boolean isFinal = true;
float alf = 22, varNum = 1;

int cX;
int cY;

//color[] palette = { #EF0000, #00EF00, #0000EF, #CECE00, #FA7680, #EF1975, #007007, #EFEF00, #FA9187, #007007, #109109 };
ArrayList palette = new ArrayList();//{ #EF0000, #00EF00, #0000EF, #CECE00, #FA7680, #EF1975, #007007, #EFEF00, #FA9187, #007007, #109109 };

//  HAKCY : two collections from the from and to points in a LINE
ArrayList<PVector> _from = new ArrayList<PVector>();
ArrayList<PVector> _to = new ArrayList<PVector>();

FixLib fix = new FixLib();

////////////////////////////////////////////////////
//
void setup() {
  // setup core sketch settings items
  size(1024, 768);
  frameRate(303);
  background(#203712);
  stroke(255);

  //  setup variables
  cX = width/2;
  cY = height/2;
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
}





////////////////////////////////////////////////////
//
void draw()
{
  if( mousePressed ) {
    smooth();

    varNum = constrain( (mouseX-mouseY) - (cX-cY), .75, cY-alf );
    strokeWeight( varNum );

    stroke( varNum<cX ? 255 : random(75) );
    fill( varNum<cX ? 0 : 255 );
    line( pmouseX, pmouseY, mouseX, mouseY ); 

    fill( varNum<cX ? 255 : 0 , alf);
    stroke( varNum<cX ? 0 : 255, alf);
    ellipse( pmouseX, pmouseY, varNum, varNum );
    


    //  persist points
    _from.add( new PVector( pmouseX, pmouseY ) );
    _to.add( new PVector( mouseX, mouseY ) );
  }

  if( frameCount > width+height ) {
    
    //  HACKY : Dump vectors to text file
//      String[] lines = new String[ _from.size() + 5]; // keep this number in sync with the EXTRA number of lines you're adding in addition to the DOTS
//      int linesXX = 1;
//      String msg = "";
//      fill(0,0,0);
//
//      lines[0] = "size( 1024, 768 );";
//      lines[1] = "background(255);";
//      lines[2] = "void  doit() { ";
//      lines[3] = "  stroke(random(255), alf); smooth();";
//
//      int xx = 0;
//      while( xx < _from.size() ) {
//        msg = "line( pmouseX-"+((PVector)_from.get(xx)).x+", pmouseY-"+((PVector)_from.get(xx)).y+", cX+"+((PVector)_to.get(xx)).x+", cY+"+((PVector)_to.get(xx)).y+" );";
//        lines[4+xx] = msg;
//        xx++;
//      }
//      lines[ lines.length-1 ] = " }";

//      msg = "endShape(CLOSE);";
//      text( msg, 50, 125+((xx-1)*25) );
//      lines[_pvectors.size()+3] = msg;
      
//      msg = "text(\"...this was drawn with ClickDotHitEnter\", this.width-500, this.height-200);";
//      text( msg, 50, 150+((xx-1)*25) );
//      lines[_pvectors.size()+4] = msg;

      // write to file
//      Date d = new Date();
//      long current=d.getTime()/1000;
//      saveStrings("out"+current+".txt", lines);
    //  END VECTOR DUMP
    
    
    
    exit();
  }
}



///////////////////////////////////////////////////////////
//  End handler, saves png
void exit() 
{

  artDaily("ERICFICKES.COM");

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + "-" + fix.getTimestamp()+".png" );
  }

  noLoop();
  System.gc();
  super.stop();
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "Silom", 18 ) );
  smooth();

  fill(#EFEFEF);
  text( " "+dailyMsg, this.width-430, this.height-14);
}


////////////////////
//  PASTE ZONE
////////////////////
void  doit() { 
  stroke(random(255), alf); smooth();
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+232.0, cY+44.0 );
line( pmouseX-232.0, pmouseY-44.0, cX+230.0, cY+49.0 );
line( pmouseX-230.0, pmouseY-49.0, cX+228.0, cY+52.0 );
line( pmouseX-228.0, pmouseY-52.0, cX+226.0, cY+54.0 );
line( pmouseX-226.0, pmouseY-54.0, cX+222.0, cY+59.0 );
line( pmouseX-222.0, pmouseY-59.0, cX+214.0, cY+65.0 );
line( pmouseX-214.0, pmouseY-65.0, cX+211.0, cY+68.0 );
line( pmouseX-211.0, pmouseY-68.0, cX+211.0, cY+68.0 );
line( pmouseX-211.0, pmouseY-68.0, cX+208.0, cY+73.0 );
line( pmouseX-208.0, pmouseY-73.0, cX+204.0, cY+77.0 );
line( pmouseX-204.0, pmouseY-77.0, cX+194.0, cY+84.0 );
line( pmouseX-194.0, pmouseY-84.0, cX+190.0, cY+88.0 );
line( pmouseX-190.0, pmouseY-88.0, cX+183.0, cY+97.0 );
line( pmouseX-183.0, pmouseY-97.0, cX+179.0, cY+99.0 );
line( pmouseX-179.0, pmouseY-99.0, cX+175.0, cY+102.0 );
line( pmouseX-175.0, pmouseY-102.0, cX+170.0, cY+106.0 );
line( pmouseX-170.0, pmouseY-106.0, cX+167.0, cY+109.0 );
line( pmouseX-167.0, pmouseY-109.0, cX+164.0, cY+113.0 );
line( pmouseX-164.0, pmouseY-113.0, cX+159.0, cY+119.0 );
line( pmouseX-159.0, pmouseY-119.0, cX+157.0, cY+121.0 );
line( pmouseX-157.0, pmouseY-121.0, cX+155.0, cY+124.0 );
line( pmouseX-155.0, pmouseY-124.0, cX+153.0, cY+126.0 );
line( pmouseX-153.0, pmouseY-126.0, cX+151.0, cY+129.0 );
line( pmouseX-151.0, pmouseY-129.0, cX+149.0, cY+131.0 );
line( pmouseX-149.0, pmouseY-131.0, cX+147.0, cY+133.0 );
line( pmouseX-147.0, pmouseY-133.0, cX+146.0, cY+134.0 );
line( pmouseX-146.0, pmouseY-134.0, cX+144.0, cY+136.0 );
line( pmouseX-144.0, pmouseY-136.0, cX+142.0, cY+138.0 );
line( pmouseX-142.0, pmouseY-138.0, cX+141.0, cY+140.0 );
line( pmouseX-141.0, pmouseY-140.0, cX+140.0, cY+141.0 );
line( pmouseX-140.0, pmouseY-141.0, cX+139.0, cY+142.0 );
line( pmouseX-139.0, pmouseY-142.0, cX+137.0, cY+142.0 );
line( pmouseX-137.0, pmouseY-142.0, cX+137.0, cY+143.0 );
line( pmouseX-137.0, pmouseY-143.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+137.0, cY+145.0 );
line( pmouseX-137.0, pmouseY-145.0, cX+139.0, cY+145.0 );
line( pmouseX-139.0, pmouseY-145.0, cX+143.0, cY+146.0 );
line( pmouseX-143.0, pmouseY-146.0, cX+149.0, cY+148.0 );
line( pmouseX-149.0, pmouseY-148.0, cX+154.0, cY+150.0 );
line( pmouseX-154.0, pmouseY-150.0, cX+160.0, cY+152.0 );
line( pmouseX-160.0, pmouseY-152.0, cX+170.0, cY+156.0 );
line( pmouseX-170.0, pmouseY-156.0, cX+175.0, cY+158.0 );
line( pmouseX-175.0, pmouseY-158.0, cX+192.0, cY+163.0 );
line( pmouseX-192.0, pmouseY-163.0, cX+199.0, cY+165.0 );
line( pmouseX-199.0, pmouseY-165.0, cX+204.0, cY+166.0 );
line( pmouseX-204.0, pmouseY-166.0, cX+210.0, cY+168.0 );
line( pmouseX-210.0, pmouseY-168.0, cX+216.0, cY+169.0 );
line( pmouseX-216.0, pmouseY-169.0, cX+220.0, cY+171.0 );
line( pmouseX-220.0, pmouseY-171.0, cX+224.0, cY+173.0 );
line( pmouseX-224.0, pmouseY-173.0, cX+228.0, cY+175.0 );
line( pmouseX-228.0, pmouseY-175.0, cX+231.0, cY+176.0 );
line( pmouseX-231.0, pmouseY-176.0, cX+234.0, cY+179.0 );
line( pmouseX-234.0, pmouseY-179.0, cX+238.0, cY+180.0 );
line( pmouseX-238.0, pmouseY-180.0, cX+241.0, cY+182.0 );
line( pmouseX-241.0, pmouseY-182.0, cX+244.0, cY+183.0 );
line( pmouseX-244.0, pmouseY-183.0, cX+247.0, cY+184.0 );
line( pmouseX-247.0, pmouseY-184.0, cX+252.0, cY+187.0 );
line( pmouseX-252.0, pmouseY-187.0, cX+260.0, cY+190.0 );
line( pmouseX-260.0, pmouseY-190.0, cX+264.0, cY+192.0 );
line( pmouseX-264.0, pmouseY-192.0, cX+267.0, cY+195.0 );
line( pmouseX-267.0, pmouseY-195.0, cX+270.0, cY+196.0 );
line( pmouseX-270.0, pmouseY-196.0, cX+271.0, cY+197.0 );
line( pmouseX-271.0, pmouseY-197.0, cX+271.0, cY+197.0 );
line( pmouseX-271.0, pmouseY-197.0, cX+272.0, cY+197.0 );
line( pmouseX-272.0, pmouseY-197.0, cX+273.0, cY+197.0 );
line( pmouseX-273.0, pmouseY-197.0, cX+273.0, cY+197.0 );
line( pmouseX-273.0, pmouseY-197.0, cX+273.0, cY+197.0 );
line( pmouseX-273.0, pmouseY-197.0, cX+273.0, cY+197.0 );
line( pmouseX-273.0, pmouseY-197.0, cX+274.0, cY+197.0 );
line( pmouseX-274.0, pmouseY-197.0, cX+274.0, cY+197.0 );
line( pmouseX-274.0, pmouseY-197.0, cX+275.0, cY+197.0 );
line( pmouseX-275.0, pmouseY-197.0, cX+277.0, cY+198.0 );
line( pmouseX-277.0, pmouseY-198.0, cX+277.0, cY+198.0 );
line( pmouseX-277.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+278.0, cY+198.0 );
line( pmouseX-278.0, pmouseY-198.0, cX+277.0, cY+198.0 );
line( pmouseX-277.0, pmouseY-198.0, cX+274.0, cY+201.0 );
line( pmouseX-274.0, pmouseY-201.0, cX+267.0, cY+206.0 );
line( pmouseX-267.0, pmouseY-206.0, cX+264.0, cY+210.0 );
line( pmouseX-264.0, pmouseY-210.0, cX+260.0, cY+214.0 );
line( pmouseX-260.0, pmouseY-214.0, cX+256.0, cY+217.0 );
line( pmouseX-256.0, pmouseY-217.0, cX+247.0, cY+224.0 );
line( pmouseX-247.0, pmouseY-224.0, cX+242.0, cY+228.0 );
line( pmouseX-242.0, pmouseY-228.0, cX+237.0, cY+233.0 );
line( pmouseX-237.0, pmouseY-233.0, cX+230.0, cY+237.0 );
line( pmouseX-230.0, pmouseY-237.0, cX+225.0, cY+242.0 );
line( pmouseX-225.0, pmouseY-242.0, cX+220.0, cY+246.0 );
line( pmouseX-220.0, pmouseY-246.0, cX+213.0, cY+251.0 );
line( pmouseX-213.0, pmouseY-251.0, cX+206.0, cY+257.0 );
line( pmouseX-206.0, pmouseY-257.0, cX+199.0, cY+263.0 );
line( pmouseX-199.0, pmouseY-263.0, cX+194.0, cY+266.0 );
line( pmouseX-194.0, pmouseY-266.0, cX+182.0, cY+275.0 );
line( pmouseX-182.0, pmouseY-275.0, cX+177.0, cY+279.0 );
line( pmouseX-177.0, pmouseY-279.0, cX+172.0, cY+283.0 );
line( pmouseX-172.0, pmouseY-283.0, cX+172.0, cY+283.0 );
line( pmouseX-172.0, pmouseY-283.0, cX+168.0, cY+287.0 );
line( pmouseX-168.0, pmouseY-287.0, cX+159.0, cY+294.0 );
line( pmouseX-159.0, pmouseY-294.0, cX+155.0, cY+300.0 );
line( pmouseX-155.0, pmouseY-300.0, cX+151.0, cY+304.0 );
line( pmouseX-151.0, pmouseY-304.0, cX+142.0, cY+312.0 );
line( pmouseX-142.0, pmouseY-312.0, cX+137.0, cY+315.0 );
line( pmouseX-137.0, pmouseY-315.0, cX+135.0, cY+318.0 );
line( pmouseX-135.0, pmouseY-318.0, cX+132.0, cY+321.0 );
line( pmouseX-132.0, pmouseY-321.0, cX+131.0, cY+321.0 );
line( pmouseX-131.0, pmouseY-321.0, cX+130.0, cY+323.0 );
line( pmouseX-130.0, pmouseY-323.0, cX+128.0, cY+324.0 );
line( pmouseX-128.0, pmouseY-324.0, cX+127.0, cY+326.0 );
line( pmouseX-127.0, pmouseY-326.0, cX+126.0, cY+327.0 );
line( pmouseX-126.0, pmouseY-327.0, cX+126.0, cY+329.0 );
line( pmouseX-126.0, pmouseY-329.0, cX+126.0, cY+329.0 );
line( pmouseX-126.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+125.0, cY+329.0 );
line( pmouseX-125.0, pmouseY-329.0, cX+131.0, cY+331.0 );
line( pmouseX-131.0, pmouseY-331.0, cX+135.0, cY+334.0 );
line( pmouseX-135.0, pmouseY-334.0, cX+140.0, cY+337.0 );
line( pmouseX-140.0, pmouseY-337.0, cX+146.0, cY+340.0 );
line( pmouseX-146.0, pmouseY-340.0, cX+152.0, cY+343.0 );
line( pmouseX-152.0, pmouseY-343.0, cX+159.0, cY+347.0 );
line( pmouseX-159.0, pmouseY-347.0, cX+164.0, cY+350.0 );
line( pmouseX-164.0, pmouseY-350.0, cX+171.0, cY+354.0 );
line( pmouseX-171.0, pmouseY-354.0, cX+180.0, cY+361.0 );
line( pmouseX-180.0, pmouseY-361.0, cX+187.0, cY+367.0 );
line( pmouseX-187.0, pmouseY-367.0, cX+206.0, cY+379.0 );
line( pmouseX-206.0, pmouseY-379.0, cX+215.0, cY+385.0 );
line( pmouseX-215.0, pmouseY-385.0, cX+223.0, cY+391.0 );
line( pmouseX-223.0, pmouseY-391.0, cX+229.0, cY+394.0 );
line( pmouseX-229.0, pmouseY-394.0, cX+237.0, cY+398.0 );
line( pmouseX-237.0, pmouseY-398.0, cX+243.0, cY+401.0 );
line( pmouseX-243.0, pmouseY-401.0, cX+251.0, cY+404.0 );
line( pmouseX-251.0, pmouseY-404.0, cX+258.0, cY+407.0 );
line( pmouseX-258.0, pmouseY-407.0, cX+263.0, cY+410.0 );
line( pmouseX-263.0, pmouseY-410.0, cX+271.0, cY+413.0 );
line( pmouseX-271.0, pmouseY-413.0, cX+284.0, cY+421.0 );
line( pmouseX-284.0, pmouseY-421.0, cX+284.0, cY+421.0 );
line( pmouseX-284.0, pmouseY-421.0, cX+297.0, cY+430.0 );
line( pmouseX-297.0, pmouseY-430.0, cX+302.0, cY+432.0 );
line( pmouseX-302.0, pmouseY-432.0, cX+307.0, cY+434.0 );
line( pmouseX-307.0, pmouseY-434.0, cX+311.0, cY+435.0 );
line( pmouseX-311.0, pmouseY-435.0, cX+313.0, cY+437.0 );
line( pmouseX-313.0, pmouseY-437.0, cX+314.0, cY+437.0 );
line( pmouseX-314.0, pmouseY-437.0, cX+315.0, cY+437.0 );
line( pmouseX-315.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+437.0 );
line( pmouseX-316.0, pmouseY-437.0, cX+316.0, cY+435.0 );
line( pmouseX-316.0, pmouseY-435.0, cX+316.0, cY+427.0 );
line( pmouseX-316.0, pmouseY-427.0, cX+316.0, cY+421.0 );
line( pmouseX-316.0, pmouseY-421.0, cX+314.0, cY+414.0 );
line( pmouseX-314.0, pmouseY-414.0, cX+311.0, cY+402.0 );
line( pmouseX-311.0, pmouseY-402.0, cX+309.0, cY+394.0 );
line( pmouseX-309.0, pmouseY-394.0, cX+309.0, cY+394.0 );
line( pmouseX-309.0, pmouseY-394.0, cX+302.0, cY+370.0 );
line( pmouseX-302.0, pmouseY-370.0, cX+302.0, cY+370.0 );
line( pmouseX-302.0, pmouseY-370.0, cX+296.0, cY+337.0 );
line( pmouseX-296.0, pmouseY-337.0, cX+295.0, cY+328.0 );
line( pmouseX-295.0, pmouseY-328.0, cX+293.0, cY+322.0 );
line( pmouseX-293.0, pmouseY-322.0, cX+293.0, cY+319.0 );
line( pmouseX-293.0, pmouseY-319.0, cX+291.0, cY+316.0 );
line( pmouseX-291.0, pmouseY-316.0, cX+288.0, cY+302.0 );
line( pmouseX-288.0, pmouseY-302.0, cX+285.0, cY+289.0 );
line( pmouseX-285.0, pmouseY-289.0, cX+282.0, cY+273.0 );
line( pmouseX-282.0, pmouseY-273.0, cX+282.0, cY+271.0 );
line( pmouseX-282.0, pmouseY-271.0, cX+280.0, cY+256.0 );
line( pmouseX-280.0, pmouseY-256.0, cX+277.0, cY+247.0 );
line( pmouseX-277.0, pmouseY-247.0, cX+273.0, cY+230.0 );
line( pmouseX-273.0, pmouseY-230.0, cX+270.0, cY+218.0 );
line( pmouseX-270.0, pmouseY-218.0, cX+270.0, cY+211.0 );
line( pmouseX-270.0, pmouseY-211.0, cX+269.0, cY+202.0 );
line( pmouseX-269.0, pmouseY-202.0, cX+267.0, cY+190.0 );
line( pmouseX-267.0, pmouseY-190.0, cX+265.0, cY+183.0 );
line( pmouseX-265.0, pmouseY-183.0, cX+265.0, cY+175.0 );
line( pmouseX-265.0, pmouseY-175.0, cX+263.0, cY+168.0 );
line( pmouseX-263.0, pmouseY-168.0, cX+262.0, cY+164.0 );
line( pmouseX-262.0, pmouseY-164.0, cX+261.0, cY+155.0 );
line( pmouseX-261.0, pmouseY-155.0, cX+259.0, cY+151.0 );
line( pmouseX-259.0, pmouseY-151.0, cX+259.0, cY+145.0 );
line( pmouseX-259.0, pmouseY-145.0, cX+258.0, cY+139.0 );
line( pmouseX-258.0, pmouseY-139.0, cX+257.0, cY+134.0 );
line( pmouseX-257.0, pmouseY-134.0, cX+257.0, cY+130.0 );
line( pmouseX-257.0, pmouseY-130.0, cX+257.0, cY+126.0 );
line( pmouseX-257.0, pmouseY-126.0, cX+257.0, cY+122.0 );
line( pmouseX-257.0, pmouseY-122.0, cX+255.0, cY+115.0 );
line( pmouseX-255.0, pmouseY-115.0, cX+255.0, cY+111.0 );
line( pmouseX-255.0, pmouseY-111.0, cX+255.0, cY+111.0 );
line( pmouseX-255.0, pmouseY-111.0, cX+255.0, cY+104.0 );
line( pmouseX-255.0, pmouseY-104.0, cX+255.0, cY+100.0 );
line( pmouseX-255.0, pmouseY-100.0, cX+255.0, cY+97.0 );
line( pmouseX-255.0, pmouseY-97.0, cX+254.0, cY+94.0 );
line( pmouseX-254.0, pmouseY-94.0, cX+254.0, cY+90.0 );
line( pmouseX-254.0, pmouseY-90.0, cX+253.0, cY+90.0 );
line( pmouseX-253.0, pmouseY-90.0, cX+253.0, cY+90.0 );
line( pmouseX-253.0, pmouseY-90.0, cX+253.0, cY+90.0 );
line( pmouseX-253.0, pmouseY-90.0, cX+253.0, cY+89.0 );
line( pmouseX-253.0, pmouseY-89.0, cX+253.0, cY+89.0 );
line( pmouseX-253.0, pmouseY-89.0, cX+253.0, cY+89.0 );
line( pmouseX-253.0, pmouseY-89.0, cX+253.0, cY+89.0 );
line( pmouseX-253.0, pmouseY-89.0, cX+252.0, cY+88.0 );
line( pmouseX-252.0, pmouseY-88.0, cX+252.0, cY+86.0 );
line( pmouseX-252.0, pmouseY-86.0, cX+250.0, cY+78.0 );
line( pmouseX-250.0, pmouseY-78.0, cX+246.0, cY+63.0 );
line( pmouseX-246.0, pmouseY-63.0, cX+244.0, cY+57.0 );
line( pmouseX-244.0, pmouseY-57.0, cX+243.0, cY+54.0 );
line( pmouseX-243.0, pmouseY-54.0, cX+243.0, cY+52.0 );
line( pmouseX-243.0, pmouseY-52.0, cX+243.0, cY+49.0 );
line( pmouseX-243.0, pmouseY-49.0, cX+243.0, cY+48.0 );
line( pmouseX-243.0, pmouseY-48.0, cX+243.0, cY+48.0 );
line( pmouseX-243.0, pmouseY-48.0, cX+243.0, cY+48.0 );
line( pmouseX-243.0, pmouseY-48.0, cX+243.0, cY+47.0 );
line( pmouseX-243.0, pmouseY-47.0, cX+243.0, cY+46.0 );
line( pmouseX-243.0, pmouseY-46.0, cX+243.0, cY+45.0 );
line( pmouseX-243.0, pmouseY-45.0, cX+243.0, cY+44.0 );
line( pmouseX-243.0, pmouseY-44.0, cX+242.0, cY+44.0 );
line( pmouseX-242.0, pmouseY-44.0, cX+242.0, cY+43.0 );
line( pmouseX-242.0, pmouseY-43.0, cX+242.0, cY+43.0 );
line( pmouseX-242.0, pmouseY-43.0, cX+242.0, cY+41.0 );
line( pmouseX-242.0, pmouseY-41.0, cX+239.0, cY+35.0 );
line( pmouseX-239.0, pmouseY-35.0, cX+238.0, cY+32.0 );
line( pmouseX-238.0, pmouseY-32.0, cX+238.0, cY+32.0 );
line( pmouseX-238.0, pmouseY-32.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+28.0 );
line( pmouseX-236.0, pmouseY-28.0, cX+236.0, cY+29.0 );
line( pmouseX-236.0, pmouseY-29.0, cX+236.0, cY+29.0 );
 }

