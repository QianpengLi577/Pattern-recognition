%%
clc,clear
X=[119.30,26.08,1;%福州市
   121.5,25.03,1;%台北市
   113.33,22.13,1;%澳门
   118.67,24.88,1;%泉州市
   118.08,24.48,1;%厦门市
   120.70,28.00,1;%温州市
   127.32,24.77,1;%宫古岛
   127.68,26.21,1;%那霸
   124.17,24.41,1;%石恒
   130.63,31.56,1];%输入的点集（x1,x2,1）
Y=[1;1;1;1;1;1;-1;-1;-1;-1];%所对应的标签
H =  [1  0  0
      0  1  0
      0  0  0];
A = -1*Y.*X;
b = -1*ones(size(X,1),1);
[x,fval,exitflag,output,lambda] = quadprog(H,[],A,b,[],[],[]);
XC=[123.47,25.74,1];
sign(XC*x)
%%
clc,clear
X=[119.30,26.08,1;%福州市
   121.5,25.03,1;%台北市
   113.54,22.20,1;%澳门
   118.67,24.88,1;%泉州市
   118.08,24.48,1;%厦门市
   120.70,28.00,1;%温州市
   30.59,114.30,1;%武汉
   28.22,112.93,1;%长沙
   127.32,24.77,1;%宫古岛
   127.68,26.21,1;%那霸
   124.17,24.41,1;%石恒
   132.27,34.24,1;%广岛
   129.87,32.75,1;%长崎
   130.63,31.56,1];%输入的点集（x1,x2,1）
Y=[1;1;1;1;1;1;1;1;-1;-1;-1;-1;-1;-1];%所对应的标签
H =  [1  0  0
      0  1  0
      0  0  0];
A = -1*Y.*X;
b = -1*ones(size(X,1),1);
[x,fval,exitflag,output,lambda] = quadprog(H,[],A,b,[],[],[]);
XC=[123.47,25.74,1];
sign(XC*x)
