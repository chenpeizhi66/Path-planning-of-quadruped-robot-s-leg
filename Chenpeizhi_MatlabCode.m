clear; 
close all; 
clc
r1 = 85; r2 = 29; r3 = 101; r4 = 50; r5=100; r6=100 ;  
R=0.04474;
b=0;
m2 = 1.5; m3 = 5; m4 = 9.15; m5 = 5; m6 = 5; 
j2=0.0004205; 
j3=0.00417; 
j4=0.00345; 
j5=0.00417; 
j6=0.00417; 
w2=1;
alpha2=0;
theta=34.4*pi/180;
r=0.0447;
j=1;
w1=1;
g=9.81;
for theta2 = 0 : pi/180 : 8*pi
     theta_2(j) = theta2 * 180/pi;
     A=2*r3*r2*sin(theta2);
     B=2*r3*(r2*cos(theta2)-r1);
     C=r1^2+r2^2+r3^2-r4^2-2*r1*r2*cos(theta2);
     z=(A+sqrt(A^2+B^2-C^2))/(B-C);
     theta3(j)=2*atan(z);
     A1=2*r4*r2*sin(theta2);
     B1=2*r4*(r2*cos(theta2)-r1);
     C1=-r1^2-r2^2-r4^2+r3^2+2*r1*r2*cos(theta2);
     theta4(j)=2*atan((A1+sqrt(A1^2+B1^2-C1^2))/(-C1+B1));
     theta41(j)=-(theta4(j)-68*pi/180);
     w3(j)=-(r2/r3)*(sin(theta4(j)-theta2))/(sin(theta4(j)-theta3(j)))*w2;
     w4(j)=(r2/r4)*(sin(theta3(j)-theta2))/(sin(theta3(j)-theta4(j)))*w2;
     alpha4(j)=(w2^2*r2*cos(theta2-theta3(j))+w3(j)^2*r3-w4(j)^2*r4*cos(theta4(j)-theta3(j)))/(r4*sin(theta4(j)-theta3(j)));
     A2=2*r5*r4*sin(theta41(j));
     B2=2*r5*(r4*cos(theta41(j))-r1);
     C2=r1^2+r4^2+r5^2-r6^2-2*r1*r4*cos(theta41(j));
     z2=(A2+sqrt(A2.^2+B2.^2-C2.^2))/(-C2+B2);
     theta5(j)=2*atan(z2); 
     A3=2*r6*r4*sin(theta41(j));
     B3=2*r6*(r4*cos(theta41(j))-r1);
     C3=-r1^2-r4^2-r6^2+r5^2+2*r1*r4*cos(theta41(j));
     z3=(A3-sqrt(A3.^2+B3.^2-C3.^2))/(-C3+B3);
     theta6(j)=-2*atan(z3);
     w5(j)=-(r4/r5)*(sin(theta41(j)-theta6(j)))/(sin(theta5(j)-theta6(j)))*w4(j);
     w6(j)=(r4/r6)*(sin(theta41(j)-theta5(j)))/(sin(theta6(j)-theta5(j)))*w4(j);
     alpha3(j)=(-w2^2*r2*cos(theta2-theta4(j))+w4(j)^2*r4-w3(j)^2*r3*cos(theta3(j)-theta4(j)))/(r4*sin(theta3(j)-theta4(j)));
     alpha6(j)=(r4*alpha4(j)*sin(theta41(j)-theta5(j))+w4(j)^2*r4*cos(theta41(j)-theta5(j))+w5(j)^2*r5-w6(j)^2*r6*cos(theta6(j)-theta5(j)))/(r6*sin(theta6(j)-theta5(j)));
     alpha5(j)=(r4*alpha4(j)*sin(theta6(j)-theta41(j))-w4(j)^2*r4*cos(theta41(j)-theta6(j))+w6(j)^2*r6-w5(j)^2*r5*cos(theta5(j)-theta6(j)))/(r6*sin(theta5(j)-theta6(j)));
    
    Mc3(j)=-j3*alpha3(j); 
    Mc4(j)=-j4*alpha4(j); 
    Mc5(j)=-j5*alpha5(j);
    Mc6(j)=-j6*alpha6(j);
    ac2x(j)=-(w2)^2*0.0145*cos(theta+theta2);
    ac2y(j)=-(w2)^2*0.0145*sin(theta+theta2);
    ac3x(j)=-(w2)^2*0.029*cos(theta+theta2)-w3(j).^2*0.0505*cos(theta+theta3(j))-alpha3(j)*0.0505*sin(theta+theta3(j));  
    ac3y(j)=-(w2)^2*0.029*sin(theta+theta2)+w3(j).^2*0.0505*sin(theta+theta3(j))+alpha3(j)*0.0505*cos(theta+theta3(j));  
    ac4x(j)=-(w2)^2*0.029*cos(theta+theta2)-w3(j).^2*0.101*cos(theta+theta3(j))-alpha3(j)*0.101*sin(theta+theta3(j))+w4(j).^2*r*cos(theta+theta4(j)-56*pi/180)-alpha4(j)*r*sin(theta+theta4(j)-56*pi/180);  
    ac4y(j)=-(w2)^2*0.029*sin(theta+theta2)+w3(j).^2*0.101*sin(theta+theta3(j))+alpha3(j)*0.101*cos(theta+theta3(j))+w4(j).^2*r*sin(theta+theta4(j)-56*pi/180)+alpha4(j)*r*cos(theta+theta4(j)-56*pi/180);  
    ac6x(j)=w6(j).^2*0.05*cos(theta+theta6(j))+alpha6(j)*0.05*sin(theta+theta6(j));
    ac6y(j)=w6(j).^2*0.05*sin(theta+theta6(j))-alpha6(j)*0.05*cos(theta+theta6(j));
    ac5x(j)=w6(j).^2*0.1*cos(theta+theta6(j))+alpha6(j)*0.1*sin(theta+theta6(j))-w5(j).^2*0.05*cos(theta+theta5(j))-alpha5(j)*0.05*sin(theta+theta5(j));
    ac5y(j)=w6(j).^2*0.1*sin(theta+theta6(j))-alpha6(j)*0.1*cos(theta+theta6(j))-w5(j).^2*0.05*sin(theta+theta5(j))+alpha5(j)*0.05*cos(theta+theta5(j));
    
    a1=0.0145*sin(theta+theta2); a2=-0.0145*cos(theta+theta2); a3=0.0145*sin(theta+theta2); a4=-0.0145*cos(theta+theta2);
    b1(j)=0.0505*sin(theta+theta3(j)); b2(j)=-0.0505*cos(theta+theta3(j)); b3(j)=-0.0505*sin(theta+theta3(j)); b4(j)=0.0505*cos(theta+theta3(j));
    c1(j)=-r*sin(22.56*pi/180+theta4(j)); c2(j)=r*cos(22.56*pi/180+theta4(j)); c3(j)=-r*sin(-theta4(j)+201.4*pi/180); c4(j)=-r*cos(-theta4(j)+201.4*pi/180); c5(j)=r*sin(90.56*pi/180+theta4(j)); c6(j)=-r*cos(90.56*pi/180+theta4(j));
    d1(j)=-0.05*sin(theta+theta5(j)); d2(j)=0.05*cos(theta+theta5(j)); d3(j)=0.05*sin(theta+theta5(j)); d4(j)=-0.05*cos(theta+theta5(j));
    e1(j)=-0.05*sin(theta+theta6(j)); e2(j)=0.05*cos(theta+theta6(j)); e3(j)=0.05*sin(theta+theta6(j)); e4(j)=-0.05*cos(theta+theta6(j));
    

    
    y=[   -m2*ac2x(j);
          -m2*ac2y(j)+m2*g;
          0;
          m3*g-m3*ac3y(j);
          -m3*ac3x(j);
          -Mc3(j);
          m4*g-m4*ac4y(j);
          -m4*ac4x(j);
          -Mc4(j);
          m5*g-m5*ac5y(j);
          -m5*ac5x(j);
          -Mc5(j);
          -m6*ac6x(j);
          m6*g-m6*ac6y(j);
          -Mc6(j)];
      
