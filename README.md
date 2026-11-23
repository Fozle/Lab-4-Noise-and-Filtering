# Lab 4 – Noise and Filtering

## Objective

The objective of this experiment was to investigate different image noise types and compare filtering methods using MATLAB. I used Gaussian noise, salt-and-pepper noise, mean filtering, Gaussian filtering and median filtering.

## 1. Adding Different Noise Types

I added Gaussian noise and salt-and-pepper noise to the original grayscale image.

Gaussian noise created small random intensity changes across the image. Salt-and-pepper noise created random black and white pixels.

## 2. Measuring Image Quality

I used Mean Squared Error (MSE) and Signal-to-Noise Ratio (SNR) to evaluate image quality.

A lower MSE means less difference from the original image. A higher SNR means better image quality.

## 3. Linear Filtering

I tested mean and Gaussian filters.

The mean filter reduced noise by averaging neighbouring pixels. The Gaussian filter gave more weight to nearby pixels and produced smooth results.

Both filters reduced noise but could also blur image edges.

## 4. Median Filtering

I applied a 3x3 median filter to both noisy images.

The median filter replaces each pixel with the median value of its neighbours. It is especially effective for salt-and-pepper noise because it removes extreme black and white pixels while preserving more edges.

## 5. Results and Comparison

The visible MATLAB results showed:

| Filter | MSE | SNR |
|---|---:|---:|
| Mean | 0.0021 | 18.06 dB |
| Gaussian | 0.0031 | 16.40 dB |
| Median | 0.0001 | 30.43 dB |

The median filter gave the lowest MSE and highest SNR among these displayed results.

## 6. Reflections

### 1. Which noise is best removed by median filtering? Why?

Salt-and-pepper noise is best removed by median filtering. The median operation removes extreme black and white pixels without averaging them with surrounding pixels.

### 2. Why does linear filtering blur edges more?

Linear filters calculate weighted averages of neighbouring pixels. This mixes pixels from both sides of an edge and makes the edge less sharp.

### 3. How could we design adaptive filters to preserve detail?

An adaptive filter could change its filter strength depending on local image information. It could use stronger filtering in noisy flat areas and weaker filtering near important edges.

## Conclusion

This experiment showed that different noise types need different filtering methods. Median filtering is particularly useful for salt-and-pepper noise. MSE and SNR help compare the performance of filters.

## AI Usage

**Tool used:** ChatGPT

**How I used it:** I used ChatGPT to understand noise types, MATLAB filtering commands, MSE and SNR.

**What I verified or changed:** I ran the MATLAB script, checked the generated figures and examined the MSE and SNR results.
