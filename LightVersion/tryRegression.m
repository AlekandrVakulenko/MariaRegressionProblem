%% try to use particleswarm and fminunc



load('PARS.mat')
load('tempAndExp.mat')

%%
clc
% model(PARS)

model2 = @(var) model(var);

disp('start')

% options = optimoptions('particleswarm','SwarmSize',MaxSwarm,'InitialSwarmMatrix',InitialSwarmMatrix, ...
%                        'PlotFcn','pswplotbestf','Display','iter');
%vout = particleswarm(ModelFunctionPS,40,Lower,Upper,options)

%FIXME add InitialSwarmMatrix

MaxSwarm = 20000; %20000 D: 10000 долго 1000 норм 100 мало
options = optimoptions('particleswarm','SwarmSize',MaxSwarm, ...
                       'UseParallel',true, ...
                       'MaxIterations', MaxSwarm*20, ...
                       'MaxStallIterations', 10, ...
                       'FunctionTolerance', 1e-6, ...
                       'ObjectiveLimit', -inf, ...
                       'DisplayInterval', 1, ...
                       'PlotFcn',[],'Display','iter'); %PlotFcn pswplotbestf/[] Display iter/none
% lower = -abs(PARS)*10;
% upper = abs(PARS)*10;

% lower = [      10   -1    40   -1   -1   -1   -100   -100    40];
% upper = [ 1000000    1   300    1    1    1    100    100   300];

lower([1 2 3 5 7 8 9]) = output1good5([1 2 3 5 7 8 9])/30;
upper([1 2 3 5 7 8 9]) = output1good5([1 2 3 5 7 8 9])*30;
lower([4 6]) = output1good5([4 6])*30;
upper([4 6]) = output1good5([4 6])/30;

output1 = particleswarm(model2,9,lower,upper,options)


disp('output1 done')



%%


model(output1)
model(output2)



%% loop loop loop
clc

model2 = @(var) model(var);

output1 = output1good5;

for Index = 1:1000
Index
    
MaxSwarm = 1000; %20000 D: 10000 долго 1000 норм 100 мало
options = optimoptions('particleswarm','SwarmSize',MaxSwarm, ...
                       'UseParallel',true, ...
                       'MaxIterations', MaxSwarm*20, ...
                       'MaxStallIterations', 10, ...
                       'FunctionTolerance', 1e-6, ...
                       'ObjectiveLimit', -inf, ...
                       'DisplayInterval', 1, ...
                       'PlotFcn',[],'Display','iter'); %PlotFcn pswplotbestf/[] Display iter/none

% lower = [      10   -1    40   -1   -1   -1   -100   -100    40];
% upper = [ 1000000    1   300    1    1    1    100    100   300];

lower([1 2 3 5 7 8 9]) = output1([1 2 3 5 7 8 9])/30;
upper([1 2 3 5 7 8 9]) = output1([1 2 3 5 7 8 9])*30;
lower([4 6]) = output1([4 6])*30;
upper([4 6]) = output1([4 6])/30;

output1 = particleswarm(model2,9,lower,upper,options)

globaloutput{Index} = output1;

end
%% parfor parfor parfor
clc

model2 = @(var) model(var);

output1 = output1good5;
lower([1 2 3 5 7 8 9]) = output1([1 2 3 5 7 8 9])/30;
upper([1 2 3 5 7 8 9]) = output1([1 2 3 5 7 8 9])*30;
lower([4 6]) = output1([4 6])*30;
upper([4 6]) = output1([4 6])/30;

MaxSwarm = 1000; %20000 D: 10000 долго 1000 норм 100 мало 

options = optimoptions('particleswarm','SwarmSize',MaxSwarm, ...
                       'UseParallel',false, ...
                       'MaxIterations', MaxSwarm*20, ...
                       'MaxStallIterations', 10, ...
                       'FunctionTolerance', 1e-6, ...
                       'ObjectiveLimit', -inf, ...
                       'DisplayInterval', 1, ...
                       'PlotFcn',[],'Display','none'); %PlotFcn pswplotbestf/[] Display iter/none
                   
        
clearvars globaloutput

