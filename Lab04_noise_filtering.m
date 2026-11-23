
%% Lab 4: Noise and Filtering
% Gaussian Noise, Salt-and-Pepper Noise and Image Filtering

close all;
clear;
clc;

%% Load and prepare image

if exist('peppers.png','file')
    I0 = imread('peppers.png');
else
    I0 = repmat(imread('cameraman.tif'),1,1,3);
end

if size(I0,3) == 3
    I = im2double(rgb2gray(I0));
else
    I = im2double(I0);
end

%% 1) Add Different Noise Types

I_gauss = imnoise(I,'gaussian',0,0.01);
I_sp = imnoise(I,'salt & pepper',0.05);

figure(1);

montage({I,I_gauss,I_sp},'Size',[1 3]);

title('Original | Gaussian Noise | Salt-and-Pepper Noise');

%% 2) Calculate MSE and SNR Before Filtering

MSE_gauss = immse(I_gauss,I);
MSE_sp = immse(I_sp,I);

% Calculate SNR in dB
SNR_original = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I(:)).^2 + eps));

SNR_gauss = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_gauss(:)).^2));

SNR_sp = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_sp(:)).^2));

fprintf('\nRESULTS BEFORE FILTERING\n');
fprintf('Gaussian Noise MSE: %.4f\n',MSE_gauss);
fprintf('Salt-and-Pepper MSE: %.4f\n',MSE_sp);
fprintf('Gaussian Noise SNR: %.4f dB\n',SNR_gauss);
fprintf('Salt-and-Pepper SNR: %.4f dB\n',SNR_sp);

%% 3) Mean and Gaussian Filtering

h_avg = fspecial('average',3);

I_avg_gauss = imfilter(I_gauss,h_avg,'replicate');
I_avg_sp = imfilter(I_sp,h_avg,'replicate');

h_gauss = fspecial('gaussian',[3 3],0.7);

I_gauss_filtered = imfilter(I_gauss,h_gauss,'replicate');
I_gauss_sp_filtered = imfilter(I_sp,h_gauss,'replicate');

%% 4) Median Filtering

I_med_gauss = medfilt2(I_gauss,[3 3]);
I_med_sp = medfilt2(I_sp,[3 3]);

%% 5) Compare Filtering Results

figure(2);

montage({I,I_gauss,I_avg_gauss, ...
    I_gauss_filtered,I_med_gauss},'Size',[1 5]);

title('Gaussian Noise: Original | Noisy | Mean | Gaussian | Median');

figure(3);

montage({I,I_sp,I_avg_sp, ...
    I_gauss_sp_filtered,I_med_sp},'Size',[1 5]);

title('Salt-and-Pepper: Original | Noisy | Mean | Gaussian | Median');

%% 6) Calculate MSE and SNR After Filtering

% Gaussian noise results
MSE_avg_gauss = immse(I_avg_gauss,I);
MSE_filter_gauss = immse(I_gauss_filtered,I);
MSE_med_gauss = immse(I_med_gauss,I);

SNR_avg_gauss = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_avg_gauss(:)).^2));

SNR_filter_gauss = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_gauss_filtered(:)).^2));

SNR_med_gauss = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_med_gauss(:)).^2));

% Salt-and-pepper noise results
MSE_avg_sp = immse(I_avg_sp,I);
MSE_filter_sp = immse(I_gauss_sp_filtered,I);
MSE_med_sp = immse(I_med_sp,I);

SNR_avg_sp = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_avg_sp(:)).^2));

SNR_filter_sp = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_gauss_sp_filtered(:)).^2));

SNR_med_sp = 10*log10(sum(I(:).^2) / ...
    sum((I(:)-I_med_sp(:)).^2));

%% 7) Display Results

fprintf('\nGAUSSIAN NOISE FILTERING RESULTS\n');
fprintf('Noisy MSE: %.4f | SNR: %.2f dB\n',MSE_gauss,SNR_gauss);
fprintf('Mean MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_avg_gauss,SNR_avg_gauss);
fprintf('Gaussian MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_filter_gauss,SNR_filter_gauss);
fprintf('Median MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_med_gauss,SNR_med_gauss);

fprintf('\nSALT-AND-PEPPER NOISE FILTERING RESULTS\n');
fprintf('Noisy MSE: %.4f | SNR: %.2f dB\n',MSE_sp,SNR_sp);
fprintf('Mean MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_avg_sp,SNR_avg_sp);
fprintf('Gaussian MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_filter_sp,SNR_filter_sp);
fprintf('Median MSE: %.4f | SNR: %.2f dB\n', ...
    MSE_med_sp,SNR_med_sp);

%% 8) Save All Figures

for k = 1:3
    figure(k);
    filename = sprintf('Lab04_figure_%02d.png',k);
    saveas(gcf,filename);
end

fprintf('\nAll three figures saved successfully.\n');
