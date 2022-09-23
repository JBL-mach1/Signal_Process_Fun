The files MEMS_Acceleration_10kHz.mat & Piezo_10kHz.mat contain acceleration and time data from modal testing for the 10kHz node.

The files MEMS_Acceleration_5kHz.mat & Piezo_5kHz.mat contain acceleration and time data from modal testing for the 5kHz node.

The file TF_Filter_Data_10kHz.mat contains data from the transfer function estimate, made using Welch's method, for the 10kHz node. The transfer function data has been pointwise inverted and truncated at 2400Hz, the MEMS accelerometer bandwidth.

The function processSignal takes the .csv filename ('e.g. AvrAdc000.csv') as an input, converts & filters data into an array 2000 points in length. The function must be contained in the same directory as the .csv file.

The script filterDesign allows for adjustments to the filter, the script will update the file TF_Filter_Coeff_10kHz.mat
