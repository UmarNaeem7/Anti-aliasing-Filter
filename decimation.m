function [e] = decimation(image,rows,cols)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
A = image;
[p,q,r] = size(A);
b = zeros(size(A));

k = 1; l = 1;

%decimate rows
for i=1:rows:p
    for j=1:q
        b(k,j,:) = A(i,j,:);
    end
    k = k + 1;
end

c = zeros(size(b));
%decimate cols
for i=1:k
    for j=1:cols:q
        c(i,l,:) = b(i,j,:);
        l = l + 1;
        l1 = l;
    end
    l = 1;
end

d = zeros(k-1, l1-1, r);
d(1:end, 1:end, :) = c(1:k-1, 1:l1-1, :);

e = uint8(d);

end

