clear;
x=[8.9 14.0 4.3 19.9 2.1 28.0 3.6 1.3 4.3;
13.5 9.3 4.1 17.5 4.5 26.6 5.7 2.1 4.0;
18.0 9.9 3.3 19.5 5.7 28.1 4.8 2.4 6.5;
13.9 10.0 4.7 25.8 2.2 24.0 6.2 1.6 2.9;
 9.5 13.6 3.6 23.4 2.5 22.4 4.2 1.8 3.7;
13.1 10.1 3.1 23.8 2.3 25.6 2.8 2.4 4.9;
17.4 5.7 4.7 20.6 4.3 24.3 4.7 3.4 3.3;
11.4 12.5 4.1 18.8 3.4 18.6 5.2 1.5 3.8];

dissimilarity1=zeros(8,8);
for i=1:8
    for j=1:8
    dissimilarity1(i,j)=pdist2(x(i,:),x(j,:),'Euclidean');
    dissimilarity1(j,i)=dissimilarity1(i,j);
    end
end
[a1,b1]=min(dissimilarity1(dissimilarity1~=0));
[m1,n1]=find(dissimilarity1==a1);
%m1=[4 6];n1=[6,4]
x(9,:)=0;
for i=1:9
    x(9,i)=(x(m1(1),i)+x(n1(1),i))/2;
end

x1=zeros(7,9);
x1(4,:)=x(5,:);
for i=1:3
x1(i,:)=x(i,:);
end
for i=5:7
x1(i,:)=x(i+2,:);
end

% now
% x = 
% 
%     8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%    13.5000    9.3000    4.1000   17.5000    4.5000   26.6000    5.7000    2.1000    4.0000
%    18.0000    9.9000    3.3000   19.5000    5.7000   28.1000    4.8000    2.4000    6.5000
%    13.9000   10.0000    4.7000   25.8000    2.2000   24.0000    6.2000    1.6000    2.9000
%     9.5000   13.6000    3.6000   23.4000    2.5000   22.4000    4.2000    1.8000    3.7000
%    13.1000   10.1000    3.1000   23.8000    2.3000   25.6000    2.8000    2.4000    4.9000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    11.4000   12.5000    4.1000   18.8000    3.4000   18.6000    5.2000    1.5000    3.8000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%   (row 4 and 6 are merged together and row 9 is the newly cluster R1)
% x1 =
% 
%     8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%    13.5000    9.3000    4.1000   17.5000    4.5000   26.6000    5.7000    2.1000    4.0000
%    18.0000    9.9000    3.3000   19.5000    5.7000   28.1000    4.8000    2.4000    6.5000
%     9.5000   13.6000    3.6000   23.4000    2.5000   22.4000    4.2000    1.8000    3.7000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    11.4000   12.5000    4.1000   18.8000    3.4000   18.6000    5.2000    1.5000    3.8000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%   (x1 deletes x's row 4 and 6 and the newly cluster is row 7 in x1 )

dissimilarity2=zeros(7,7);
for i=1:7
    for j=1:7
        dissimilarity2(i,j)=pdist2(x1(i,:),x1(j,:),'Euclidean');
        dissimilarity2(j,i)=dissimilarity2(i,j);
    end
end
[a2,b2]=min(dissimilarity2(dissimilarity2~=0));
[m2,n2]=find(dissimilarity2==a2);
x(10,:)=0;
%m2=[3,2] n2=[2,3]
for i=1:9
    x(10,i)=(x1(m2(1),i)+x1(n2(1),i))/2;
end


x2=zeros(6,9);
x2(1,:)=x(1,:);
x2(2,:)=x(5,:);
for i=3:6
    x2(i,:)=x(i+4,:);
end
% now 
% x =
% 
%     8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%    13.5000    9.3000    4.1000   17.5000    4.5000   26.6000    5.7000    2.1000    4.0000
%    18.0000    9.9000    3.3000   19.5000    5.7000   28.1000    4.8000    2.4000    6.5000
%    13.9000   10.0000    4.7000   25.8000    2.2000   24.0000    6.2000    1.6000    2.9000
%     9.5000   13.6000    3.6000   23.4000    2.5000   22.4000    4.2000    1.8000    3.7000
%    13.1000   10.1000    3.1000   23.8000    2.3000   25.6000    2.8000    2.4000    4.9000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    11.4000   12.5000    4.1000   18.8000    3.4000   18.6000    5.2000    1.5000    3.8000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%    15.7500    9.6000    3.7000   18.5000    5.1000   27.3500    5.2500    2.2500    5.2500
%    (row 2 and 3 are merged together and row 10 is the newly cluster R2))
% x2=
%    8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%     9.5000   13.6000    3.6000   23.4000    2.5000   22.4000    4.2000    1.8000    3.7000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    11.4000   12.5000    4.1000   18.8000    3.4000   18.6000    5.2000    1.5000    3.8000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%    15.7500    9.6000    3.7000   18.5000    5.1000   27.3500    5.2500    2.2500    5.2500
%   (x2 deletes x1's row 2 and 3 and the newly cluster is row 6 in x2 )

dissimilarity3=zeros(6,6);
for i=1:6
    for j=1:6
        dissimilarity3(i,j)=pdist2(x2(i,:),x2(j,:),'Euclidean');
        dissimilarity3(j,i)=dissimilarity3(i,j);
    end
end
dissimilarity3_=dissimilarity3;
for i=1:4
    for j=1:4
    dissimilarity3_(i,j)=dissimilarity3(i,j)/2;
    end
end
for i=5:6
    for j=5:6
    dissimilarity3_(i,j)=dissimilarity3(i,j)/2;
    end
end
for i=5:6
    for j=1:4
    dissimilarity3_(i,j)=dissimilarity3(i,j)*(2/3);
    end
end
for i=1:4
    for j=5:6
    dissimilarity3_(i,j)=dissimilarity3(i,j)*(2/3);
    end
end
%Because ni*nj/��ni+nj) is 2/3 while comparing the new cluster to old vectors
[a3,b3]=min(dissimilarity3_(dissimilarity3_~=0));
[m3,n3]=find(dissimilarity3_==a3);
%m3=[4,2] n3=[2,4]
x(11,:)=0;
for i=1:9
    x(11,i)=(x2(m3(1),i)+x2(n3(1),i))/2;
