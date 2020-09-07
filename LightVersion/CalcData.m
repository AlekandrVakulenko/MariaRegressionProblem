


function [B_minimized q_minimized C_minimized] = CalcData(Temp,TempS, C_D, D, T_0,k, delta_0, gamma_R, beta_R, A_R, T_0_R)
% C_D = 1
% D =1
% T_0=1
% k =1
% delta_0 = 1
% gamma_R =1
% beta_R =1
% A_R =1
% T_0_R =1

%---------------------------------------------------------------------------

midValue  = EtaSquareCalc2(gamma_R, beta_R, Temp,  A_R, T_0_R);
midValue2 = EtaSquareCalc2(gamma_R, beta_R, TempS, A_R, T_0_R);

B_minimized = 1/C_D.*(Temp - T_0) - k^2*midValue.^2./(4*D) + delta_0*midValue;
q_minimized = -k/(2*D)*midValue;
C_minimized = ( (1/C_D)*(TempS - T_0) + delta_0*midValue2 ).^-1;
%---------------------------------------------------------------------------



end





