% author: A. Panichella
% title: An Adaptive Evolutionary Algorithm based on Non-Euclidean Geometry for Many-objective Optimization
% venue: GECCO 2019

function [indexes] = FindCornerSolutions(front)
[m,n] = size(front);

%% let's normalize the objectives
if m<=n
  indexes = 1:m;
  return
end

%% let's define the axes of the n-dimensional spaces 
W = zeros(n)+1e-6+eye(n);
[r,~]= size(W);
indexes = zeros(1,n);
for i=1:r
   [~, index] = min(Point2LineDistance(front, zeros(1,n), W(i,:)));
   indexes(i) = index;
end

end