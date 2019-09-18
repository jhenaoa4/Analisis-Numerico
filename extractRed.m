%% embedding

% Reads the RGB colour image into which the message is to be embedded and Extract
% the red component of the host image.
function extractRed(filename)
img = imread(filename);
imshow(img)
red = img(:,:,1);
a = zeros(size(img, 1), size(img, 2));
just_red = cat(3, red, a, a);
figure, imshow(just_red)
end