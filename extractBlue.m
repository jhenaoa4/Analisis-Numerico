%% embedding

% Reads the RGB colour image into which the message is to be embedded and Extract
% the blue component of the host image.
function extractBlue(filename)
img = imread(filename);
imshow(img)
blue = img(:,:,3);
a = zeros(size(img, 1), size(img, 2));
just_blue = cat(3, a, a, blue);
figure, imshow(just_blue)
end