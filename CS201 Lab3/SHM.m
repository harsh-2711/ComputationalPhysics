function f = shm(t,u)

f=zeros(length(u),1);
f(1)=u(2);
f(2)=-9.8*u(1);
