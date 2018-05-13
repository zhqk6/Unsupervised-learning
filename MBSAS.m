function [bel,mean] = MBSAS(x,theta,q,order);
% MBSAS algorithm function
% Parameters:
% outputs:bel is the corresponding cluster, mean is the mean value of the cluster
% inputs: x is input vectors, theta is the threshold value, q is the maximum of clusters' number,
% order is the suquence of input x
[~,n]=size(x);

% x1=[];
% if length(order)==n;
%     for i=1:n
%         x1=[x1 x(:,order(i))];
%     end
%     x=x1;
%     clear x1;
% end

%Determine the sequence of x
ClusterNumber = 1;
bel=zeros(1,n);
bel(1)=ClusterNumber;
mean=x(:,order(1));
[~,n]=size(x);
for i=2:n
    [a1,a2]=size(mean);
    [b1,b2]=min(sqrt(sum((mean-x(:,order(i))*ones(1,a2)).^2)));
    %find the closest cluster
    %a1 is the number of eigenvalue, a2 is the number of cluster
    %b1 is the min distance (x(i) to other clusters)
    %b2 is the corresponding bel
    if b1>theta && ClusterNumber <q;
      ClusterNumber=ClusterNumber+1;
      bel(order(i))=ClusterNumber;
      mean=[mean x(:,order(i))];
    end
end
 [a1,a2]=size(mean);
for i=1:n
    if bel(order(i))==0
        [b1,b2]=min(sqrt(sum((mean-x(:,order(i))*ones(1,a2)).^2)));
        bel(order(i))=b2;
        mean(:,b2)=((sum(bel==b2)-1)*mean(:,b2)+x(:,order(i)))/(sum(bel==b2));
        %Pattern classification to find the center (mean) of the cluster
    end
end
