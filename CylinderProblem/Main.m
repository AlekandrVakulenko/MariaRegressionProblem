%% orth creation
clc

vect = [1 2 3]; %rand(1,3);%[1 2 3];
vect = vect./norm(vect);

[orth1 orth2] = createOrth(vect);


tL = -5:0.1:5; %line parameter

BasicPoint = [1 2 4]; %basic point

Line1 = vect.*tL'+BasicPoint;
Line2 = orth1.*tL'+BasicPoint;
Line3 = orth2.*tL'+BasicPoint;

figure
hold on
plot3(Line1(:,1),Line1(:,2),Line1(:,3))
plot3(Line2(:,1),Line2(:,2),Line2(:,3))
plot3(Line3(:,1),Line3(:,2),Line3(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
xlim([0 10])
ylim([0 10])
zlim([0 10])


clc

vect = [1 1 1]; %rand(1,3);%[1 2 3];
vect = vect./norm(vect);

[orth1 orth2] = createOrth(vect);

tM = [vect; orth1; orth2];
tM(1,:) = [1 0 0]/[vect; orth1; orth2];
tM(2,:) = [0 1 0]/[vect; orth1; orth2];
tM(3,:) = [0 0 1]/[vect; orth1; orth2];
% new = tM * vetc(col) in basic



%% Find Cylinder
clc
tic
%---------------------------------------
% vect = [1 0.2 0.5]; %basic vector
% B = [1 2 4]; %basic point
vect = [1 0 1]; %basic vector
BasicPoint = [1 2 4]; %basic point


tL = [0 5]; %line parameter
Diameter = 0.2;
%---------------------------------------
Radius = Diameter/2;
%---------------------
vect = vect./norm(vect);
[orth1 orth2] = createOrth(vect);
tM = [vect; orth1; orth2]; % new coord = tM * vetc(col) in basic coord
%---------------------------------------


% meshgrid ------
% xl = -10:0.1:10;
% yl = -10:0.1:10;
% zl = -10:0.1:10;
%----------------
xl = -10:0.05:10;
yl = -10:0.05:10;
zl = -10:0.05:10;
%----------------
[xg, yg, zg] = meshgrid(xl, yl, zl);
%----------------

% reshape -------
xglineArr = reshape(xg,numel(xg),1);
yglineArr = reshape(yg,numel(yg),1);
zglineArr = reshape(zg,numel(zg),1);
pointLineArr = [xglineArr, yglineArr, zglineArr]';
%----------------

% convet coord ----
pointLineArrNew = tM*(pointLineArr - BasicPoint');
%------------------


condition1 = pointLineArrNew(2,:).^2 + pointLineArrNew(3,:).^2 <= Radius.^2;
condition2 = pointLineArrNew(1,:)>tL(1) & pointLineArrNew(1,:)<tL(2);

condition = condition1 & condition2;

partxg = xglineArr(condition);
partyg = yglineArr(condition);
partzg = zglineArr(condition);


plot3(partxg, partyg, partzg,'.')
drawnow
xlabel('x')
ylabel('y')
zlabel('z')
xlim([0 10])
ylim([0 10])
zlim([0 10])
% axis equal
toc

%% Draw Bins -------------------

figure
hold on
xlabel('x')
ylabel('y')
zlabel('z')
xlim([0 10])
ylim([0 10])
zlim([0 10])


BinN = 20;

BinEdge = linspace(tL(1),tL(2),BinN+1);

for index = 1:BinN


pointLineArr = [partxg, partyg, partzg]';
% convet coord ----
pointLineArrNew = tM*(pointLineArr - BasicPoint');
%------------------

BinStart = BinEdge(index);
BinEnd = BinEdge(index+1);

condition = pointLineArrNew(1,:)>BinStart & pointLineArrNew(1,:)<BinEnd;

XinBin = partxg(condition);
YinBin = partyg(condition);
ZinBin = partzg(condition);

plot3(XinBin, YinBin, ZinBin,'.')
drawnow
pause(0.3)
end










































