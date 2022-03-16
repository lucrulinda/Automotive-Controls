clc
clear
close all;

fp1= 1e-6;
fp2= 5.5;
fn1= 1e-5;
fn2= 50;
pm0= 50e3; % kPa to Pa
ma0_kgh= 7; % kg/h
no_rpm= 5000; %rpm
tn= .4; %sec
tj= .25; %sec
To= 240; %N-m

%conversions:
no = (no_rpm)/ 60; %rpm to revs per seconds
ma0= ma0_kgh/ 3600; %kg/h to kg/sec

a11= (-1)*(fp1/tn)*(pm0/ma0);
a12= (-1)*(fn1/tn)*(no/ma0);
a21= (fp2/tj)*(pm0/To);
a22= (fn2/tj)*(no/To);
A = [a11, a12; a21, a22];
B = [1/tn;0];
C = [0,1];
D = 0;
sys_ss = ss(A,B,C,D); %state space function
sys_tf = tf(sys_ss) % transfer function
%rlocus(sys_tf); %root locys diagram

%bode diagram
bode(sys_tf); grid on; 
[gm,pm,wcg,wpc] = margin(sys_tf)
% gain and phase margins have to be positive for our system to be stable.


% calculating proportional gains (Kp & Kn) of the controller
j= sqrt(-1);
s1= 1+ j;
s2= 1-j;

Kp= (tn*-1)*(s1+s2) -fp1*(pm0/ma0)  +(tn/tj)*fn2*(no/To);
Kn= (((tj*tn)/(fp2*(pm0/To)))*(s1*s2))-   fn1*(no/ma0) -(((fn2*(no/To))/(fp2*(pm0/To)))*tn*(s1+s2))   + ((tn/tj) *(fn2^2*(no^2/To^2))/ (fp2*(pm0/To)));


