class Lasagna
{
    private const int CookingMinutes = 40;
    private const int PreparationMinutesByLayer = 2;

    public int ExpectedMinutesInOven()
    {
      return CookingMinutes;
    }

    public int RemainingMinutesInOven(int currentTimeInOven)
    {
      return ExpectedMinutesInOven() - currentTimeInOven;
    }

    public int PreparationTimeInMinutes(int layers)
    {
      return PreparationMinutesByLayer * layers;
    }

    public int ElapsedTimeInMinutes(int layers, int currentTimeInOven)
    {
      return PreparationTimeInMinutes(layers) + currentTimeInOven;
    }
}
