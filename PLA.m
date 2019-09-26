%% 2题
clc,clear
mu = [-5 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
plot(r1(:,1),r1(:,2),'r+');
hold on;
mu = [5 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
plot(r2(:,1),r2(:,2),'*');
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
x=-2:0.01:2;
w_ini=[-1,0,0];
W=Perce([X;X1],Y,10000,w_ini)
hold on;
plot(x,f(x,W(1),W(2),W(3)))
%% 3题
clc,clear
mu = [-2 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
plot(r1(:,1),r1(:,2),'r+');
hold on;
mu = [2 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
plot(r2(:,1),r2(:,2),'*');
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
x=-2:0.01:2;
w_ini=[0,0,0];
W=Perce([X;X1],Y,10000,w_ini)
hold on;
plot(x,f(x,W(1),W(2),W(3)))
%% 4题
clc,clear
mu = [-1 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
plot(r1(:,1),r1(:,2),'r+');
hold on;
mu = [1 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
plot(r2(:,1),r2(:,2),'*');
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
x=-2:0.01:2;
w_ini=[-1,0,0];
W=Perce([X;X1],Y,100000,w_ini)
hold on;
plot(x,f(x,W(1),W(2),W(3)))
%%
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
