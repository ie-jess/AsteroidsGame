class Spaceship extends Floater  
{ 
   public double topXSpeed, topYSpeed;
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
   public void setTopSpeed(double x, double y) {topXSpeed = x; topYSpeed = y;}
   public double getTopSpeedX() {return topXSpeed;}
   public double getTopSpeedY() {return topYSpeed;}

   public Spaceship()
   {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -2;
      yCorners[3] = 0;
      myColor = color(255,0,0);
      myCenterX = 250;
      myCenterY = 250;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = -50;
   }

   public void turn(int nDegreesOfRotation)
   {
    {
      myPointDirection+=nDegreesOfRotation;
      if (myPointDirection <= -360 || myPointDirection >= 360) 
      {
         myPointDirection = 0;
      }
    }
   }

   public void deccelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX -= ((dAmount) * Math.cos(dRadians));    
    myDirectionY -= ((dAmount) * Math.sin(dRadians));       
  }   
  
  public void accelerate (double dAmount, char type)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    if(type== 'x')
    {
      myDirectionX += ((dAmount) * Math.cos(dRadians)); 
    }
    if(type == 'y')
    {
      myDirectionY +=((dAmount) * Math.sin(dRadians));
    }
  }   
}
