class Bullet extends Floater
{
	Bullet(Spaceship theShip)
	{
		myCenterX = theShip.getX();
		myCenterY = theShip.getY();
		myPointDirection = theShip.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5* Math.cos(dRadians) + theShip.getDirectionX();
		myDirectionY = 5* Math.sin(dRadians) + theShip.getDirectionY();
		myColor = color(255);
	}

  public void setX(int x){};
  public double getX(){return myCenterX;};
  public void setY(int y){};
  public double getY(){return myCenterY;};
  public void setDirectionX(double x){};
  public double getDirectionX(){return myDirectionX;};
  public void setDirectionY(double y){};
  public double getDirectionY(){return myDirectionY;};
  public void setPointDirection(int degrees){};
  public double getPointDirection(){return myPointDirection;};

 public void show ()  //Draws the floater at the current position  
  {             
     fill(myColor);   
     stroke(myColor);    
    
    // //translate the (x,y) center of the ship to the correct position
    // translate((float)myCenterX, (float)myCenterY);

    // //convert degrees to radians for rotate()     
    // float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    // //rotate so that the polygon will be drawn in the correct direction
    // rotate(dRadians);
    
    //draw the polygon
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);

    // //"unrotate" and "untranslate" in reverse order
    // rotate(-1*dRadians);
    // translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }

   public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    

  }   

}