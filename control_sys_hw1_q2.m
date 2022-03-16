r= 1:1:4;
for i=16:2:24
    n= 1-(1/i^0.4).*(1/1.4).*((r.^1.4 -1)./(r-1));
    plot(r,n)
    hold on
end
hold off
ylabel('thermodynamic efficiency, n')
xlabel('Injection Ratio')
legend('e=16','e=18','e=20','e=22','e=24')