


clc

G = @(alpha,beta,gamma,x) alpha'/2.*x.^2 + beta'/4.*x.^4 + gamma'/6.*x.^6;
Gder = @(alpha,beta,gamma,x) alpha'.*x + beta'.*x.^3 + gamma'.*x.^5;
Gdersnd = @(alpha,beta,gamma,x) alpha' + 3*beta'.*x.^2 + 5*gamma'.*x.^4;

alpha = [ -4   -4   4    2   3   0   -5]
beta =  [  4    6  -6   -4  -4  -1    0]
gamma = [  1   -1   1   -2   2  -2    6]

D = beta.^2-4*gamma.*alpha;
BiquadRootPos = (-beta+D.^0.5)./(2*gamma);
BiquadRootNeg = (-beta-D.^0.5)./(2*gamma);

RootOne = (BiquadRootPos).^0.5;
RootTwo = (BiquadRootNeg).^0.5;

Roots = [zeros(size(RootOne))' RootOne' RootTwo'];
Roots(imag(Roots)~=0) = NaN %FIXME maybe NaN is better (it was 0)


GdersndValues = Gdersnd(alpha,beta,gamma,Roots)
range = (GdersndValues>0);
GdersndValues(GdersndValues<0) = NaN

range

Gvalue = G(alpha,beta,gamma,Roots);

Gvalue(range==0)=NaN

[~,Index] = min(Gvalue,[],2,'linear')

output = Roots(Index)



for i=1:size(alpha,2)
cla

%----------PRINT----------------
x = -5:0.1:5;
y = G(alpha(i),beta(i),gamma(i),x);


plot(x,y)

xline(0,'--')
yline(0,'--')
ylim([-10 10])
xlim([min(x) max(x)])
%------------------------------
xline(output(i),'r','linewidth',2)


drawnow
pause(0.5)
end




























