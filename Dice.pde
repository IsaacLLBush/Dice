int Program = 1; //-1=coins, 1=dice

int rows;
int cols;
int total;
int availHeight;
String side;
Object bob;
void setup()  
{
  size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight));
  noLoop();
  rectMode(RADIUS);
  rows=1;
  cols=1;
  total=0;
  availHeight=(int)(0.85*height); //how much height the coin can take up
}
void draw()  
{
  total=0;
  background(0,0,0);
  for(int i = 0; i<cols; i++){ //draw the columns
    for(int j = 0; j<rows; j++){ //draw the rows
      if(floor(availHeight/(rows+1))<=floor(width/(cols+1))){
        bob=new Object((i+1)*width/(cols+1), (((j+1)*availHeight)/(rows+1)), (int)((0.45*((0.85*height)/(rows+1)))), 0); //the first term is giving me the x value, the second is the y value, and the third is a long equation to find the amount of height that the dice can take uo
      } else{
        bob=new Object((i+1)*width/(cols+1), (((j+1)*availHeight)/(rows+1)), (int)((0.45*(width/(cols+1)))), 0); //see above
      }
      bob.roll();
      bob.show();
      total+=bob.myNum;
    }
  }
  textSize(height/25);
  fill(255,255,255);
  textAlign(CENTER, BOTTOM);
  if (Program==-1) {
    text(rows+"x"+cols+ ". "+total+" heads (" + (float)(100.0*(float)total/(float)(rows*cols)) + "% heads) \nblue is heads, red is tails", width/2, (int)(0.95*height)); //say how many coins and what percentage are heads
  } else{
    text(rows+"x"+cols+ " dice, adding up to " + total+"\n Average: "+(float)total/(rows*cols), width/2, (int)(0.95*height)); //say how many coins and what percent are green
  }
}

class Object //The die/coins object!
{
  int myX, myY, mySize, dotSize, myNum;
  Object(int x_,int y_, int size_, int num)
  {
    mySize = size_;
    myX = x_;
    myY = y_;
    dotSize = mySize/5; //only used for the dice, but there's no harm in having it with the coins too, so I won't add an if statement around it.
    myNum=num;
  }
  void roll()
  {
    if(Program== -1){
      myNum = (int)(Math.random()+0.5); //either 1 or 0
    }
    else{
      myNum = (int)(6*Math.random())+1; //any int between 1 and 6 (inclusive)
    }
  }
  
  void show()
  {
    
    if(Program==-1){ //do the coins
      if(myNum==1){ //if heads, make it blue and say H
        side = "H";
        fill(100, 100, 255);
      }
      if(myNum==0){ //if tails, make it red and say T
        side = "T";
        fill(255, 100, 100);
      }
      ellipse((float)myX, (float)myY, 2*(float)mySize, 2*(float)mySize);
      
      fill(0,0,0);
      textSize((int)(mySize*1.5));
      textAlign(CENTER, CENTER);
      text(side, myX, myY);
    } else{ //do the die
      fill(255, 255, 255);
      rect(myX, myY, mySize, mySize,mySize/2);
      
      //draw the dots
      fill(0,0,0);
      if(myNum==1||myNum==5||myNum==3){ //dot in middle
        ellipse(myX,myY, dotSize, dotSize);
      }
      if(myNum==2||myNum==3||myNum==6){ //two dots in the middle "row"
        ellipse(myX-mySize/2,myY, dotSize, dotSize); 
        ellipse(myX+mySize/2,myY, dotSize, dotSize);
      }
      if(myNum==4||myNum==5||myNum==6){
        ellipse(myX-mySize/2,myY+mySize/2, dotSize, dotSize); //four dots on the corers
        ellipse(myX+mySize/2,myY+mySize/2, dotSize, dotSize);
        ellipse(myX-mySize/2,myY-mySize/2, dotSize, dotSize);
        ellipse(myX+mySize/2,myY-mySize/2, dotSize, dotSize);
      }
    }
  }
}
void mousePressed(){
  redraw();
  System.out.print("hello there!");
}
void keyPressed() { //grow/shrink the dice array
  if(keyCode==DOWN){
    rows+=1;
    redraw();
  }
  if(keyCode==UP&&rows>1){
    rows-=1;
    redraw();
  }
  if(keyCode==RIGHT){
    cols+=1;
    redraw();
  }
  if(keyCode==LEFT&&cols>1){
    cols-=1;
    redraw();
  }
  if(key==32) { //switch the type of program on space click
    Program=Program*-1;
    redraw();
  }
}
