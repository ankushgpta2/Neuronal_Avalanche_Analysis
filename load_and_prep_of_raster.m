function avalanche_culture_analysis(raster_file_name) % function for running this script 

%% code to clean everything upon running of this script + to keep track of time elapsed 
tic;
clearvars;
clear;
clc;

%% PREP THE RASTER TO BE ANALYZED 
raster_file_name = 'name_of_raster_file.mat'; % input the name of the raster file for the culture data 
                                              % (e.g. time_bins x num_of_electrodes array containing LFP values)

%% MAKE DIRECTORY TO STORE THE GENERATED FIGURES 
avalanche_figure_path = fullfile('path to your wanted directory', raster_file_name);
mkdir(avalanche_figure_path) % make directory
addpath(avalanche_figure_path) % add to MATLAB path

%% LOAD FILE  
RASTER = load(raster_file_name);
RASTER = struct2cell(RASTER);
RASTER = RASTER{1,1};  %sparse matrix

binary = 0; % potential binary analysis (0s and 1s for spikes)
if binary
    RASTER = spones(RASTER);
end
