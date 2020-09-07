


function eta_square = EtaSquareCalc2(gamma, beta, T_eta, A_eta, T_0_AFD)


    alpha = A_eta*(T_eta - T_0_AFD);
    

    Gnew = @(alpha,beta,gamma,x) alpha/2.*x.^2 + beta/4.*x.^4 + gamma/6.*x.^6;
    
    a = [gamma beta alpha];
    x = roots(a);
        
    
    D = beta.^2-4*gamma.*alpha;
    MaxRoot = (beta+(D).^0.5)./2*(gamma);
    MaxRoot = (MaxRoot).^0.5;
    MaxRoot(imag(MaxRoot)~=0) = 0;

    Gvalue = Gnew(alpha,beta,gamma,MaxRoot);
    
    MaxRoot(Gvalue>0) = 0;
    


eta_square = MaxRoot.^2;
end








