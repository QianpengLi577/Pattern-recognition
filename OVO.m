clc,clear
mu = [-5 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
mu = [5 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
mu = [0 5];
SIGMA = [1 0; 0 1];
r3 = mvnrnd(mu,SIGMA,200);
x=-4:0.01:1;
A=0;%用于输出是哪一个类别
x1=[ones(200,1) r1];
x2=[ones(200,1) r2];
x3=[ones(200,1) r3];
X1=[x1;x3];
X2=[x2;x3];
X3=[x1;x2];
Y1=[ones(200,1);ones(200,1).*(-1)];  %1-3
Y2=[ones(200,1);ones(200,1).*(-1)];  %2-3
Y3=[ones(200,1);ones(200,1).*(-1)];  %1-2
w_ini=[-2,0,0];
W1=Perce(X1,Y1,10000,w_ini);
W2=Perce(X2,Y2,10000,w_ini);
W3=Perce(X3,Y3,10000,w_ini);
X=[1,-4,2];%验证
plot(r1(:,1),r1(:,2),'r+',r3(:,1),r3(:,2),'*',r2(:,1),r2(:,2),'+',x,f(x,W1(1),W1(2),W1(3)),x,f(x,W2(1),W2(2),W2(3)),x,f(x,W3(1),W3(2),W3(3)),X(2),X(3),'o')
flag=[W1*X',W2*X',W3*X'];
if (sign(flag(1))==1)&&(sign(flag(3))==1)
    A=1;
elseif (sign(flag(2))==1)&&(sign(flag(3))==-1)
    A=2;
elseif (sign(flag(1))==-1)&&(sign(flag(2))==-1)
    A=3;
end
function y=Perce(X,Y,itea,w_ini)
    w=w_ini;
    t=1;
    while t<itea
        for i=1:size(X,1)
            if sign(w*X(i,:)')~=Y(i)
                w=w+Y(i).*X(i,:);
            end
            t=t+1;
        end
    end
    y=w;
end
function y=f(x,w0,w1,w2)
    y=-w0/w2-w1/w2.*x;
end
