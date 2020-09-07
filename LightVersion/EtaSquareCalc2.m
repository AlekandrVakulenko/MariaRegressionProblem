


function eta_square = EtaSquareCalc2(gamma, beta, T_eta, A_eta, T_0_AFD)

%---------------------------intro-----------------
%check input size of T_eta
if min(size(T_eta))~=1 || max(size(size(T_eta)))>2
   error('T_eta mast be a 1D vector') 
end
% reshape T_eta to row
T_eta = reshape(T_eta,1,numel(T_eta));
%-------------------------------------------------


% alpha row calculation by T_eta row
alpha = A_eta*(T_eta - T_0_AFD);



%--------------MainPart---------------------------
G = @(alpha,beta,gamma,x) alpha'/2.*x.^2 + beta'/4.*x.^4 + gamma'/6.*x.^6;
% Gder = @(alpha,beta,gamma,x) alpha'.*x + beta'.*x.^3 + gamma'.*x.^5;  %first derivative (is not used)
Gdersnd = @(alpha,beta,gamma,x) alpha' + 3*beta'.*x.^2 + 5*gamma'.*x.^4; %second derivative

D = beta.^2-4*gamma.*alpha; %Discriminant
BiquadRootPos = (-beta+D.^0.5)./(2*gamma); %first and second values of biquad equation
BiquadRootNeg = (-beta-D.^0.5)./(2*gamma);

RootOne = (BiquadRootPos).^0.5; %two positive roots of derivative
RootTwo = (BiquadRootNeg).^0.5;

%in Roots we will save all real roots of derivative
%imag roots will be terminated by NaN value
Roots = [zeros(size(RootOne))' RootOne' RootTwo']; %third root is always equal to zero
Roots(imag(Roots)~=0) = NaN;

%now let's find a second derivative values at found roots
GdersndValues = Gdersnd(alpha,beta,gamma,Roots);
%range holds logical 1 for those who are greater thea zero (minimum value criteria)
range = (GdersndValues>0);
% GdersndValues(GdersndValues<0) = NaN %FIXME line is not used

%let's find G values for all roots
Gvalue = G(alpha,beta,gamma,Roots);
%and terminate all values for range=0 (maxima points)
Gvalue(range==0)=NaN;

%special case of min function to find minimum values in each row
[~,Index] = min(Gvalue,[],2,'linear');

%find roots corresponding to previous row-wise indexing
output = Roots(Index)';
%-------------------------------------------------


eta_square = output.^2;

end




%Structure of Roots and ect:

%Nx3 matrix, N = numel(T_eta)

%           0  Root1*  Root2*
%alpha1  [  0    x       x    ]
%alpha2  [  0    x       x    ]
%alpha3  [  0    x       x    ]
%.       [  .    .       .    ]
%.       [  .    .       .    ]
%.       [  .    .       .    ] 
%alphaN  [  0    x       x    ]


%* Root1 and Root2 is not ordered






















