import java.lang.Math;

public class TotalPivotingGauss
{
    public static void TotalPivoting(double[][] A, double[] b)
    {
        // Check conditions for this method to exist
        if (A.length != A[0].length)
        {
            System.out.println("Not square matrix");
        }
        else if (A.length != b.length)
        {
            System.out.println("Matrix A and vector b with different sizes");   
        }
        else if (Determinant(A, A.length) == 0)
        {
            System.out.println("Matrix A has determinant zero");   
        }


        // Create augmented matrix A|b

        double [][] augA = new double [A.length][A.length + 1];
        for (int i=0; i<augA.length; i++)
        {
            for (int j=0; j<A[i].length; j++)
            {
                augA[i][j] = A[i][j];
            }
            augA[i][augA[0].length-1] = b[i];
        }


        // Matrixes by stages, rows and cols

        double[][][] Stages = new double[augA.length][augA.length][augA[0].length];
        Stages[0] = augA;

        for (int stage=1; stage<Stages.length; stage++)
        {
            int index = stage - 1;
            double[][] M = Stages[index];

            int maxrow = index;
            int maxcol = index;

            for (int i=index; i<M.length; i++)
            {
                for (int j=index; j<M.length; j++)
                {
                    if (Math.abs(M[i][j]) > Math.abs(M[maxrow][maxcol]))
                    {
                        maxrow = i;
                        maxcol = j;
                    }
                }
            }

            double aux;
            for (int k=0; k<M.length; k++)
            {
                aux = M[k][maxcol];
                M[k][maxcol] = M[k][index];
                M[k][index] = aux;
            }
            
            double[] aux1;
            aux1 = M[index];
            M[index] = M[maxrow];
            M[maxrow] = aux1;

            // Define the pivot
            double pivot = M[index][index];

            double multiplier;
            for (int i=stage; i<M.length; i++)
            {
                multiplier = (-1)*M[i][index]/pivot;
                for (int j=index; j<M[0].length; j++)
                {
                    M[i][j] = multiplier*M[index][j] + M[i][j];
                }
            }
            
            Stages[stage] = M;
        }
        

        int N = b.length;
        double[] solution = new double[N];
        for (int i=N-1; i>=0; i--)
        {
            double sum = 0.0;
            for (int j = i + 1; j < N; j++)
                sum += A[i][j] * solution[j];
            solution[i] = (b[i] - sum) / A[i][i];
        }

        // Print Solution
        System.out.println("\nSolution vector x:");
        printSolution(solution);
    }
    

    public static void printSolution(double[] sol)
    {
        int N = sol.length;
        System.out.println("\nSolution : ");
        for (int i = 0; i < N; i++)
            System.out.printf("%.8f ", sol[i]);
        System.out.println();
    }


    public static double Determinant(double[][] M, int n) //M is the matrix
    {
        double detM = 0;
 
        // Base case : if matrix contains single element
        if (n == 1) return M[0][0];
 
        // To store cofactors
        double temp[][] = new double[M.length][M.length];
 
        // To store sign multiplier
        int sign = 1;
 
        // Iterate for each element of first row
        for (int j = 0; j < n; j++) 
        {
            // Getting Cofactor of mat[0][f]
            getCofactor(M, temp, 0, j, n);
            detM += sign * M[0][j] * Determinant(temp, n-1);
            sign = -sign;
        }
        return detM;
    }


    static void getCofactor(double mat[][], double temp[][], int p, int q, int n)
    {
        int i = 0, j = 0;
 
        for (int row = 0; row < n; row++) 
        {
            for (int col = 0; col < n; col++) 
            {
                if (row != p && col != q) 
                {
                    temp[i][j++] = mat[row][col];
                    if (j == n-1) 
                    {
                        j = 0;
                        i++;
                    }
                }
            }
        }
    }

    public static void main (String[] args)
    {
        double[] b = {12,7,3,1};
        double[][] A = {{2,5,7,2}, {3,1,0,1}, {0,2,3,13}, {4,6,7,8}};
        TotalPivoting(A,b);
    }
}