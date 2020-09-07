

clc

%main
g = @(a,b,c,x) a/3.*x.^3+b/2.*x.^2+c.*x;

%f=g'
f = @(a,b,c,x) a*x^2+b*x+c;


a = [1 2 3];

b = [-3 3 0];

c = [1 3 -5];

%find roots
root = (-b+(b.^2-4*a.*c).^0.5)./(2*a);

%compex roots is now equal to 0
root(imag(root)~=0) = 0;

%find function values at root position
values = g(a,b,c,root);

%compare g(root) value to 0
values(values<0) = 0





%%

figure
hold on

x = -5:0.1:5

for i=1:3
y=g(a(i),b(i),c(i),x)

plot(x,y)
xline(root(i))
ylim([-10,10])
end










