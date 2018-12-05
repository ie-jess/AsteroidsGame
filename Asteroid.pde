class Asteroid extends Floater
{
   private int rotationSpeed = (int)(Math.random()*5 - 1);
   public void setX(int x) {myCenterX = x;} 
   public int getX() {return (int) myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int) myCenterY;}   
   public void setDirectionX(double x) {myDirectionX = x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY = y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;}

   public Asteroid()
   {
   	corners = 18;
   	xCorners = new int [corners];
   	yCorners = new int [corners];
   	xCorners[0] = 8;
   	yCorners[0] = -5;
   	xCorners[1] = 6;
   	yCorners[1] = -5;
	xCorners[2] = 6;
   	yCorners[2] = -7;
	xCorners[3] = -5;
   	yCorners[3] = -7;
	xCorners[4] = -5;
   	yCorners[4] = -5;
	xCorners[5] = -8;
   	yCorners[5] = -5;
	xCorners[6] = -5;
   	yCorners[6] = 1;
	xCorners[7] = -7;
   	yCorners[7] = 1;
	xCorners[8] = -7;
   	yCorners[8] = 2;
	xCorners[9] = 1;
   	yCorners[9] = 2;
	xCorners[10] = 1;
   	yCorners[10] = 4;
	xCorners[11] = 3;
   	yCorners[11] = 4;
	xCorners[12] = 3;
   	yCorners[12] = 5;
	xCorners[13] = 4;
   	yCorners[13] = 5;
	xCorners[14] = 4;
   	yCorners[14] = 6;
	xCorners[15] = 5;
   	yCorners[15] = 6;
	xCorners[16] = 5;
   	yCorners[16] = 7;
	xCorners[17] = 8;
   	yCorners[17] = 7;
   	myCenterX = (int) ((Math.random() * 480 ) + 10);
   	myCenterY = (int) ((Math.random() * 480 ) + 10);
   	myPointDirection = 0;
   	myColor = 85;
   	if ((int)(Math.random() * 10)>= 4)
   	{
   		rotationSpeed = (int)((Math.random() * 7) + 1);
   		myDirectionX = Math.random();
   		myDirectionY = Math.random();
   	}
   	else 
    {
   		rotationSpeed = (int)((Math.random() * 7 *-1) -1);
   		myDirectionX = Math.random() * -1;
   		myDirectionY = Math.random() * -1;
   	}
   
   }

   public void move()
   {
   	turn(rotationSpeed);
   	super.move();   	
   }

}