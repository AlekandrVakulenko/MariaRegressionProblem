


load('globaloutput001.mat')

data = globaloutput';

data = cell2mat(data);


%%

for i=1:9
for j=i+1:9
    
    subplot(9,9,sub2ind([9 9],i,j))


plot(data(:,i),data(:,j),'x')

% set(gca,'xscale','log')
% set(gca,'yscale','log')

end
end



%%

i=1;
j=5;

plot(data(:,i),data(:,j),'x')

% set(gca,'xscale','log')
% set(gca,'yscale','log')







