

% Load the data:
data = readPCDData('../../data/');
size(data)
%data

% Initialize R as identity matrix and t=0
R;

t = 0;

previousRMS = -1;

for i=1:10
    % Find the closest points for each point in the base point set (A1) from the target point set (A2) using brute-force approach.
    
    
    % Refine R and t using Singular Value Decomposition (See doc1, Section 2.3, for details).
    
    
    
    
    % Calculate the new RMS.
    currentRMS = RMS();
    if currentRMS == previousRMS;
        break;
    end
    previousRMS = currentRMS;
    
end


