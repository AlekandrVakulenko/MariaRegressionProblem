

figure
xlabel('x')
ylabel('y')
zlabel('z')

axis equal
xlim([-10 10])
ylim([-10 10])
zlim([-10 10])


RollOf = pi/2; %X axis
PitchOf  = 0; %Y axis
YawOf = 0; %Z axis

CenterOf = [0 5 1]; %center position
ColorOf = [1 0 0]; %face color
SizeOf = 4; %"radius"

CenterOf2 = [0 0 0];


for Angle = 0:0.01:pi/2
    cla
    RollOf = Angle; %X axis
    PitchOf  = Angle; %Y axis
    YawOf = Angle; %Z axis
    
    OctahedronDraw(CenterOf, ColorOf, SizeOf, RollOf, 1-2*PitchOf, YawOf);
    OctahedronDraw(CenterOf2, ColorOf, SizeOf, 0.5*RollOf, PitchOf, YawOf);

    drawnow
end

%%




