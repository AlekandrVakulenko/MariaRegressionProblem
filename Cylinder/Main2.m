

%% line view

tL = 0:0.1:5; %line parameter


A = [2 4 6]; %vector
B = [1 2 0]; %basic point

Line = A.*tL'+B;


figure
plot3(Line(:,1),Line(:,2),Line(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
xlim([0 10])
ylim([0 10])
zlim([0 10])


figure
plot(Line(:,1),Line(:,2))
xlabel('x')
ylabel('y')
xlim([0 10])
ylim([0 10])


figure
plot(Line(:,2),Line(:,3))
xlabel('y')
ylabel('z')
xlim([0 10])
ylim([0 10])


figure
plot(Line(:,1),Line(:,3))
xlabel('x')
ylabel('z')
xlim([0 10])
ylim([0 10])



%% orth creati0n
clc

vect = rand(1,3);%[1 2 3];

[orth1 orth2] = createOrth(vect);


tL = -5:0.1:5; %line parameter

B = [1 2 4]; %basic point

Line1 = vect.*tL'+B;
Line2 = orth1.*tL'+B;
Line3 = orth2.*tL'+B;

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





%% without optimization
clc
'first part start'
tic

%---------------------------------------
vect = [1 0.2 0.5]; %basic vector
B = [1 2 4]; %basic point

tL = 0:0.5:10; %line parameter
Diameter = 1;
%---------------------------------------


Radius = Diameter/2;
[orth1 orth2] = createOrth(vect);


% meshgrid -----
% xl = -10:0.1:10;
% yl = -10:0.1:10;
% zl = -10:0.1:10;
%----------------
xl = -10:0.05:10;
yl = -10:0.05:10;
zl = -10:0.05:10;
%----------------
[xg, yg, zg] = meshgrid(xl, yl, zl);
%---------------
xglineArr = reshape(xg,numel(xg),1);
yglineArr = reshape(yg,numel(yg),1);
zglineArr = reshape(zg,numel(zg),1);
pointLineArr = [xglineArr, yglineArr, zglineArr];
%---------------

localLinePar = (pointLineArr-B)/vect;

% LinePoints = vect.*localLinePar+B;
% 
% % find all cylinder 1.1R
% condition = (LinePoints(:,1) - xglineArr).^2 + ...
%             (LinePoints(:,2) - yglineArr).^2 + ...
%             (LinePoints(:,3) - zglineArr).^2        <= Radius*1.1;
% % new points inside cylinder 1.1R
% xglineArr = xglineArr(condition);
% yglineArr = yglineArr(condition);
% zglineArr = zglineArr(condition);
% 
% % new local line par
% pointLineArr = [xglineArr, yglineArr, zglineArr];
% localLinePar = (pointLineArr-B)/vect;
% 
% 



'first part end'
toc

figure
hold on
xlabel('x')
ylabel('y')
zlabel('z')
xlim([0 10])
ylim([0 10])
zlim([0 10])


for LineIndex = 1:numel(tL)
LineIndex./numel(tL)*100;
    
currentLinePoint = vect.*tL(LineIndex)+B;


condition1 = (currentLinePoint(1) - xglineArr).^2 + ...
             (currentLinePoint(2) - yglineArr).^2 + ...
             (currentLinePoint(3) - zglineArr).^2        <= Radius;



condition2 = abs(localLinePar-tL(LineIndex))<0.1;

% condition2 = reshape(condition2,size(xg));


partxg = xglineArr(condition1 & condition2);
partyg = yglineArr(condition1 & condition2);
partzg = zglineArr(condition1 & condition2);

plot3(partxg,partyg,partzg,'.')
drawnow

end


'second part end'
toc




%%
clc

[1 2 3]/[3 4 5]



A = [1 2 3]
B = [0.5 0 2];
t = [1 2];

P = A.*t'+B

%%
clc

P = [1.5 2 5
     2.5 4 8
     1 2 1
     -3 3 4]

t = (P-B)/A;
t = reshape(t,1,numel(t))

Pn = A.*t'+B


figure
hold on
plot3(P(:,1), P(:,2), P(:,3),'o')
plot3(Pn(:,1), Pn(:,2), Pn(:,3),'x')





A = [1 2 3]
B = [0.5 0 2];
tL = -10:0.5:10; %line parameter

Line1 = A.*tL'+B;
plot3(Line1(:,1),Line1(:,2),Line1(:,3))






%%





vv1 = [1.0000    2.0000    1.0000] - [ 0.6071    0.2143    2.3214]


dot(A,vv1)



vv2 = [-3.0000    3.0000    4.0000] - [1.1071    1.2143    3.8214]


dot(A,vv2)






















