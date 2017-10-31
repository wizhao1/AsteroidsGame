class Spaceship extends Floater  
{   
    //your code here
    private boolean myAccelerating;
    public Spaceship()
    {
    	corners = 3;  //the number of corners, a triangular floater has 3   
		xCorners = new int [corners];
		xCorners[0] = -8;
		xCorners[1] = 16;
		xCorners[2] = -8;				 
		yCorners = new int [corners];
		yCorners[0] = -8;
		yCorners[1] = 0;
		yCorners[2] = 8;   
		myColor = color(100,100,255);   
		myCenterX = 200;
		myCenterY = 200; //holds center coordinates   
		myDirectionX = 0;
		myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
		myPointDirection = 0; //holds current direction the ship is pointing in degrees    
    	myAccelerating = false;
    }
	public void setX(int x){myCenterX = x;};  
	public double getX(){return myCenterX;};   
	public void setY(int y){myCenterY = y;};   
	public double getY(){return myCenterY;};   
	public void setDirectionX(double x){myDirectionX = x;};   
	public double getDirectionX(){return myDirectionX;};   
	public void setDirectionY(double y){myDirectionY = y;};   
	public double getDirectionY(){return myDirectionY;};   
	public void setPointDirection(int degrees){myPointDirection = degrees;};   
	public double getPointDirection(){return myPointDirection;}; 
  	public void setAccelerating(boolean x) {myAccelerating = x;};
  	public boolean getAccelerating(){return myAccelerating;};

	public void show ()  //Draws the floater at the current position  
	  	{             
	    	fill(myColor);   
	    	stroke(myColor);    
	    
	    	//translate the (x,y) center of the ship to the correct position
	    	translate((float)myCenterX, (float)myCenterY);

		    //convert degrees to radians for rotate()     
		    float dRadians = (float)(myPointDirection*(Math.PI/180));
		    
		    //rotate so that the polygon will be drawn in the correct direction
		    rotate(dRadians);
		    
		    //draw the polygon
		    beginShape();
		    for (int nI = 0; nI < corners; nI++)
		    {
		      	vertex(xCorners[nI], yCorners[nI]);
		    }
		    endShape(CLOSE);

			if(myAccelerating == true)
			{
				line(-20,-10,-30,-20);
				line(-20,0,-30,0);
				line(-20,10,-30,20);
			}


		    //"unrotate" and "untranslate" in reverse order
		    rotate(-1*dRadians);
		    translate(-1*(float)myCenterX, -1*(float)myCenterY);
	  }   














}
