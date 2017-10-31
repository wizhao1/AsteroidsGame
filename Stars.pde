class Stars //note that this class does NOT extend Floater
{
  //your code here
  private int myX, myY;
  private int myColor;

  Stars()
  {
  	myX = (int)(Math.random()*400);
  	myY = (int)(Math.random()*400);
  	myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  public void show()
  {
  	stroke(myColor);
  	strokeWeight(5);
  	point(myX,myY);
  }
}
