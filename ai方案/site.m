warning off
close all
clear 
clc
% Project 1: TEM image analysis

% Load TEM image
tem_image = imread('项目一改.jpg');

% Perform peak detection to find atomic positions
atom_positions = imregionalmax(tem_image);

% Compute atomic contrast and classify atoms
contrast = zeros(size(atom_positions));
window_size = 3; % Size of window to compute contrast

element_names = {'H', 'He', 'Li', 'Be'}; % Element names
contrast_ranges = [50, 100; 100, 150; 150, 200; 200, 255]; % Contrast ranges for each element

atomic_numbers = [1, 2, 3, 4]; % Atomic numbers for each element
atomic_species = zeros(size(atom_positions));

for i = 1:size(atom_positions,1)
    for j = 1:size(atom_positions,2)
        if atom_positions(i,j) == 1
            window = tem_image(i-floor(window_size/2):i+floor(window_size/2), j-floor(window_size/2):j+floor(window_size/2));
            contrast(i,j) = max(window(:)) - min(window(:));
            for k = 1:length(contrast_ranges)
                if contrast(i,j) >= contrast_ranges(k,1) && contrast(i,j) <= contrast_ranges(k,2)
                    atomic_species(i,j) = atomic_numbers(k);
                end
            end
        end
    end
end

% Plot atomic positions on original image
figure
imshow(tem_image);
hold on
colors = {'r', 'g', 'b', 'c'}; % Colors for each element
for k = 1:length(atomic_numbers)
    [row, col] = find(atomic_species == atomic_numbers(k));
    centers = [col, row];
    radii = ones(length(row), 1)*2; % Radius of circles
    viscircles(centers, radii, 'Color', colors{k}, 'LineWidth', 0.5);
end
