Spaceship ship = new Spaceship();
//Asteroid [] rock = new Asteroid[5];
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
Star twinkie = new Star();
private boolean isAccelerating = false;
private boolean isTurnLeft = false;
private boolean isTurnRight = false;
private boolean isBrakes = false;
private boolean isHyperSpace = false; 

public void setup() 
{
  	size(500,500);
  	//for(int i = 0; i < rock.length; i++) {
    //rock[i] = new Asteroid();
    // }
    for(int i = 0; i < 15; i++)
    {
    	rock.add(new Asteroid());
    }
  
}

public void draw() 
{
	background(0);
	twinkie.show();
    ship.show();
    ship.move();

    for(int i = 0; i < rock.size(); i++)
    {
    rock.get(i).show();
    rock.get(i).move();
    if (dist(rock.get(i).getX(), rock.get(i).getY(),ship.getX(), ship.getY()) < 20) 
    {
      rock.remove(i);
    }
    }

    if (isAccelerating == true){ship.accelerate(.1);}
  	if (isTurnLeft == true){ship.turn(5);}
  	if (isTurnRight == true){ship.turn(-5);}
  	if (isBrakes == true) {ship.deccelerate(.1);}

  	//to see my numbers on screen
    //text("myCenterX: "+ ship.getX(), 10, 20);
	//text("myCenterY: "+ ship.getY(), 10, 40);
 	//text("myPointDirection: "+ ship.getPointDirection(), 10, 60);
 	//text("myDirectionX: "+ (int)(ship.getDirectionX()*100)/100.0, 10, 80);
  	//text("myDirectionY: "+ (int)(ship.getDirectionY()*100)/100.0, 10, 100);

  	
}

public void keyPressed()
{
	if (key == 'w') {isAccelerating = true;}

    else if (key == 'a') {isTurnLeft = true;}

    else if (key == 'd') {isTurnRight = true;}

	else if (key == 's') {isBrakes = true;}

	else if (key == 'h')
	{
		ship.setX((int)random(width));
		ship.setY((int)random(height));
		ship.setDirectionX(0);
		ship.setDirectionY(0);
		ship.setPointDirection((int)(Math.random()*100));
	}
}

public void keyReleased()
{
  if (key == 'w') isAccelerating = false;
  else if (key == 'a') isTurnLeft = false;
  else if (key == 'd') isTurnRight = false;
  else if (key == 's') isBrakes = false;
}
