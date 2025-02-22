# Matched Filter Using Neural Nets

## Motivation
Many underwater recordings include background noise or reverberations, and simple linear filtering is often insufficient to separate short-duration transient clicks. A matched filter is a linear filter designed to maximize the output signal-to-noise ratio (SNR) for a known signal in noisy data. Mathematically, it is implemented by convolving the recorded (input) signal with the time-reversed version of the reference (known) signal. The resulting output exhibits a prominent peak when the reference signal is present in the input, thereby facilitating signal detection even in the presence of significant noise.

### Analogy of Time-Flipping
Say you have a left footprint. If you try to match this with many footprints, it might not match because of the curves. However, if you flip it, the match can be found perfectly.

## Data Preparation
### Inputs
**Raw Audio Frames:** The original underwater recordings, chopped into frames (e.g., 14, 21, 38, or 42 samples per frame). Each frame is passed into the network as a single training input vector.

### Outputs (Labels)
**Matched Filter Outputs:** For each corresponding audio frame, the document first computes a standard matched-filter result by convolving the raw audio with a time-reversed, handpicked “reference click.” These matched-filter waveforms (one frame at a time) serve as the ground-truth labels the network must learn to reproduce.

## Denoising Algorithm
### Approach: Non-Linear Spectral Subtraction
#### Key Steps:
1. **Time-Frequency Analysis:**
   - Transform each audio frame to the frequency domain (FFT).
   - Separate magnitude and phase components.
2. **Non-Linear Suppression of Noise:**
   - A non-linear function (e.g., \( f(x) = \frac{x^2}{x+c} \) or \( \frac{x}{x+c} \)) is applied to each frequency bin’s magnitude to attenuate lower-level (noisy) magnitudes more aggressively than strong signal components.
   - The choice of function and constant \( c \) is made so that quieter portions are suppressed and prominent frequencies (such as those in a whale click) are largely preserved.
3. **Phase Preservation and Reconstruction:**
   - The denoised magnitude is combined with the original phase.
   - Inverse FFT and overlap-add techniques reconstruct the time-domain audio.

## Neural Network–Based Matched Filter
### Training Setup
- **Dataset:** ~80 seconds of audio collected from multiple species of marine mammals (e.g., sperm whales, dolphins), each about 20 seconds in duration. These are concatenated or considered separately, then split into frames (e.g., 14, 21, 38, or 42 samples/frame).
- **Network Architecture:** Multi-Layer Perceptron (MLP) with:
  - One or two hidden layers.
  - 15–22 neurons per hidden layer (depending on the frame dimension).
  - Hyperbolic tangent (tansig) activation.
  - Learning rate on the order of \( 10^{-8} \) or \( 10^{-9} \), momentum ~0.01.
  - 30 epochs of training.

### Inputs and Outputs
- **Input:** Framed raw audio signals.
- **Target/Label:** Matched-filter outputs (computed by convolving each audio signal with a handpicked click, then denoising).

### Performance Achieved (MSE and PSNR)
- **Mean Squared Errors (final training + validation):** On the order of \( 10^{-5} \) to \( 10^{-6} \).
  - For example, MSE ~\( 5 \times 10^{-5} \) for 14-dimensional framing.
- **PSNR values:** For the neural network’s matched-filtered output vs. the conventional matched filter output are typically in the mid-40s in decibels (e.g., around 44 dB).

## Neural Network–Based Click Extraction
### Training Setup
- **Dataset:** Similar audio recordings, but now the target for each frame is just the “clean” click (no background noise).
- **Network Architecture:** Also an MLP, using similar hyperparameters (with small variations in hidden-layer size).
- **Training:** 30 epochs, same learning strategies (backpropagation with mini-batches and momentum).

### Inputs and Outputs
- **Input:** Framed raw audio signals.
- **Target/Label:** Hand-segmented or “click-only” waveforms.

### Performance Achieved
- **MSE:** Also on the order of \( 10^{-5} \) (varies depending on frame dimension).
- **Subjective Listening Tests:** Suggested the extracted clicks closely resembled the real clicks, with minimal noise.

## RNN–Based Matched Filter (Brief Exploration)
### Training Setup
- **Dataset:** Subset or similar framing strategy as the MLP approach.
- **Network Architecture:** A simple recurrent neural network (RNN) tested as a proof of concept.
- **Performance:** MSE results also in the low \( 10^{-5} \) range after training; the report indicates more sophisticated RNNs (e.g., LSTM/GRU) could perform better with more extensive experiments.

## Key Takeaways
- **MLP-based networks:** For matched filtering and click extraction both consistently reached MSE ~\( 10^{-5} \) and PSNR ~44 dB, indicating they closely replicate the ground-truth signals.
- **RNN-based matched filtering:** Likewise achieved low MSE, but the report suggests further refinements (longer training, LSTM/GRU cells) could improve sequence handling.
- **Performance Metrics:** No single “classification accuracy” metric is given because these are regression-style tasks (reconstructing waveforms). Performance is therefore measured by MSE/PSNR rather than a percentage classification accuracy.