// Cholesky Factorization
// Numerical Analysis 1

import java.util.Scanner;
import java.util.*;

public class Cholesky 
{
    public static double[][] CholeskyFactorization(double[][] M, int N)
    {
        double[][] lowerT = new double[N][N];
 
        for (int i = 0; i < N; i++) {
            for (int j = 0; j <= i; j++) {
                int sum = 0;
 
                if (j == i) {
                    for (int k = 0; k < j; k++)
                        sum += (int) Math.pow(lowerT[j][k],2);
                    lowerT[j][j] = (int)Math.sqrt(M[j][j] - sum);
                }
 
                else {
                    for (int k = 0; k < j; k++)
                        sum += (lowerT[i][k] * lowerT[j][k]);
                    lowerT[i][j] = (M[i][j] - sum) / lowerT[j][j];
                }
            }
        }
 
        System.out.println(" Lower Triangular\t Transpose");
        for (int i = 0; i < N; i++) {
 
            for (int j = 0; j < N; j++)
                System.out.print(lowerT[i][j] + "\t");
            System.out.print("");

            for (int j = 0; j < N; j++)
                System.out.print(lowerT[j][i] + "\t");
            System.out.println();
        }

        return(lowerT);
    }


    public static void main (String[] args) 
    {
        Scanner in = new Scanner(System.in);
        System.out.print("Enter the number of rows: ");  
        int N = in.nextInt();

        double[][] A = zeros2D(N);
        double[] b = zeros1D(N);

        System.out.println("System Ax = b");
        System.out.println("Enter the elements of the matrix A: ");
        A = inputMatrix(A);
        System.out.println("Enter the elements of the vector b: ");
        b = inputVector(b);

        System.out.println("A = ");
        print2D(A);
        System.out.println("b = ");
        print1D(b);

        double[][] M = CholeskyFactorization(A, A.length);

        double[] x = ProgSubs(M, b);
        
        System.out.println("x:");
        print1D(x);

        in.close();
    }

    public static double[][] zeros2D (int N)
    {
        double[][] z = new double[N][N];

        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) {
                z[i][j] = 0;
            }
        }
        return (z);
    }

    public static double[] zeros1D (int N)
    {
        double[] z = new double[N];

        for (int i=0; i<N; i++) {
            z[i] = 0;
        }
        return (z);
    }

    public static void print2D (double M[][])
    {
        // Loop through all rows
        for (double[] row : M)
            // converting each row as string
            // and then printing in a separate line
            System.out.println(Arrays.toString(row));
        
        System.out.print("\n");
    }

    public static void print1D (double b[])
    {
        System.out.print(Arrays.toString(b));
        System.out.println(" ^ T");
        System.out.print("\n");
    }

    public static double[][] inputMatrix (double[][] M)
    {
        Scanner in = new Scanner(System.in);
        for (int i=0; i<M.length; i++) {
            for (int j=0; j<M[0].length; j++) {
                M[i][j] = in.nextDouble();
            }
        }
        in.close();
        return M;
    }

    public static double[] inputVector (double[] b)
    {
        Scanner in = new Scanner(System.in);
        for(int i=0; i<b.length; i++)  
        {  
            b[i] = in.nextDouble();  
        }  
        in.close();
        return(b);
    }

    public static double[] ProgSubs(double[][] A, double[] b) {
        double[] x = new double[b.length];
        for (int i = 0; i < b.length; i++)
        {
            x[i] = b[i];
            for (int j = 0; j < i; j++)  { 
                x[i] = x[i] - A[i][j]*x[j];
            }
            x[i] = x[i]/A[i][i];
        }
        return x;
    }
}