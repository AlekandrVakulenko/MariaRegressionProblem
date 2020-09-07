


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

midValue = EtaSquareCalc(gamma_R, beta_R, Temp, A_R, T_0_R);
midValue2 = EtaSquareCalc(gamma_R, beta_R, TempS, A_R, T_0_R);

B_calc = @(T, C, D, T_0, k, delta, gamma, beta, A, T_0_AFD) 1/C.* (T - T_0) - k^2*midValue.^2. / (4 * D) + delta * ...
midValue;

% q_calc = @(T, C, D, T_0, k, delta, gamma, beta, A, T_0_AFD) abs(k)*midValue/(2*D) ;
q_calc = @(T, C, D, T_0, k, delta, gamma, beta, A, T_0_AFD) -k*midValue/(2*D) ;

C_calc = @(T, C, T_0, delta, gamma, beta, A, T_0_AFD) ...
    ((1/C) *(T - T_0) + delta * midValue2).^-1;
%---------------------------------------------------------------------------



B_minimized = B_calc(Temp, C_D, D, T_0, k, delta_0, gamma_R, beta_R, A_R, T_0_R);
q_minimized = q_calc(Temp, C_D, D, T_0, k, delta_0, gamma_R, beta_R, A_R, T_0_R);
C_minimized = C_calc(TempS, C_D, T_0, delta_0, gamma_R, beta_R, A_R, T_0_R);


end





