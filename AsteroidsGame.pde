//your variable declarations here
boolean shipForward = false;
boolean shipLeft = false;
boolean shipRight = false;

Spaceship ship = new Spaceship();
Stars [] universe = new Stars[(int)(Math.random()*50+20)];
Asteroid [] asteroidField = new Asteroid[10];
public void setup() 
{
  //your code here
	size(400,400);
	for(int i=0; i<universe.length; i++)
	{
  		universe[i] = new Stars();
  	}

	for(int i=0; i<asteroidField.length; i++)
	{
  		asteroidField[i] = new Asteroid();
		asteroidField[i].setX((int)(Math.random()*400));
		asteroidField[i].setY((int)(Math.random()*400));
  	}

}
public void draw() 
{
  //your code here
 	background(0);

 	for(int i=0; i<universe.length; i++)
	{
 	 	universe[i].show();
 	}

	for(int i=0; i<asteroidField.length; i++)
	{
  		asteroidField[i].show();
  		asteroidField[i].move();
  	}
 	ship.show();
  	ship.move();

	if(shipForward == true) {ship.accelerate(0.1);}
  	if(shipLeft == true) {ship.turn(-5);}
  	if(shipRight == true) {ship.turn(5);}


}

public void keyPressed()
{
	if(key == 'w')
	{
		shipForward = true;
		ship.setAccelerating(true);

	}
	if(key == 'a'){shipLeft = true;}
	if(key == 'd'){shipRight = true;}
	if(key == ' ')
	{
		ship.setX((int)(Math.random()*300)+50);
		ship.setY((int)(Math.random()*300)+50);		
		ship.setDirectionX(0);
   		ship.setDirectionY(0);
  		ship.setPointDirection((int)(Math.random()*360)); 
  	}

}

public void keyReleased()
{
	if(key == 'w')
		{
			shipForward = false;
			ship.setAccelerating(false);

		}
	if(key == 'a'){shipLeft = false;}
	if(key == 'd'){shipRight = false;}



}