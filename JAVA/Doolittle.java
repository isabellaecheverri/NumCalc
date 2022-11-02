// Doolittle
// Numerical Analysis 1

import java.util.*;

public class Doolittle {

    public static void main (String[] args) 
    {
        double A[][] = {{ 1, 2 },
                        { 3, 4 }}; 
        print2D(A);
     
        double b[] = {5,6};
        print1D(b);
        
        double[][][] ans = DoolittleDecomposition(A, A.length);
        
        double[] z = ProgSubs(ans[0],b);
        double[] x = RegresSubs(ans[1], z);
        
        print1D(x);
    }


    public static void print2D (double M[][])
    {
        // Loop through all rows
        for (double[] row : M)
            // converting each row as string
            // and then printing in a separate line
            System.out.println(Arrays.toString(row));
        
        System.out.println("\n");
    }

    public static void print1D (double b[])
    {
        System.out.print(Arrays.toString(b));
        System.out.println(" ^ T \n");
        
    }

    public static double[][][] DoolittleDecomposition (double[][] A, int n) {
        double[][] lower = new double[n][n];
        double[][] upper = new double[n][n];
 
        for (int i = 0; i < n; i++)
        {
            for (int k = i; k < n; k++)
            {
                double sum = 0.0;
                for (int j = 0; j < i; j++)
                    sum += (lower[i][j] * upper[j][k]);
 
                upper[i][k] = A[i][k] - sum;
            }
 
            // Lower Triangular
            for (int k = i; k < n; k++)
            {
                if (i == k)
                    lower[i][i] = 1; // Diagonal as 1
                else
                {
                    int sum = 0;
                    for (int j = 0; j < i; j++)
                        sum += (lower[k][j] * upper[j][i]);
 
                    lower[k][i] = (A[k][i] - sum) / upper[i][i];
                }
            }
        }
 
        System.out.println("Lower: ");
        print2D(lower);
        System.out.println("Upper: ");
        print2D(upper);
        

        double[][][] Ans = {lower, upper};
        return (Ans);
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
