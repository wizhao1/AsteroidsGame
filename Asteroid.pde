class Asteroid extends Floater
{
	private int rotationSpeed;
    public Asteroid()
    {
    	corners = 5;  //the number of corners, a triangular floater has 3   
		xCorners = new int [corners];
		xCorners[0] = -8;
		xCorners[1] = 10;
		xCorners[2] = 16;
		xCorners[3] = 10;				 
		xCorners[4] = -8;				 			 
		yCorners = new int [corners];
		yCorners[0] = -8;
		yCorners[1] = -8;
		yCorners[2] = 0;   
		yCorners[3] = 8;   
		yCorners[4] = 8;   
		myColor = color(100,100,100);   
		myCenterX = 200;
		myCenterY = 200; //holds center coordinates   
		myDirectionX = (Math.random()*4)-2;
		myDirectionY = (Math.random()*4)-2; //holds x and y coordinates of the vector for direction of travel   
		myPointDirection = 0; //holds current direction the ship is pointing in degrees
		rotationSpeed = (int)(Math.random()*6)-3;
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

	public void move ()   //move the floater in the current direction of travel
  	{      
	    //change the x and y coordinates by myDirectionX and myDirectionY       
	    myCenterX += myDirectionX;    
	    myCenterY += myDirectionY;     

	    //rotating asteroid
		myPointDirection+=rotationSpeed;

	    //wrap around screen    
	    if(myCenterX >width)
	    {     
	      	myCenterX = 0;    
	    }    
	    else if (myCenterX<0)
	    {     
	      	myCenterX = width;    
	    }    
	    if(myCenterY >height)
	    {    
	      	myCenterY = 0;    
	    } 
	    
	    else if (myCenterY < 0)
	    {     
	      	myCenterY = height;    
	    }   
  	}   


}