clc,clear
N=10;
X=[];%数据集
QQ=[];%转换矩阵
for i=1:N
    p=imread(strcat('I:/',num2str(i),'.jpg'));
    p=rgb2gray(p);
    [m,n]=size(p);
    t=1;
    P=[];
    for x=1:m
        for y=1:n
            P(t)=p(x,y);
            t=t+1;
        end
    end
    X=[X,P'];
end%这段完成的是对x的输入
U=[];
for i=1:size(X,1)
   U(i)=sum(X(i,:))/N; 
end%均值化
X=X-U';
D=X*X';%协方差
[A,B]=eig(D);%求特征向量以及特征值   A为特征向量，B为特征值
[AA,BB]=sort(diag(B),'descend');
for i=1:200
    QQ=[QQ;A(:,BB(i))'];
end
Y=QQ*X;
p=imread('I:/11.jpg');
p=rgb2gray(p);
[m,n]=size(p);
t=1;
P=[];
for x=1:m
    for y=1:n
        P(t)=p(x,y);
        t=t+1;
    end
end
P=P';
P=P-U';
Y1=QQ*P;
DIS=zeros(1,10);
for i =1:10
    DIS(i)=dist(Y1',Y(:,i));
end
loc=find(DIS==max(DIS));
p=imread(strcat('I:/',loc,'.jpg'));
subplot(1,2,1)
imshow(p)
subplot(1,2,2)
imshow('I:/11.jpg')