mb4=m4;

    mat=[1 0 0 0 0 0 -1 0 0 0 0 0 0 0 0;
         0 1 0 0 0 0 0 -1 0 0 0 0 0 0 0;
         a3 a4 0 0 0 0 a1 a2 0 0 0 0 0 0 1;
         0 0 0 0 0 0 0 1 0 -1 0 0 0 0 0;
         0 0 0 0 0 0 1 0 -1 0 0 0 0 0 0;
         0 0 0 0 0 0 b1(j) b2(j) -b3(j) -b4(j) 0 0 0 0 0;
         0 0 0 0 0 1 0 0 0 1 0 -1 0 0 0;
         0 0 0 0 1 0 0 0 1 0 -1 0 0 0 0;
         0 0 0 0 c5(j) c6(j) 0 0 c3(j) c4(j) c1(j) c2(j) 0 0 0;
         0 0 0 0 0 0 0 0 0 0 0 1 0 -1 0;
         0 0 0 0 0 0 0 0 0 0 1 0 -1 0 0;
         0 0 0 0 0 0 0 0 0 0 d1(j) d2(j) -d3(j) -d4(j) 0;
         0 0 1 0 0 0 0 0 0 0 0 0 1 0 0;
         0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
         0 0 e1(j) e2(j) 0 0 0 0 0 0 0 0 e3(j) e4(j) 0];
    
    x=inv(mat)*y; 
    
    F12x(j) = x(1,1);
    F12y(j) = x(2,1);
    F16x(j) = x(3,1);
    F16y(j) = x(4,1);
    F14x(j) = x(5,1);
    F14y(j) = x(6,1);
    F23x(j) = x(7,1);
    F23y(j) = x(8,1);
    F34x(j) = x(9,1);
    F34y(j) = x(10,1);
    F45x(j) = x(11,1);
    F45y(j) = x(12,1);
    F56x(j) = x(13,1);
    F56y(j) = x(14,1);
    Mc2(j) = x(15,1);
   
    t(j)=(-36*pi/180)+theta6(j);
    x=100*cos(theta6)+50*cos(t);
    y=100*sin(theta6)+50*sin(t);
    v6x(j)=-w6(j)*100*sin(theta6(j))-w6(j)*50*sin(t(j));
    v6y(j)=w6(j)*100*cos(theta6(j))+w6(j)*50*cos(t(j));
    a6x(j)=-alpha6(j)*100*sin(theta6(j))-(w6(j))^2*100*cos(theta6(j))-alpha6(j)*50*sin(t(j))-(w6(j))^2*50*cos(t(j));
    a6y(j)=alpha6(j)*100*cos(theta6(j))-(w6(j))^2*100*sin(theta6(j))+alpha6(j)*50*cos(t(j))-(w6(j))^2*50*sin(t(j));
    
    %支反力变化
