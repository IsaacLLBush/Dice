  int rows;
  int cols;
  Die bob;
void setup()  
{
  size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight)); 
  noLoop();
  textAlign(CENTER, BOTTOM);
  rows=(int)(1+20*Math.random());
  cols=(int)(1+20*Math.random());
}
int total=0;
void draw()  
{
  background(0,0,0);
  rows=(int)(1+20*Math.random());
  cols=(int)(1+20*Math.random());
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      if(floor(0.4*(0.8*height/rows))<=floor(0.4*(width/cols))){
        bob=new Die((i+1)*width/(cols+1), floor(((j+1)*height/(rows+1))*(0.8)), floor((0.4*((0.8*height)/rows))), 0);
      } else{
        bob=new Die((i+1)*width/(cols+1), floor(((j+1)*height/(rows+1))*(0.8)), floor((0.4*(width/cols))), 0);
      }
      bob.roll();
      bob.show();
      total+=bob.myNum;
    }
  }
  textSize(height/25);
  fill(255,255,255);
  text("Total: "+ total+"\n Average: "+(float)total/(rows*cols), width/2, (int)(0.95*height));
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
