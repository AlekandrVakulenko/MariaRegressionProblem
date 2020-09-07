%% try to use particleswarm and fminunc


load('MAIN_expval.mat')
load('PARS.mat')
load('temps.mat')

%%
clc
% model(PARS)

model2 = @(var) model(var);


disp('start')


% options = optimoptions('particleswarm','SwarmSize',MaxSwarm,'InitialSwarmMatrix',InitialSwarmMatrix, ...
%                        'PlotFcn','pswplotbestf','Display','iter');
%vout = particleswarm(ModelFunctionPS,40,Lower,Upper,options)

MaxSwarm = 1000;
options = optimoptions('particleswarm','SwarmSize',MaxSwarm, ...
                       'PlotFcn','pswplotbestf','Display','iter');
lower = -abs(PARS)*100;
upper = abs(PARS)*100;
output1 = particleswarm(model2,9,lower,upper,options)


disp('output1 done')


output2 = fminunc(model2,PARS)

disp('output2 done')





%%


model(output1)
model(output2)


%% reduced reduced reduced reduced reduced
clc

PARSreduced = PARS([1 2 4:9]);


model2 = @(var) modelreduced(var);


disp('start')


% options = optimoptions('particleswarm','SwarmSize',MaxSwarm,'InitialSwarmMatrix',InitialSwarmMatrix, ...
%                        'PlotFcn','pswplotbestf','Display','iter');
%vout = particleswarm(ModelFunctionPS,40,Lower,Upper,options)

MaxSwarm = 1000;
options = optimoptions('particleswarm','SwarmSize',MaxSwarm, ...
                       'PlotFcn','pswplotbestf','Display','iter');
lower = -abs(PARSreduced)*100;
upper = abs(PARSreduced)*100;
output1 = particleswarm(model2,8,lower,upper,options)
output1 = [output1([1 2]) 180 output1([3:8])];

disp('output1 done')


output2 = fminunc(model2,PARSreduced)
output2 = [output2([1 2]) 180 output2([3:8])];
disp('output2 done')



%%
function out = model(PARS)

B_q_Temp = [171,173,175,177,179,181,183,185];
C_Temp = [158.990000000000,160.990000000000,162.990000000000,164.990000000000,166.990000000000,168.990000000000,170.990000000000,172.990000000000,174.990000000000,176.990000000000,178.990000000000,180.990000000000,182.990000000000,184.990000000000,186.990000000000,188.990000000000,190.990000000000,192.990000000000,194.990000000000,219.990000000000,229.990000000000,239.990000000000,249.990000000000];

B_exp = [7.22495824892199e-07,2.14771517286927e-05,3.70462193729394e-05,4.64262152429862e-05,5.74026293305948e-05,7.37524905251347e-05,9.45830126836491e-05,0.000102045626270713];
C_exp = [1456.64220200000,1521.93216700000,1600.98709100000,1703.97169750000,1833.25104900000,2092.17956000000,2144.01633700000,2171.99924650000,2195.51802200000,2216.55476450000,2236.12645700000,2255.44964900000,2275.02302850000,2295.20974000000,2316.72908450000,2339.72207400000,2366.01741950000,2395.11531600000,2427.58042750000,2581.31182700000,2474.22216550000,2358.00952750000,2243.52743750000];
q_exp = [0.128486245870590,0.124307490885258,0.120603181421757,0.117986299097538,0.113291598856449,0.108002997934818,0.105186559259892,0.101946450769901];

[B_min q_min C_min] = CalcData(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));

out = sum([(B_min-B_exp)./std(B_exp) (q_min-q_exp)./std(q_exp) (C_min-C_exp)./std(C_exp)].^2);
end



function out = modelreduced(PARSred)

B_q_Temp = [171,173,175,177,179,181,183,185];
C_Temp = [158.990000000000,160.990000000000,162.990000000000,164.990000000000,166.990000000000,168.990000000000,170.990000000000,172.990000000000,174.990000000000,176.990000000000,178.990000000000,180.990000000000,182.990000000000,184.990000000000,186.990000000000,188.990000000000,190.990000000000,192.990000000000,194.990000000000,219.990000000000,229.990000000000,239.990000000000,249.990000000000];

B_exp = [7.22495824892199e-07,2.14771517286927e-05,3.70462193729394e-05,4.64262152429862e-05,5.74026293305948e-05,7.37524905251347e-05,9.45830126836491e-05,0.000102045626270713];
C_exp = [1456.64220200000,1521.93216700000,1600.98709100000,1703.97169750000,1833.25104900000,2092.17956000000,2144.01633700000,2171.99924650000,2195.51802200000,2216.55476450000,2236.12645700000,2255.44964900000,2275.02302850000,2295.20974000000,2316.72908450000,2339.72207400000,2366.01741950000,2395.11531600000,2427.58042750000,2581.31182700000,2474.22216550000,2358.00952750000,2243.52743750000];
q_exp = [0.128486245870590,0.124307490885258,0.120603181421757,0.117986299097538,0.113291598856449,0.108002997934818,0.105186559259892,0.101946450769901];

[B_min q_min C_min] = CalcData(B_q_Temp,C_Temp, PARSred(1), PARSred(2), 180, PARSred(3), PARSred(4), PARSred(5), PARSred(6), PARSred(7), PARSred(8));

out = sum([(B_min-B_exp)./std(B_exp) (q_min-q_exp)./std(q_exp) (C_min-C_exp)./std(C_exp)].^2);
end


































