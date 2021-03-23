function [Fx, Fy, Fz, Tx, Ty, Tz, V] = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  [FX, FY, FZ, TX, TY, TZ, V] = IMPORTFILE(FILENAME) reads data from
%  text file FILENAME for the default selection.  Returns the data as
%  column vectors.
%
%  [FX, FY, FZ, TX, TY, TZ, V] = IMPORTFILE(FILE, DATALINES) reads data
%  for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  [Fx, Fy, Fz, Tx, Ty, Tz, V] = importfile("C:\Users\zhiji\Documents\GitHub\Aerodynamics\WIND TUNNEL\AoA Run (Clean)\u_10 AoA Run\1_u_10_a-5_rpm6.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 21-Mar-2021 18:07:56

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Fx", "Fy", "Fz", "Tx", "Ty", "Tz", "V"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
Fx = mean(tbl.Fx);
Fy = mean(tbl.Fy);
Fz = mean(tbl.Fz);
Tx = mean(tbl.Tx);
Ty = mean(tbl.Ty);
Tz = mean(tbl.Tz);
V = mean(tbl.V);
end