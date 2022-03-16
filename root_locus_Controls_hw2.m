% Root Locus Method in MATLAB

clc
clear
close all

num= [1.05];
den =[.03 1];
sys = tf(num, den)
sys_td= tf(num, den, 'iodelay', .04)
sys_approx1= pade(sys_td,1)
step(sys,sys_td, sys_approx1)
rlocus(sys_approx1)


