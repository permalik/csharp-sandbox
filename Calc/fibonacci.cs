namespace Calc;

public class Fibonacci
{
    public static int v1(int n)
    {
        if (n == 0)
        {
            return n;
        }
        if (n == 1)
        {
            return n;
        }
        return Calc.Fibonacci.v1(n - 1) + Calc.Fibonacci.v1(n - 2);
    }

}