parfor Index = 1:400
    disp(['Start of ' num2str(Index) ' iteration'])
    
    output1 = particleswarm(model2,9,lower,upper,options);
    globaloutput{Index} = output1;
    
    disp(['End of ' num2str(Index) ' iteration'])
end
save('parfor3.mat','globaloutput')

%%

model(output1good1)


function out = model(PARS)
weg = @(y) (sum(y.^2)./numel(y))^0.5;

B_q_Temp = [171,173,175,177,179,181,183,185];
% C_Temp = [158.990000000000,160.990000000000,162.990000000000,164.990000000000,166.990000000000,168.990000000000,170.990000000000,172.990000000000,174.990000000000,176.990000000000,178.990000000000,180.990000000000,182.990000000000,184.990000000000,186.990000000000,188.990000000000,190.990000000000,192.990000000000,194.990000000000,219.990000000000,229.990000000000,239.990000000000,249.990000000000];
C_Temp = [168.990000000000,170.990000000000,172.990000000000,174.990000000000,176.990000000000,178.990000000000,180.990000000000,182.990000000000,184.990000000000,186.990000000000,188.990000000000,190.990000000000,192.990000000000,194.990000000000,219.990000000000,229.990000000000,239.990000000000,249.990000000000];

B_exp = [7.22495824892199e-07,2.14771517286927e-05,3.70462193729394e-05,4.64262152429862e-05,5.74026293305948e-05,7.37524905251347e-05,9.45830126836491e-05,0.000102045626270713];
q_exp = [0.128486245870590,0.124307490885258,0.120603181421757,0.117986299097538,0.113291598856449,0.108002997934818,0.105186559259892,0.101946450769901];
% C_exp = [1456.64220200000,1521.93216700000,1600.98709100000,1703.97169750000,1833.25104900000,2092.17956000000,2144.01633700000,2171.99924650000,2195.51802200000,2216.55476450000,2236.12645700000,2255.44964900000,2275.02302850000,2295.20974000000,2316.72908450000,2339.72207400000,2366.01741950000,2395.11531600000,2427.58042750000,2581.31182700000,2474.22216550000,2358.00952750000,2243.52743750000];
C_exp = [2092.17956000000,2144.01633700000,2171.99924650000,2195.51802200000,2216.55476450000,2236.12645700000,2255.44964900000,2275.02302850000,2295.20974000000,2316.72908450000,2339.72207400000,2366.01741950000,2395.11531600000,2427.58042750000,2581.31182700000,2474.22216550000,2358.00952750000,2243.52743750000];

[B_min q_min C_min] = CalcData(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));

%-------FindMax------------------
C_Temp2 = 100:1:300;
[B_min2 q_min2 C_min2] = CalcData(B_q_Temp,C_Temp2, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));
[~,maxindex] = max(C_min2);
TempMax = C_Temp2(maxindex);

% 'f'
% plot(C_Temp2,C_min2)
% (maxindex>5)
% (maxindex<numel(C_Temp2)-5)
% C_min2(maxindex-5)<C_min2(maxindex)
% C_min2(maxindex+5)<C_min2(maxindex)
% 'ff'

if (maxindex>5)&&(maxindex<numel(C_Temp2)-5) && (C_min2(maxindex-5)+0.1)<C_min2(maxindex) && (C_min2(maxindex+5)+0.1)<C_min2(maxindex)
    %     TempMaxADD = ((TempMax-212)/20)^2; OLD
    %     195
    %     220
    TempMaxADD = ((TempMax>220)|(TempMax<195)).*(abs(TempMax-207.5)*1+10);
else
    TempMaxADD = 1000;
end

% MaxValueADD = ((max(abs(C_min2))-2750)/1000)^2; %SMOOTH
MaxValueADD = ((max(C_min2)-2750)>10000)*1000; %STEP
MaxValueADD = MaxValueADD + (min(C_min2)<300)*1000;


%--------------------------------

C_weight = ones(size(C_Temp))*1;
C_weight(end-4:end) = C_weight(end-4:end)*1;

out = sum([(B_min-B_exp)./weg(B_exp)*1 (q_min-q_exp)./weg(q_exp)*1 (C_min-C_exp)./weg(C_exp).*C_weight ].^2) ...
      + TempMaxADD*100 ...
      + MaxValueADD;

end



































