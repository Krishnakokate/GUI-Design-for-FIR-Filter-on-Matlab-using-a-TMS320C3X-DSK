# MATLAB FIR Filter GUI for TMS320C3X DSK

This project provides a step-by-step tutorial for building a Matlab Graphical User Interface (GUI) to implement Finite Impulse Response (FIR) filter design on a TMS320C3X DSK. The GUI is driven by Matlab code, allowing users to input various FIR filter parameters, visualize the frequency response, and load FIR filter coefficients to the TMS320C3X DSK.


## Introduction and Motivation

One of the challenges in teaching DSP programs is balancing theoretical concepts and hands-on experience with DSP hardware. This project aims to bridge the gap by using Matlab/DSK GUIs, enabling students to explore DSP principles in Matlab and transfer their designs to a TMS320C3X DSK. This approach offers a practical introduction to DSP hardware without extensive DSP programming.

## Steps to Design FIR Filter GUI in MATLAB

### Step 0: Prerequisites

Ensure you have Matlab with the signal processing toolbox and the 3X DSK software downloaded from TI's website.

### Step 1: Modify Assembly Language File

Find the assembly language file `fir.asm` in the DSK program, copy it to `myfir.asm`, and make necessary modifications.

### Step 2-5: GUI Design Using App Designer

Create a preliminary version of the Matlab/DSK GUI using App Designer. Design elements include text boxes, list boxes, edit boxes, and push buttons. Update element properties such as "String" and "Tag" fields.

### Step 6: Matlab Code

Write Matlab code to drive the GUI. The code reads FIR filter parameters, displays the frequency response, and loads filter coefficients and DSK code to the DSP board.

## Usage

1. Launch the Matlab FIR Filter GUI.
2. Choose filter characteristics such as type, order, and window function.
3. Click "Plot Magnitude Response" to visualize the frequency response.
4. Click "Program DSP" to load FIR filter coefficients and program the TMS320C3X DSK.

## Future Scope

The FIR Filter GUI application can be implemented on hardware, specifically the TMS320C3X DSK. Transitioning from Matlab to actual hardware introduces constraints and considerations for effective utilization.

## Conclusion

This project presents a GUI for FIR filter design using Matlab and TMS320C3X DSK. Users can interactively design FIR filters, visualize responses, and program the hardware without extensive DSP programming.

