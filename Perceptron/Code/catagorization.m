function [ y ] = catagorization( w , x )
%CATAGORIZATION Summary of this function goes here
%   Detailed explanation goes here
y = sign(w' * x');
end

