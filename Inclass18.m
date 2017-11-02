% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

yeast = imread('yeast.tif');
imshow(yeast, []);

% Smoothing followed by edge detection
yeast_smooth = imfilter(yeast, fspecial('gaussian', 7, 5));
fsobel = fspecial('sobel');
fsobel2 = fsobel';
y = imfilter(double(yeast_smooth), fsobel2);
x = imfilter(double(yeast_smooth), fsobel);
edges = sqrt(x.^2 + y.^2);
imshow(edges, []);

% Finding circles

[centers, radii] = imfindcircles(edges, [18 42], 'Sensitivity', 0.90);
figure; imshow(edges, []); hold on;
for ii = 1:length(centers) 
    drawcircle(centers(ii, :), radii(ii), 'm');
end

% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

% (A).
set1 = randi(9, 1, 10);
set2 = randi(10, 1, 10);
[is_sig, pval] = ttest(set1, set2)
is_sig =

     0


pval =

    0.4555
% p-value is not sufficient for statistical significance in this case

% (B).
xx = randi(9,1,10);
yy = randi(10,1,10);
[is_sig, pval] = ttest(xx, yy)
is_sig =

     0


pval =

    0.8723
    
xx = randi(9,1,10);
yy = randi(10,1,10);
[is_sig, pval] = ttest(xx, yy)
is_sig =

     0


pval =

    0.9099
    
xx = randi(9,1,10);
yy = randi(10,1,10);
[is_sig, pval] = ttest(xx, yy)
is_sig =

     0


pval =

    0.8227
% None of these results proved to be significant

% (C). Part 1 (100 numbers in set)
xx = randi(9,1,100);
yy = randi(10,1,100);
[is_sig, pval] = ttest(xx, yy)
is_sig =

     1


pval =

    0.0436
    
xx = randi(9,1,100);
yy = randi(10,1,100);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     0


pval =

    0.0560
    
xx = randi(9,1,100);
yy = randi(10,1,100);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     0


pval =

    0.9202
    
xx = randi(9,1,100);
yy = randi(10,1,100);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     0


pval =

    0.6471

% These trials show that number sets of 100 numbers will sometimes show
% statistical significance, but not usually.

% (C). Part 2 (1000 numbers in a set)
xx = randi(9,1,1000);
yy = randi(10,1,1000);
[is_sig, pval] = ttest(xx, yy)
is_sig =

     1


pval =

   3.2664e-05
   
xx = randi(9,1,1000);
yy = randi(10,1,1000);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     1


pval =

    0.0020
    
xx = randi(9,1,1000);
yy = randi(10,1,1000);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     1


pval =

   2.4292e-07
   

xx = randi(9,1,1000);
yy = randi(10,1,1000);
[is_sig, pval] = ttest(xx, yy)

is_sig =

     1


pval =

    0.0137
    
% These trials show that number sets of 1000 numbers will very often 
% show statistical significance; this is true of large number sets