Fsx=F12x+F16x+F14x;
Fsy=F12y+F16y+F14y;
Fsx1=F12x+F16x+F14x+mb4*(w4(j))^2*R*cos(theta+theta4(j)+56*pi/180);
Fsy1=F12y+F16y+F14y+mb4*(w4(j))^2*R*sin(theta+theta4(j)+56*pi/180)+mb4*g;
    j=j+1;
    
end

%位移，速度，加速度
% subplot(3,2,1)
% plot(theta_2, x, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('displacement x'); 
% subplot(3,2,2)
% plot(theta_2, y, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('displacement y'); 
% subplot(3,2,3)
% plot(theta_2, v6x, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('x velocity'); 
% subplot(3,2,4)
% plot(theta_2, v6y, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('y velocity'); 
% subplot(3,2,5)
% plot(theta_2, a6x/1000, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('x acceleration'); 
% subplot(3,2,6)
% plot(theta_2, a6y/1000, 'g', 'LineWidth', 2);
% xlabel('\theta_2'); ylabel('y acceleration');

%    力
%    subplot(5,3,1)
%    plot(theta_2, F12x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F12x');
%    subplot(5,3,2)
%    plot(theta_2, F12y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F12y');
%    subplot(5,3,3)
%    plot(theta_2, Mc2, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('Mc2');
%    subplot(5,3,4)
%    plot(theta_2, F16x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F16x');
%    subplot(5,3,5)
%    plot(theta_2, F16y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F16y');
%    subplot(5,3,6)
%    plot(theta_2, F14x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F14x');
%    subplot(5,3,7)
%    plot(theta_2, F14y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F14y');
%    subplot(5,3,8)
%    plot(theta_2, F23x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F23x');
%    subplot(5,3,9)
%    plot(theta_2, F23y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F23y');
%    subplot(5,3,10)
%    plot(theta_2, F34x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F34x');
%    subplot(5,3,11)
%    plot(theta_2, F34y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F34y');
%    subplot(5,3,12)
%    plot(theta_2, -F45x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F45x');
%    subplot(5,3,13)
%    plot(theta_2, F45y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F45y');
%    subplot(5,3,14)
%    plot(theta_2, -F56x, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F56x');
%    subplot(5,3,15)
%    plot(theta_2, F56y, 'g', 'LineWidth', 2);
%    xlabel('\theta_2'); ylabel('F56y');

%支反力 x
% Fi1x=ac2x*m2+ac3x*m3+ac4x*m4+ac5x*m5+ac6x*m6;
% Fi1y=ac2y*m2+ac3y*m3+ac4y*m4+ac5y*m5+ac6y*m6;
% plot(Fsx,'b')
% hold on
% plot(Fsx1,'r')
%支反力 y
% plot(Fsy,'b')
% hold on
% plot(Fsy1,'r')


Mi1=Mc3+Mc4+Mc5+Mc6;

% 配重
    j=1;
    j4=0.00763; 
for theta2 = 0 : pi/180 : 8*pi
     theta_2(j) = theta2 * 180/pi;
     A=2*r3*r2*sin(theta2);
     B=2*r3*(r2*cos(theta2)-r1);
     C=r1^2+r2^2+r3^2-r4^2-2*r1*r2*cos(theta2);
     z=(A+sqrt(A^2+B^2-C^2))/(B-C);
     theta3(j)=2*atan(z);
     A1=2*r4*r2*sin(theta2);
     B1=2*r4*(r2*cos(theta2)-r1);
     C1=-r1^2-r2^2-r4^2+r3^2+2*r1*r2*cos(theta2);
     theta4(j)=2*atan((A1+sqrt(A1^2+B1^2-C1^2))/(-C1+B1));
     theta41(j)=-(theta4(j)-68*pi/180);
     w3(j)=-(r2/r3)*(sin(theta4(j)-theta2))/(sin(theta4(j)-theta3(j)))*w2;
     w4(j)=(r2/r4)*(sin(theta3(j)-theta2))/(sin(theta3(j)-theta4(j)))*w2;
     alpha4(j)=(w2^2*r2*cos(theta2-theta3(j))+w3(j)^2*r3-w4(j)^2*r4*cos(theta4(j)-theta3(j)))/(r4*sin(theta4(j)-theta3(j)));
     A2=2*r5*r4*sin(theta41(j));
     B2=2*r5*(r4*cos(theta41(j))-r1);
     C2=r1^2+r4^2+r5^2-r6^2-2*r1*r4*cos(theta41(j));
     z2=(A2+sqrt(A2.^2+B2.^2-C2.^2))/(-C2+B2);
     theta5(j)=2*atan(z2); 
     A3=2*r6*r4*sin(theta41(j));
     B3=2*r6*(r4*cos(theta41(j))-r1);
     C3=-r1^2-r4^2-r6^2+r5^2+2*r1*r4*cos(theta41(j));
     z3=(A3-sqrt(A3.^2+B3.^2-C3.^2))/(-C3+B3);
     theta6(j)=-2*atan(z3);
     w5(j)=-(r4/r5)*(sin(theta41(j)-theta6(j)))/(sin(theta5(j)-theta6(j)))*w4(j);
     w6(j)=(r4/r6)*(sin(theta41(j)-theta5(j)))/(sin(theta6(j)-theta5(j)))*w4(j);
     alpha3(j)=(-w2^2*r2*cos(theta2-theta4(j))+w4(j)^2*r4-w3(j)^2*r3*cos(theta3(j)-theta4(j)))/(r4*sin(theta3(j)-theta4(j)));
     alpha6(j)=(r4*alpha4(j)*sin(theta41(j)-theta5(j))+w4(j)^2*r4*cos(theta41(j)-theta5(j))+w5(j)^2*r5-w6(j)^2*r6*cos(theta6(j)-theta5(j)))/(r6*sin(theta6(j)-theta5(j)));
     alpha5(j)=(r4*alpha4(j)*sin(theta6(j)-theta41(j))-w4(j)^2*r4*cos(theta41(j)-theta6(j))+w6(j)^2*r6-w5(j)^2*r5*cos(theta5(j)-theta6(j)))/(r6*sin(theta5(j)-theta6(j)));
             
mb4=m4;

    Mc3(j)=-j3*alpha3(j); 
    Mc4(j)=-j4*alpha4(j); 
    Mc5(j)=-j5*alpha5(j);
    Mc6(j)=-j6*alpha6(j);
    ac2x(j)=-(w2)^2*0.0145*cos(theta+theta2);
    ac2y(j)=-(w2)^2*0.0145*sin(theta+theta2);
    ac3x(j)=-(w2)^2*0.029*cos(theta+theta2)-w3(j).^2*0.0505*cos(theta+theta3(j))-alpha3(j)*0.0505*sin(theta+theta3(j));  
    ac3y(j)=-(w2)^2*0.029*sin(theta+theta2)+w3(j).^2*0.0505*sin(theta+theta3(j))+alpha3(j)*0.0505*cos(theta+theta3(j));  
    ac4x(j)=0;
    ac4y(j)=0;
    ac4x1(j)=0;
    ac4y1(j)=0;
    ac6x(j)=w6(j).^2*0.05*cos(theta+theta6(j))+alpha6(j)*0.05*sin(theta+theta6(j));
    ac6y(j)=w6(j).^2*0.05*sin(theta+theta6(j))-alpha6(j)*0.05*cos(theta+theta6(j));
    ac5x(j)=w6(j).^2*0.1*cos(theta+theta6(j))+alpha6(j)*0.1*sin(theta+theta6(j))-w5(j).^2*0.05*cos(theta+theta5(j))-alpha5(j)*0.05*sin(theta+theta5(j));
    ac5y(j)=w6(j).^2*0.1*sin(theta+theta6(j))-alpha6(j)*0.1*cos(theta+theta6(j))-w5(j).^2*0.05*sin(theta+theta5(j))+alpha5(j)*0.05*cos(theta+theta5(j));
    
    a1=0.0145*sin(theta+theta2); a2=-0.0145*cos(theta+theta2); a3=0.0145*sin(theta+theta2); a4=-0.0145*cos(theta+theta2);
    b1(j)=0.0505*sin(theta+theta3(j)); b2(j)=-0.0505*cos(theta+theta3(j)); b3(j)=-0.0505*sin(theta+theta3(j)); b4(j)=0.0505*cos(theta+theta3(j));
    c1(j)=-r*sin(22.56*pi/180+theta4(j)); c2(j)=r*cos(22.56*pi/180+theta4(j)); c3(j)=-r*sin(-theta4(j)+201.4*pi/180); c4(j)=-r*cos(-theta4(j)+201.4*pi/180); c5(j)=r*sin(90.56*pi/180+theta4(j)); c6(j)=-r*cos(90.56*pi/180+theta4(j));
    d1(j)=-0.05*sin(theta+theta5(j)); d2(j)=0.05*cos(theta+theta5(j)); d3(j)=0.05*sin(theta+theta5(j)); d4(j)=-0.05*cos(theta+theta5(j));
    e1(j)=-0.05*sin(theta+theta6(j)); e2(j)=0.05*cos(theta+theta6(j)); e3(j)=0.05*sin(theta+theta6(j)); e4(j)=-0.05*cos(theta+theta6(j));
    
    y=[   -m2*ac2x(j);
          -m2*ac2y(j)+m2*g;
          0;
          m3*g-m3*ac3y(j);
          -m3*ac3x(j);
          -Mc3(j);
          m4*g-m4*ac4y(j)-mb4*ac4y1(j)+mb4*g;
          -m4*ac4x(j)-mb4*ac4x1(j);
          -Mc4(j);
          m5*g-m5*ac5y(j);
          -m5*ac5x(j);
          -Mc5(j);
          -m6*ac6x(j);
          m6*g-m6*ac6y(j);
          -Mc6(j)];


    mat=[1 0 0 0 0 0 -1 0 0 0 0 0 0 0 0;
         0 1 0 0 0 0 0 -1 0 0 0 0 0 0 0;
         a3 a4 0 0 0 0 a1 a2 0 0 0 0 0 0 1;
         0 0 0 0 0 0 0 1 0 -1 0 0 0 0 0;
         0 0 0 0 0 0 1 0 -1 0 0 0 0 0 0;
         0 0 0 0 0 0 b1(j) b2(j) -b3(j) -b4(j) 0 0 0 0 0;
         0 0 0 0 0 1 0 0 0 1 0 -1 0 0 0;
         0 0 0 0 1 0 0 0 1 0 -1 0 0 0 0;
         0 0 0 0 c5(j) c6(j) 0 0 c3(j) c4(j) c1(j) c2(j) 0 0 0;
         0 0 0 0 0 0 0 0 0 0 0 1 0 -1 0;
         0 0 0 0 0 0 0 0 0 0 1 0 -1 0 0;
         0 0 0 0 0 0 0 0 0 0 d1(j) d2(j) -d3(j) -d4(j) 0;
         0 0 1 0 0 0 0 0 0 0 0 0 1 0 0;
         0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
         0 0 e1(j) e2(j) 0 0 0 0 0 0 0 0 e3(j) e4(j) 0];
    
    x=inv(mat)*y; 
    
    F12x(j) = x(1,1);
    F12y(j) = x(2,1);
    F16x(j) = x(3,1);
    F16y(j) = x(4,1);
    F14x(j) = x(5,1);
    F14y(j) = x(6,1);
    F23x(j) = x(7,1);
    F23y(j) = x(8,1);
    F34x(j) = x(9,1);
    F34y(j) = x(10,1);
    F45x(j) = x(11,1);
    F45y(j) = x(12,1);
    F56x(j) = x(13,1);
    F56y(j) = x(14,1);
    Mc21(j) = x(15,1);
    
    t(j)=(-36*pi/180)+theta6(j);
    x=100*cos(theta6)+50*cos(t);
    y=100*sin(theta6)+50*sin(t);
    v6x(j)=-w6(j)*100*sin(theta6(j))-w6(j)*50*sin(t(j));
    v6y(j)=w6(j)*100*cos(theta6(j))+w6(j)*50*cos(t(j));
    a6x(j)=-alpha6(j)*100*sin(theta6(j))-(w6(j))^2*100*cos(theta6(j))-alpha6(j)*50*sin(t(j))-(w6(j))^2*50*cos(t(j));
    a6y(j)=alpha6(j)*100*cos(theta6(j))-(w6(j))^2*100*sin(theta6(j))+alpha6(j)*50*cos(t(j))-(w6(j))^2*50*sin(t(j));
    
    j=j+1;
    
end

%合惯性力
% Fix=ac2x*m2+ac3x*m3+ac5x*m5+ac6x*m6;
% Fiy=ac2y*m2+ac3y*m3+ac5y*m5+ac6y*m6;
% plot(Fi1x,'b')
% hold on
% plot(Fix,'r')

%合惯性矩
% Mi=Mc3+Mc4+Mc5+Mc6;
% plot(Mi1,'b')
% hold on
% plot(Mi,'r')

% 平衡转矩
% plot(Mc2,'b')
% hold on
% plot(Mc21,'r')