# Visible Light Communication (VLC) in the Dark Using Solid-State Luminaires

## Overview

This project explores the potential of Visible Light Communication (VLC) technology in environments where illumination is undesirable. It focuses on utilizing consumer-grade white and RGB LEDs to achieve data transmission through imperceptible light levels, highlighting VLC's capabilities for a wider range of applications.

## Table of Contents

- [Project Description](#project-description)
- [Demo Usage](#demo-usage)
- [Results](#results)
- [Future Work](#future-work)


## Project Description

Visible Light Communication (VLC) offers a wide, unlicensed spectrum and the potential for data rates in the order of Terabits per second. This project characterizes the performance of consumer-grade white LEDs and an RGB LED for VLC in dark environments, focusing on throughput, link distances, and dimmability while maintaining the visual quality of light.

### Key Features

- **Imperceptible VLC Link**: Demonstrates data transmission with LEDs emitting light at levels imperceptible to the human eye.
- **Modulation Schemes**: Evaluates the effectiveness of various modulation schemes in maintaining a VLC link under low-light conditions.
- **Consumer-Grade LEDs**: Characterizes the performance of easily accessible LEDs for potential VLC applications.

## Demo Usage

Follow these steps to run simulations and generate symbols using the MATLAB and Optisystem demo files:

1. **MATLAB Simulation**:
   - Open the MATLAB file titled `optisystem_mod.m`.
   - To adjust the brightness of codewords, change the length of the pulse by modifying `L` (range: 1-31).
   - Enter a 5-bit long data sequence.

2. **Optisystem Simulation**:
   - Open the Optisystem file titled `MatLab_OPPM_MAIN.osd`.
   - Ensure that "Load MATLAB" is selected in the properties of any MATLAB block within the block diagram (This should be done every time after opening Optisystem to keep the MATLAB terminal active post-simulation).
   - Run the simulation.
   - In the open MATLAB terminal, type `optisystem_mod;`.
   - The plot for the received signal and the transmitted and received data bits will be displayed.

3. **Generating All Possible Symbols**:
   - Run `Gen_CodeWords.m` in MATLAB.
   - To change the brightness of codewords, adjust the pulse length by changing `L` (range: 1-31).

## Results

A summary of the findings, including data rates, link distance, and dimmability. Consider including charts, graphs, or tables to visually represent the results.

## Future Work

Discuss potential improvements and future directions for the research, such as exploring more complex modulation schemes or integrating the system into real-world applications.
