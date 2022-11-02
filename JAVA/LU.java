// LU Factorization
// Numerical Analysis 1

import java.util.Scanner;
import java.util.*;

public class LU
{
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

        double[][][] Factorization = LUfactorization(A);
        double[][] U = Factorization[0];
        double[][] L = Factorization[1];

        System.out.println("L = ");
        print2D(L);

        System.out.println("U = ");
        print2D(U);

        double[] z = ProgSubs(L, b);
        double[] x = RegresSubs(U, z);

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

    public static double[][][] LUfactorization (double[][] A) {
        int N = A.length;

        double[][] L = zeros2D(N);
        
        for (int i=0; i<N; i++) {
            if (A[i][i] == 0) {
                System.out.println("Division by zero detected; Bye :)");
                System.exit(0);
            } 
            for (int j=i+1; j<N; j++) {
                double ratio = A[j][i]/A[i][i];
                L[j][i] = ratio;
                for (int k=0; k<N; k++) {
                    A[j][k] = A[j][k] - ratio * A[i][k];
                }
            }
        }
        
        for(int i=0; i<N; i++) {
            L[i][i] = 1;
        }
        
        double[][] U = A;

        double[][][] sol = new double[2][N][N];
        sol[0] = U;
        sol[1] = L;
        return(sol);
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


    public static double[] RegresSubs(double[][] A, double[] b) {
        double[] x = new double[b.length];
        for (int i = b.length - 1; i >= 0; i--)
        {
            double sum = 0.0;
            for (int j = i + 1; j < b.length; j++)
                sum += A[i][j] * x[j];
            x[i] = (b[i] - sum) / A[i][i];
        }
        return x;
    }
}