end

x3=zeros(5,9);
x3(1,:)=x(1,:);
x3(2,:)=x(7,:);
for i=3:5
x3(i,:)=x(i+6,:);
end

% now 
% x =
% 
%     8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%    13.5000    9.3000    4.1000   17.5000    4.5000   26.6000    5.7000    2.1000    4.0000
%    18.0000    9.9000    3.3000   19.5000    5.7000   28.1000    4.8000    2.4000    6.5000
%    13.9000   10.0000    4.7000   25.8000    2.2000   24.0000    6.2000    1.6000    2.9000
%     9.5000   13.6000    3.6000   23.4000    2.5000   22.4000    4.2000    1.8000    3.7000
%    13.1000   10.1000    3.1000   23.8000    2.3000   25.6000    2.8000    2.4000    4.9000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    11.4000   12.5000    4.1000   18.8000    3.4000   18.6000    5.2000    1.5000    3.8000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%    15.7500    9.6000    3.7000   18.5000    5.1000   27.3500    5.2500    2.2500    5.2500
%    10.4500   13.0500    3.8500   21.1000    2.9500   20.5000    4.7000    1.6500    3.7500
%    (row 5 and 8 are merged together and row 11 is the newly cluster R3))
%  x3 =
% 
%     8.9000   14.0000    4.3000   19.9000    2.1000   28.0000    3.6000    1.3000    4.3000
%    17.4000    5.7000    4.7000   20.6000    4.3000   24.3000    4.7000    3.4000    3.3000
%    13.5000   10.0500    3.9000   24.8000    2.2500   24.8000    4.5000    2.0000    3.9000
%    15.7500    9.6000    3.7000   18.5000    5.1000   27.3500    5.2500    2.2500    5.2500
%    10.4500   13.0500    3.8500   21.1000    2.9500   20.5000    4.7000    1.6500    3.7500
%    (x3 deletes x2's row 2 and 4 and the newly cluster is row 5 in x3)