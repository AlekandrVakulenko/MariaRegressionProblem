

function OctahedronDraw(CenterOf, ColorOf, SizeOf, RollOf, PitchOf, YawOf)

% CenterOf: 1-by-3 array [X,Y,Z]
% ColorOf: 1-by-3 array 0<=[R G B]<=1
% SizeOf: scalar>0
% RollOf: rotation around X axis (in radian)
% PitchOf: rotation around Y axis (in radian)
% YawOf: rotation around Z axis (in radian)


    for signX = [-1 1]
        for signY = [-1 1]
            for signZ = [-1 1]
                
                X = [0 signX 0 0] * SizeOf;
                Y = [0 0 signY 0] * SizeOf;
                Z = [signZ 0 0 signZ] * SizeOf;
                
                
                RotationX = [1 0 0; 0 cos(RollOf) -sin(RollOf); 0 sin(RollOf) cos(RollOf)];
                RotationY = [cos(PitchOf) 0 sin(PitchOf); 0 1 0; -sin(PitchOf) 0 cos(PitchOf)];
                RotationZ = [cos(YawOf) -sin(YawOf) 0; sin(YawOf) cos(YawOf) 0; 0 0 1];
                
                for index = 1:4
                    
                    MidOut = RotationX*[X(index);Y(index);Z(index)];
                    MidOut = RotationY*MidOut;
                    MidOut = RotationZ*MidOut;
                    X(index) = MidOut(1);
                    Y(index) = MidOut(2);
                    Z(index) = MidOut(3);
                end
                
                
                
                X = X + CenterOf(1);
                Y = Y + CenterOf(2);
                Z = Z + CenterOf(3);
                
                
                C = ones(size(X));
                patch(X,Y,Z,C)
                colormap(ColorOf)
            end
        end
    end
end



