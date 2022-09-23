The files MEMS_Acceleration_10kHz.mat & Piezo_10kHz.mat contain acceleration and time data from modal testing for the 10kHz node.

The files MEMS_Acceleration_5kHz.mat & Piezo_5kHz.mat contain acceleration and time data from modal testing for the 5kHz node.

The file TF_Filter_Data_10kHz.mat contains data from the transfer function estimate, made using Welch's method, for the 10kHz node. The transfer function data has been pointwise inverted, truncated at 2400Hz, and a gain limit of 1 has been applied.

The script filterDesign.m allows for adjustments to the filter, the script will update the file TF_Filter_Coeff_10kHz.mat.

The function processSignal.m takes a .csv filename ('e.g. AvrAdc000.csv') as an input, converts & filters Z-Acceleration data into an array 2000 points in length. The function must be contained in the same directory as the .csv file. The filter coefficients are stored in TF_Filter_Coeff_10kHz.mat.

