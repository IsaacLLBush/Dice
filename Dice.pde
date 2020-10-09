int rows;
int cols;
void setup()  
{
  size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight)); 
  noLoop();
  textAlign(CENTER, TOP);
  rows=height/100;
  cols=width/100;
}
int total=0;
void draw()  
{
  background(0,0,0);
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      Die bob=new Die((i+1)*width/(cols+1), (int)(((j+1)*height/(rows+1))*(0.8)), height/(3*rows), 0);
      bob.roll();
      bob.show();
      total+=bob.myNum;
    }
  }
  textSize(width/25);
  fill(255,255,255);
  text("Total: "+ total, width/2, 6.5*height/8);
  text("Average: "+(float)total/(rows*cols),width/2, 7*height/8);
}
class Die // The Balloon object!
{
  int myX, myY, mySize, dotSize, myNum;     // Delare member variables
  Die(int x_,int y_, int size_, int num)   // The Balloon Constructor Method!
  {                            // Initialize Member variables below
    mySize = size_;
    myX = x_;
    myY = y_;
    dotSize = mySize/5;
    myNum=num;
  }
                            // Inflate method 
  void roll()
  {
    myNum = (int)(6*Math.random())+1;
  }
                            // Show method 
  void show()
  {
    fill(255, 255, 255);
    rect(myX-mySize, myY-mySize, 2*mySize, 2*mySize,mySize/5);
    
    //dot in middle
    fill(0,0,0);
    if(myNum==1||myNum==5||myNum==3){
      ellipse(myX,myY, dotSize, dotSize);
    }
    if(myNum==2||myNum==3||myNum==6){
      ellipse(myX-mySize/2,myY, dotSize, dotSize);
      ellipse(myX+mySize/2,myY, dotSize, dotSize);
    }
    if(myNum==4||myNum==5||myNum==6){
      ellipse(myX-mySize/2,myY+mySize/2, dotSize, dotSize);
      ellipse(myX+mySize/2,myY+mySize/2, dotSize, dotSize);
      ellipse(myX-mySize/2,myY-mySize/2, dotSize, dotSize);
      ellipse(myX+mySize/2,myY-mySize/2, dotSize, dotSize);
    }
  }
}

void mousePressed(){
  total=0;
  redraw();
}
