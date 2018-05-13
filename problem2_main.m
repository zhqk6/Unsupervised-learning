x1=[1 1 2 2 3 3 4 4 5 5 -4 -3  -4  -3;
    1 2 2 3 3 4 4 5 5 6  5  5  4  4 ];
theta=sqrt(2);
q=14;
order1=[1 2 3 4 5 6 7 8 9 10 11 12 13 14];
order2=[1 10 2 3 4 11 12 5 6 7 13 8 14 9];
order3=[1 10 5 2 3 11 12 4 6 7 13 14 8 9];
figure;
plot(x1(1,:),x1(2,:),'*');
title('original data');
[bel1,m1]=BSAS(x1,theta,q,order1);
[bel2,m2]=MBSAS(x1,theta,q,order1);
[bel3,m3]=BSAS(x1,theta,q,order2);
[bel4,m4]=MBSAS(x1,theta,q,order2);
[bel5,m5]=BSAS(x1,theta,q,order3);
[bel6,m6]=MBSAS(x1,theta,q,order3);
ClusterNumber1=max(bel1);
ClusterNumber2=max(bel2);
ClusterNumber3=max(bel3);
ClusterNumber4=max(bel4);
ClusterNumber5=max(bel5);
ClusterNumber6=max(bel6);
Color = 'bgrcmyk';
%Create a color vector so that it will mark with different color
figure;
subplot(3,2,1);
for i=1:ClusterNumber1
    plot(x1(1,bel1==i),x1(2,bel1==i),[Color(i) '.']);
    hold on;
    plot(m1(1,i),m1(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('BSAS  in order1');
subplot(3,2,2);
for i=1:ClusterNumber2
    plot(x1(1,bel2==i),x1(2,bel2==i),[Color(i) '.']);
    hold on;
    plot(m2(1,i),m2(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('MBSAS  in order1');
subplot(3,2,3);
for i=1:ClusterNumber3
    plot(x1(1,bel3==i),x1(2,bel3==i),[Color(i) '.']);
    hold on;
    plot(m3(1,i),m3(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('BSAS  in order2');
subplot(3,2,4);
for i=1:ClusterNumber4
    plot(x1(1,bel4==i),x1(2,bel4==i),[Color(i) '.']);
    hold on;
    plot(m4(1,i),m4(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('MBSAS  in order2');
subplot(3,2,5);
for i=1:ClusterNumber5
    plot(x1(1,bel5==i),x1(2,bel5==i),[Color(i) '.']);
    hold on;
    plot(m5(1,i),m5(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('BSAS  in order3');
subplot(3,2,6);
for i=1:ClusterNumber6
    plot(x1(1,bel6==i),x1(2,bel6==i),[Color(i) '.']);
    hold on;
    plot(m6(1,i),m6(2,i),'o','MarkerEdgeColor','k','MarkerFaceColor',Color(i),'MarkerSize',10)
end
title('MBSAS  in order3');