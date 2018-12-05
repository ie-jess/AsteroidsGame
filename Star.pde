public class Star
{
  private int x[];
  private int y[];

  public Star()
  {
    x = new int[200];
    y = new int[200];
    for (int i = 0; i< 200; i++)
    {
      x[i] = (int)(Math.random() * 500);
      y[i] = (int)(Math.random() * 500);
    }
  }
  
  public void show()
  {

    for (int i = 0; i< 200; i++)
    {
      stroke(color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256)));
      strokeWeight(2);
      point(x[i], y[i]);
    }
    strokeWeight(1);
  }
}