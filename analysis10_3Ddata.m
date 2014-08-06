%% Simulate 3D data
clear; clc; close all;

%% Create 3d coordinates 

% Set some parameters
length = 10;
numTrials = 300;
numVoxels = length ^ 3;

% Assign length for x y z 
% (currently it only works for space with equal length)
x = length;
y = length;
z = length;

% Get coordinates for x y z
tempx = repmat([1:x]', [y * z,1]);
tempy = repmat(1:x, z);
tempy = tempy(:);
tempz = sort(tempx);

% Concatenation, get the coordinates  
map = [tempx, tempy, tempz];

% check if I am doing the right thing
figure(1)
scatter3(tempx,tempy,tempz);

% Create the data set 
X = zeros(numVoxels, numTrials);



%% Adding signal to a cluster
% Set the range of the cluster
upper = 5;
lower = 2;

% Get coordinates that satisfy the range
for i = 1 : numVoxels
    if sum(map(i,:) <= upper) == 3 && sum(map(i,:) >= lower) == 3
        tempCod(i,:) = map(i,:);
    else
        tempCod(i,1:3) = NaN;
    end
end

% Get indices for voxels in the range 
signalInd = find(~isnan(tempCod(:,1)));

% Get rid of zero row
tempCod( ~any(tempCod,2), : ) = [];

% Transform to a form that allows scatter3()
sigx = tempCod(:,1);
sigy = tempCod(:,2);
sigz = tempCod(:,3);

% Visualize it, make sure that I'm doing the right thing
figure(1)
hold on 
scatter3(tempx,tempy,tempz, 'b');
scatter3(sigx,sigy,sigz, 'r');
hold off


%% Adding noise 



