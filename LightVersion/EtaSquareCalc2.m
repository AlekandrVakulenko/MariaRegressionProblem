


function eta_square = EtaSquareCalc2(gamma, beta, T_eta, A_eta, T_0_AFD)

X_min = zeros(1,numel(T_eta));

eta = -100:0.01:100;

for k = 1:numel(T_eta)
    
    alpha_ = A_eta *(T_eta(k) - T_0_AFD);
    
    G = alpha_/2.* eta.^2 + beta/4.* eta.^4 + gamma/6.* eta.^6;
    
    a = [gamma beta alpha_];
    x = roots(a);
        
    difference = abs(eta-sqrt(max(x)));
    
    if G(find(difference == min(difference))) > 0
        X_min(k) = 0;
    else
        b = real(sqrt(max(x)));
        if numel(b)>0
            X_min(k) = b(1);
        end
    end
end
eta_square = X_min.^2;
end








