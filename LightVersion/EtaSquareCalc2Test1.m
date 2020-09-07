
clc

G = @(alpha,beta,gamma,x) alpha/2.*x.^2 + beta/4.*x.^4 + gamma/6.*x.^6;
Gder = @(alpha,beta,gamma,x) alpha.*x + beta.*x.^3 + gamma.*x.^5;
Gdersnd = @(alpha,beta,gamma,x) alpha + 3*beta.*x.^2 + 5*gamma.*x.^4;

% alpha = -4 %one min
% beta = 4
% gamma = 1

% alpha = -4 %two max
% beta = 6
% gamma = -1

alpha = 4 %two min
beta = -6
gamma = 1

% alpha = 2 %zero min
% beta = -4
% gamma = -2



%----------PRINT----------------
x = -5:0.1:5;
y = G(alpha,beta,gamma,x);
yder = Gder(alpha,beta,gamma,x);

hold on
plot(x,y)
% plot(x,yder)

xline(0,'--')
yline(0,'--')
ylim([-10 10])
xlim([min(x) max(x)])
%------------------------------



D = beta.^2-4*gamma.*alpha;
BiquadRootPos = (-beta+D.^0.5)./(2*gamma)
BiquadRootNeg = (-beta-D.^0.5)./(2*gamma)

RootOne = (BiquadRootPos).^0.5
RootTwo = (BiquadRootNeg).^0.5

Roots = [zeros(size(RootOne)) RootOne RootTwo];
Roots(imag(Roots)~=0) = 0; %FIXME maybe NaN is better


%just drawing xlines
for i=1:3
    if Gdersnd(alpha,beta,gamma,Roots(i)) > 0
        linespec = '-r';
    else
        linespec = '--k';
    end
xline(Roots(i),linespec)
end


GdersndValues = Gdersnd(alpha,beta,gamma,Roots)

Roots(GdersndValues>0)



% MaxRoot = (MaxRoot).^0.5;
% MaxRoot(imag(MaxRoot)~=0) = 0;
% 
% Gvalue = Gnew(alpha,beta,gamma,MaxRoot);
% 
% MaxRoot(Gvalue>0) = 0;
% 
% eta_square = MaxRoot.^2
% 




























