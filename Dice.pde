int rows;
int cols;
int total;
int availHeight;
Die bob;
void setup()  
{
  size((int)(0.95*window.innerWidth), (int)(0.95*window.innerHeight));
  noLoop();
  textAlign(CENTER, BOTTOM);
  rectMode(RADIUS);
  rows=1;
  cols=1;
  total=0;
  availHeight=(int)(0.85*height);
}
void draw()  
{
  total=0;
  background(0,0,0);
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      if(floor(availHeight/(rows+1))<=floor(width/(cols+1))){
        bob=new Die((i+1)*width/(cols+1), (((j+1)*availHeight)/(rows+1)), (int)((0.45*((0.85*height)/(rows+1)))), 0);
      } else{
        bob=new Die((i+1)*width/(cols+1), (((j+1)*availHeight)/(rows+1)), (int)((0.45*(width/(cols+1)))), 0);
      }
      bob.roll();
      bob.show();
      total+=bob.myNum;
    }
  }
  textSize(height/25);
  fill(255,255,255);
  text(rows+"x"+cols+ " dice, adding up to " + total+"\n Average: "+(float)total/(rows*cols), width/2, (int)(0.95*height));
}
class Die // The Balloon object!
{
  int myX, myY, mySize, dotSize, myNum;
  Die(int x_,int y_, int size_, int num)
  {
    mySize = size_;
    myX = x_;
    myY = y_;
    dotSize = mySize/5;
    myNum=num;
  }

  void roll()
  {
    myNum = (int)(6*Math.random())+1;
  }

  void show()
  {
    fill(255, 255, 255);
    rect(myX, myY, mySize, mySize,mySize/2);
    
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
  redraw();
}
void keyPressed() {
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
}
