t = linspace(-1,1,10000);
p = zeros(10000, 5);
q = p;
e = p;
dt = t(2) - t(1);
for kk = 1:5
    p(:,kk) = t.^(kk-1);
end
e(:,1) = p(:,1);
q(:,1) = e(:,1) ./ sqrt(sum(e(:,1).*e(:,1).*dt));

for ii = 2:5
    e(:,ii) = p(:,ii);
    for jj = 1:ii-1
        e(:,ii) = e(:,ii) - sum(p(:,ii).*q(:,jj).*dt) * q(:,jj);
    end
    q(:,ii) = e(:,ii) ./ sqrt(sum(e(:,ii).*e(:,ii).*dt));
end

plot(t,q(:,1));
hold on;
plot(t,q(:,2));
plot(t,q(:,3));
plot(t,q(:,4));
plot(t,q(:,5));
legend('q0','q1','q2','q3','q4');
