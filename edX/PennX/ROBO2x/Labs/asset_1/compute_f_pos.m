function [ f, pos ] = compute_f_pos( d1_ref, d2_ref, H1, H2, ratio, f_ref )
% compute camera focal length and camera position to achieve centain ratio
% between objects
%
% Input:
% - d1_ref: distance of the first object
% - d2_ref: distance of the second object
% - H1: height of the first object in physical world
% - H2: height of the second object in physical world
% - ratio: ratio between two objects (h1/h2)
% - f_ref: 1 by 1 double, previous camera focal length
% Output:
% - f: 1 by 1, camera focal length
% - pos: 1 by 1, camera position

    % calculate h1 and h2
    h1 = f_ref .* H1 ./ d1_ref;
    h2 = f_ref .* H2 ./ d2_ref;
    
    h1_n = h1;
    h2_n = h1_n ./ ratio;
    
    % calculate the position
    pos = ((h2_n .* H1 .* d2_ref) - (h1_n .* H2 .* d1_ref))/((h2_n .* H1) - (h1_n .* H2));
    
    % calculate the focal length
    f = (h1 ./ H1) .* (d1_ref - pos);

end

