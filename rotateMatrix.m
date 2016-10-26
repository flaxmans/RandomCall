function newmat = rotateMatrix(m,deg)

if nargin < 2
    deg = 180;
end
nrot = round(deg/90);

for n = 1:nrot
    [r,c] = size(m);
    newmat = zeros(c,r);

    for i = 1:r
        wr = m(i,:);
        newmat(1:c,i) = wr(c:-1:1);
    end
    m = newmat;
end

