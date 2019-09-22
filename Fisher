clc,clear
N=200;
mu = [-5 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,N);
mu = [5 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,N);
X=r1';
X1=r2';
x=-0.1:0.001:0.1;
m1=zeros(2,1);
m1(1)=sum(X(1,:))/N;
m1(2)=sum(X(2,:))/N;
m2=zeros(2,1);
m2(1)=sum(X1(1,:))/N;
m2(2)=sum(X1(2,:))/N;
S1=0;
S2=0;
for i=1:N
    S1=S1+count2(X(:,i),m1);
end
for i=1:N
    S2=S2+count2(X1(:,i),m2);
end
S=S1+S2;
W=S\(m1-m2);
mm1=W'*m1;
mm2=W'*m2;
y=(mm1+mm2)/2;
Y1=W'*X;
Y2=W'*X1;
plot(Y1,Y1,'r+',Y2,Y2,'*',x,f(x,y),'g')
function z=count2(x,y)
    z=(x-y)*(x-y)';
end
function y=f(x,yt)
    y=-x+2*yt;
end


