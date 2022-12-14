import java.lang.Math;

public class FalsePosition {
    public static void main (String[] args){
        RF(0, 2, 1E-9, 20);

    }

    public static void RF(double a, double b, double tol, double Nmax){
        System.out.println("\ti" + "\ta          \t" + "\tb          \t" +
                "\tfa       \t" + "\tfb       \t" + "\tXm_i       \t" + "\tfXm_i       \t" + "\tError");

        double Xm_anterior = 0;

        for (int i = 0; i <= Nmax; i++){
            //Introducir manualmente la funciòn
            //f=x^2-2

            double fa = Math.pow(a, 2)-2;
            double fb = Math.pow(b, 2)-2;

            double Xm_i = ((a*fb)-(b*fa))/(fb-fa);
            double fXm_i = Math.pow(Xm_i, 2)-2;

            double error = Math.abs(Xm_anterior - Xm_i);
            if (error < tol){
                System.out.println("\t" + i + "\t" + String.format("%,.010f", a) + "\t" + String.format("%,.010f", b) + "\t" + String.format("%,.010f", fa) + "\t" + String.format("%,.010f", fb) + "\t" + String.format("%,.010f", Xm_i) + "\t" + String.format("%,.010f", fXm_i) + "\t" + String.format("%e", error));
                System.out.println("El numero mas cercano a la raiz de acuerdo a la tolerancia es " + Xm_i);
                System.out.println("Se alcanzo en la iteracion " + i);
                break;
            }


            if((fXm_i*fb)<0){
                a = Xm_i;
            } else if ((fXm_i*fa)<0) {
                b = Xm_i;
            } else if ((fXm_i*fa) == 0 || (fXm_i*fb) == 0){
                System.out.println("Uno de los tres valores " + a + ", " + Xm_i + ", " + b + " es una raiz" );
                break;
            } else{
                System.out.println("No existe una raíz en este intervalo");
                break;
            }
            if (i==Nmax){
                System.out.println(Nmax + " iteraciones no fueron suficientes para encontrar la raiz");
            }
            Xm_anterior = Xm_i;
            System.out.println("\t" + i + "\t" + String.format("%,.010f", a) + "\t" + String.format("%,.010f", b) + "\t" + String.format("%,.010f", fa) + "\t" + String.format("%,.010f", fb) + "\t" + String.format("%,.010f", Xm_i) + "\t" +
                    String.format("%,.010f", fXm_i) + "\t" + String.format("%e", error));
        }
    }
}
