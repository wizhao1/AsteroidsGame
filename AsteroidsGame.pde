//your variable declarations here
boolean shipForward = false;
boolean shipLeft = false;
boolean shipRight = false;
boolean oneShot = false;


//old singular asteroid code
//Asteroid Bob = new Asteroid();

//old array of asteroid code
//Asteroid [] asteroidField = new Asteroid[10];

//old singular bullet code
//Bullet bill = new Bullet(ship);


Spaceship ship = new Spaceship();
Stars [] universe = new Stars[(int)(Math.random()*50+20)];
ArrayList <Asteroid> asteroidBelt = new ArrayList <Asteroid>();
ArrayList <Bullet> bulletCartridge = new ArrayList <Bullet>();



public void setup() 
{
  //your code here
  size(400,400);
	for(int i=0; i<universe.length; i++)
	{
    universe[i] = new Stars();
  }

// old create an array of asteroids code
// 	for(int i=0; i<asteroidField.length; i++)
// 	{
//     asteroidField[i] = new Asteroid();
//     asteroidField[i].setX((int)(Math.random()*400));
//     asteroidField[i].setY((int)(Math.random()*400));
//   }

//arraylist of asteroids
	for(int i=0; i<20; i++)
	{
		Asteroid newAsteroid = new Asteroid();
		newAsteroid.setY((int)(Math.random()*400));
		newAsteroid.setX((int)(Math.random()*400));

		asteroidBelt.add(newAsteroid);
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

// old make array of asteroids show and move code
//   for(int i=0; i<asteroidField.length; i++)
// 	{
//     asteroidField[i].show();
//     asteroidField[i].move();
//   }


//code to move and show asteroid
	for(int i=0; i<asteroidBelt.size(); i++)
	{
  	asteroidBelt.get(i).show();
  	asteroidBelt.get(i).move();

  	if(dist((float)asteroidBelt.get(i).getX(), (float)asteroidBelt.get(i).getY(), (float)ship.getX(), (float)ship.getY()) < 40 )
  	{
  		asteroidBelt.remove(i);
      break;
  	}

    for(int j = 0; j<bulletCartridge.size() - 1; j++)
		{
      if(dist((float)asteroidBelt.get(i).getX(), (float)asteroidBelt.get(i).getY(), (float)bulletCartridge.get(j).getX(), (float)bulletCartridge.get(j).getY()) < 35 )
        {
          asteroidBelt.remove(i);
          bulletCartridge.remove(j);

          if(Math.random() < .5)
          {
            Asteroid newAsteroid = new Asteroid();
            newAsteroid.setY((int)(Math.random()*400));
            newAsteroid.setX((int)(Math.random()*400));
            asteroidBelt.add(newAsteroid);
          }

          break;
		    }
    }
  }

//code to move and show bullet
	for(int i=0; i<bulletCartridge.size(); i++)
	{
  		bulletCartridge.get(i).show();
  		bulletCartridge.get(i).move();

  		if(bulletCartridge.get(i).getX() < 0)
  		{
  			bulletCartridge.remove(bulletCartridge.get(i));
        break;
  		}
  		if(bulletCartridge.get(i).getX() > width)
  		{
  			bulletCartridge.remove(bulletCartridge.get(i));
        break;
  		}
  		
  		if(bulletCartridge.get(i).getY() < 0)
  		{
  			bulletCartridge.remove(bulletCartridge.get(i));
        break;
  		}
  		if(bulletCartridge.get(i).getY() > height)
  		{
  			bulletCartridge.remove(bulletCartridge.get(i));
        break;
  		}
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

  	//arraylist of bullets
	if(key == 'c' && oneShot == false)
	{
		Bullet bill = new Bullet(ship);
		bulletCartridge.add(bill);
		oneShot = true;
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
	if(key == 'c' && oneShot == true){oneShot = false;}



}