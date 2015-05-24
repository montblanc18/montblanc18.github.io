#include<stdio.h>
#include<stdlib.h>
#include<math.h>

static double STEP;
static double p = 10;
static double r = 28;
static double b = 8.0/3.0;
static double y;
static double z;

double dxdt(double x,double y){
  double A;
  A = -p*x+p*y;
  return(A);
}

double dydt(double x,double y,double z){
  double B;
  B = -x*z+r*x-y;
  return(B);
}

double dzdt(double x,double y,double z){
  double C;
  C = x*y-b*z;
  return(C);
}

double next(double x1,double y1,double z1){
  double x;
  double kx1;
  double kx2;
  double kx3;
  double kx4;
  double ky1;
  double ky2;
  double ky3;
  double ky4;
  double kz1;
  double kz2;
  double kz3;
  double kz4;

  kx1 = dxdt(x,y)*STEP;
  ky1 = dydt(x,y,z)*STEP;
  kz1 = dzdt(x,y,z)*STEP;
  
  kx2 = dxdt(x1+kx1*pow(2,-1),y1+ky1*pow(2,-1))*STEP;
  ky2 = dydt(x1+kx1*pow(2,-1),y1+ky1*pow(2,-1),z1+kz1*pow(2,-1))*STEP;
  kz2 = dzdt(x1+kx1*pow(2,-1),y1+ky1*pow(2,-1),z1+kz1*pow(2,-1))*STEP;
 
  kx3 = dxdt(x1+kx2*pow(2,-1),y1+ky2*pow(2,-1))*STEP;
  ky3 = dydt(x1+kx2*pow(2,-1),y1+ky2*pow(2,-1),z1+kz2*pow(2,-1))*STEP;
  kz3 = dzdt(x1+kx2*pow(2,-1),y1+ky2*pow(2,-1),z1+kz2*pow(2,-1))*STEP;
  
  kx4 = dxdt(x1+kx3,y1+ky3)*STEP;
  ky4 = dydt(x1+kx3,y1+ky3,z1+kz3)*STEP;
  kz4 = dzdt(x1+kx3,y1+ky3,z1+kz3)*STEP;
  
  x = x1 + pow(6,-1)*(kx1 + 2*kx2 + 2*kx3 + kx4 );
  y = y1 + pow(6,-1)*(ky1 + 2*ky2 + 2*ky3 + ky4 );
  z = z1 + pow(6,-1)*(kz1 + 2*kz2 + 2*kz3 + kz4 );
  return(x);
}

int main()
{
  double t;
  double x1,x2;
  double y1,y2;
  double z1,z2;
  STEP=1.0E-2;
  x1=10.0;
  y1=10.0;
  z1=15.0;
  for(t=0.0;t<50.0;t+=STEP){
    printf("%f %f %f %f\n",t,x1,y1,z1);
    x1 = next(x1,y1,z1);
    y1 = y;
    z1 = z;
  }
}
