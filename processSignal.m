function filtered = processSignal(fileName)
% Example: fileName = 'AvrAdc000.csv'

% ABOUT: James Lesser, 9/23/2022
% Convert .CSV data to acceleration (m/s^2) & apply the 256th order filter.
% Filter may be adjusted using the script filterDesign.m.

% Load into an array
temp = readtable(fileName,'NumHeaderLines',2);

% Z-Acceleration
temp = table2array(temp(:,3));

% Average the first 1000 points
av = mean(temp(1:1000));

% Max. accel. index
[~,I] = max(abs(temp));

% Zero and convert to m/s^2
acceleration = (temp(I-499:I+1500)-av)*((2560*9.81)/(256*80));

% Load filter coefficents
load TF_Filter_Coeff_10kHz.mat b

% Apply filter
D = mean(grpdelay(b));
filtered = filter(b,1,[acceleration;zeros(D,1)]);
filtered = filtered(D+1:end);

end