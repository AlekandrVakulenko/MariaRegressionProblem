
clc


C_Temp = 100:1:300;
[B_min q_min C_min] = CalcData(B_q_Temp,C_Temp, PARS(1), PARS(2), PARS(3),PARS(4), PARS(5), PARS(6), PARS(7), PARS(8), PARS(9));
[~,maxindex] = max(C_min)
out2 = C_Temp(maxindex)


plot(C_Temp,C_min)


%%


output1good5 = output1;




%%

A = [-4 5 2 5 8]

max(abs(A))

%%


MaxValueADD = (abs(max(abs([1900]))-2750)>1000)*1000


%%






















