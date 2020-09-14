

close all


load('PARS.mat')
load('tempAndExp.mat')


figP = figure
set(figP,'Position',[116.5,435,1538.5,543])



for i = 900:1200
    

    
    
    PARS = globaloutput{i};
    
    
    
    [B_min q_min C_min] = CalcData(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));
    
    
    
    
    
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























