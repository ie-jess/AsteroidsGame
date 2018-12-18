Spaceship ship = new Spaceship();
//Asteroid [] rock = new Asteroid[5];
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();

Star twinkie = new Star();
private boolean isAccelerating = false;
private boolean isTurnLeft = false;
private boolean isTurnRight = false;
private boolean isHyperSpace = false; 

public void setup() 
{
  	size(500,500);
    ship.setTopSpeed(20.0, 20.0);

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
  noStroke();
  fill(color(0, 0, 0, 100));
  rect(0, 0, width, height);

  accelerate();
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
      break;
    }
    for (int j = 0; j < pewpew.size(); j++)
    {
      if (dist(rock.get(i).getX(), rock.get(i).getY(), pewpew.get(j).getX(), pewpew.get(j).getY()) < 20) 
      {
        rock.remove(i);
        pewpew.remove(j);
        break;
      }
    }
    
  }
  
  for (int i = 0; i < pewpew.size(); i++)
  {
     pewpew.get(i).show();
     pewpew.get(i).move();
    
  }
  
  if (isAccelerating == true){ship.accelerate(.1);}
	if (isTurnLeft == true){ship.turn(5);}
	if (isTurnRight == true){ship.turn(-5);}

  	//to see my numbers on screen
    //text("myCenterX: "+ ship.getX(), 10, 20);
  	//text("myCenterY: "+ ship.getY(), 10, 40);
   	//text("myPointDirection: "+ ship.getPointDirection(), 10, 60);
   	//text("myDirectionX: "+ (int)(ship.getDirectionX()*100)/100.0, 10, 80);
  	//text("myDirectionY: "+ (int)(ship.getDirectionY()*100)/100.0, 10, 100);
}

public void accelerate() {
  double playerAngle = ship.getPointDirection()*(Math.PI/180);
  if (isAccelerating) {
        if (playerAngle < Math.PI/2 && playerAngle > -Math.PI/2 || 
            playerAngle < 2*Math.PI && playerAngle > 3*Math.PI/2 ||
            playerAngle < -3*Math.PI/2 && playerAngle > -2*Math.PI) {
            if (ship.getDirectionX() < ship.getTopSpeedX()) {
                ship.accelerate(0.15, 'x');
            }
        }
        if (playerAngle < 3*Math.PI/2 && playerAngle > Math.PI/2 || 
            playerAngle < -Math.PI/2 && playerAngle > -3*Math.PI/2) {
            if (ship.getDirectionX() > -ship.getTopSpeedX()) {
                ship.accelerate(0.15, 'x');
            }
        }
        if (playerAngle > Math.PI && playerAngle < 2*Math.PI ||
            playerAngle > -Math.PI && playerAngle < 0) {
            if (ship.getDirectionY() > -ship.getTopSpeedY()) {
                ship.accelerate(0.15, 'y');
            }
        }
        if (playerAngle > 0 && playerAngle < Math.PI ||
            playerAngle > -2*Math.PI && playerAngle < -Math.PI) {
            if (ship.getDirectionY() < ship.getTopSpeedY()) {
                ship.accelerate(0.15, 'y');
            }
        }
    } else if (!isAccelerating) {
        if (ship.getDirectionX() > 0) {
            //Player.accelerate(-0.25, "x");
            ship.setDirectionX(ship.getDirectionX() - 0.25);
        } else if (ship.getDirectionX() < 0) {
            //Player.accelerate(-0.25 , "x2");
            ship.setDirectionX(ship.getDirectionX() + 0.25);
        }
        if (ship.getDirectionY() > 0) {
            //Player.accelerate(-0.25 , "y");
            ship.setDirectionY(ship.getDirectionY() - 0.25);
        } else if (ship.getDirectionY() < 0) {
            //Player.accelerate(0.25 , "y2");
            ship.setDirectionY(ship.getDirectionY() + 0.25);
        }
        if (ship.getDirectionY() > -0.2 && ship.getDirectionY() < 0.2) {
            ship.setDirectionY(0);
        }
        if (ship.getDirectionX() > -0.2 && ship.getDirectionX() < 0.2) {
            ship.setDirectionX(0);
        }
    }
    }

public void keyPressed()
{
	if (key == 'w') {isAccelerating = true;}

  else if (key == 'a') {isTurnLeft = true;}

  else if (key == 'd') {isTurnRight = true;}

	else if (key == 'h')
	{
		ship.setX((int)random(width));
		ship.setY((int)random(height));
		ship.setDirectionX(0);
		ship.setDirectionY(0);
		ship.setPointDirection((int)(Math.random()*100));
	}
  if (key == 'e') {pewpew.add(new Bullet(ship));}  
}

public void keyReleased()
{
  if (key == 'w') isAccelerating = false;
  else if (key == 'a') isTurnLeft = false;
  else if (key == 'd') isTurnRight = false;
}
