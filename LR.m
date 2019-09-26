%% 第三题
clc,clear
mu = [-5 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
mu = [5 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
%必要的初始化过程
x=-1:0.01:1;
w_ini=[0,0,0]';%初始化向量参数
W1=SSerr([X;X1],Y);
W2=LMSalg([X;X1],Y,w_ini);
subplot(2,1,1)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W2(1),W2(2),W2(3)));
subplot(2,1,2)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W1(1),W1(2),W1(3)));


%% 第四题
clc,clear
mu = [-2 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
mu = [2 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
x=-1:0.01:1;
w_ini=[1,0,0]';
W1=SSerr([X;X1],Y);
W2=LMSalg([X;X1],Y,w_ini);
subplot(2,1,1)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W2(1),W2(2),W2(3)));
subplot(2,1,2)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W1(1),W1(2),W1(3)));


%% 第五题
clc,clear
mu = [-1 0];
SIGMA = [1 0; 0 1];
r1 = mvnrnd(mu,SIGMA,200);
mu = [1 0];
SIGMA = [ 1 0; 0 1];
r2 = mvnrnd(mu,SIGMA,200);
X=[ones(200,1) r1];
X1=[ones(200,1) r2];
Y=[ones(200,1);ones(200,1).*(-1)];
x=-1:0.01:1;
w_ini=[1,0,0]';
W1=SSerr([X;X1],Y);
W2=LMSalg([X;X1],Y,w_ini);
subplot(2,1,1)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W2(1),W2(2),W2(3)));
subplot(2,1,2)
plot(r1(:,1),r1(:,2),'r+',r2(:,1),r2(:,2),'*',x,f(x,W1(1),W1(2),W1(3)));


%%  第一题
function y=SSerr(X,Y)  %最小化平方差
    y=(X'*X)\X'*Y;
end


%%  第二题   
function y=LMSalg(X,Y,w_ini)  %LMS
    w=w_ini;
    for i =1:10000
        e=count1(w,X,Y,size(X,1));
        w=countw(e,w,0.01);
    end
    y=w;
end
function y=count1(w,A,Y,N)  %计算梯度
    y=2*(A'*A*w-A'*Y)/N;
end
function w=countw(e,w,yita)  %更新
    w=w-yita*e;
end
%%
function y=f(x,w0,w1,w2)
    y=-w0/w2-w1/w2.*x;
end
