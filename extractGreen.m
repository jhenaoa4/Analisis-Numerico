%% embedding

% Reads the RGB colour image into which the message is to be embedded and Extract
% the green component of the host image.
function extractGreen(filename)
img = imread(filename);
imshow(img)
green = img(:,:,2);
a = zeros(size(img, 1), size(img, 2));
just_green = cat(3, a, green, a);
figure, imshow(just_green)
end