

load('MAIN_expval.mat')
load('PARS.mat')
load('temps.mat')

%%

% tic
% for p=1:1000
%     [B_min q_min C_min] = nyan(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));
% end
% toc./1000


[B_min q_min C_min] = nyan(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));



figure
hold on
plot(B_q_Temp, B_min)
plot(B_q_Temp, B_exp,'x')

figure
hold on
plot(B_q_Temp, q_min)
plot(B_q_Temp, q_exp,'x')

figure
hold on
plot(C_Temp, C_min)
plot(C_Temp, C_exp,'x')





%%

close all



figS = figure
set(figS, 'Position', [550 100 640 250])




slider(1) = uicontrol('style','slider')
slider(2) = uicontrol('style','slider')
slider(3) = uicontrol('style','slider')
slider(4) = uicontrol('style','slider')
slider(5) = uicontrol('style','slider')
slider(6) = uicontrol('style','slider')
slider(7) = uicontrol('style','slider')
slider(8) = uicontrol('style','slider')
slider(9) = uicontrol('style','slider')

Hsize = 600;
slider(1).InnerPosition = [20 20 Hsize 20]
slider(2).InnerPosition = [20 45 Hsize 20]
slider(3).InnerPosition = [20 70 Hsize 20]
slider(4).InnerPosition = [20 95 Hsize 20]
slider(5).InnerPosition = [20 120 Hsize 20]
slider(6).InnerPosition = [20 145 Hsize 20]
slider(7).InnerPosition = [20 170 Hsize 20]
slider(8).InnerPosition = [20 195 Hsize 20]
slider(9).InnerPosition = [20 220 Hsize 20]


for i=1:9
    set(slider(i),'value',0.5);
end



figP = figure
set(figP,'Position',[116.5,435,1538.5,543])









PARS0 = PARS;


while 1>0
    
    for i=1:9
        spos(i) = 2*get(slider(i),'value')-1;
    end
    spos = spos*3/10+1;
    
    
    PARS = PARS0.*spos;
    
    
    
    [B_min q_min C_min] = nyan(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));
    
    
    
    
    
    figure(figP)
    subplot(1,3,1)
    cla
    hold on
    plot(B_q_Temp, B_min)
    plot(B_q_Temp, B_exp,'x')
    ylim([0 1.2e-4])
    drawnow
    
    
    figure(figP)
    subplot(1,3,2)
    cla
    hold on
    plot(B_q_Temp, q_min)
    plot(B_q_Temp, q_exp,'x')
    ylim([0.1 0.13])
    drawnow
    
    figure(figP)
    subplot(1,3,3)
    cla
    hold on
    plot(C_Temp, C_min)
    plot(C_Temp, C_exp,'x')
%     ylim([0 16000])
%     xlim([0 300])
    drawnow
end




























