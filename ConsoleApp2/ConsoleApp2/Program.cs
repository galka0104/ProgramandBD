using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace ConsoleApp2
{
    class Program
    {
        static int[] mas = { 1, 5, 4, 8, 4, 0, 8, 9, 7, 2, 15, 46, 3 };
        static readonly int N = mas.Length;//длина массива
        static readonly int M = N-1;//число M<=N
        static double result = 1;
        static Action<int[], int>[] zeroCheck = new Action<int[], int>[] { check, excep };
        static void check(int[] mas, int i)
        {
            result *= mas[i];
            i++;
            zeroCheck[i / M](mas, i);
        }
        static void excep(int[] mas, int i)
        {
        }

        static void Main(string[] args)
        {
            check(mas, 0);
            Console.WriteLine(new string[] { "Yes", "No" }[(uint)(result / (result - 0.1))]);
            Console.WriteLine();
            Console.WriteLine("Нажмите на любую клавишу для завершения");
            Console.ReadKey();
        }
    }
}
