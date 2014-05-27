function [  ] = plotSurfaces( data1, data2 )

plot3(data1(1,:),data1(2,:),data1(3,:),'bo',data2(1,:),data2(2,:),data2(3,:),'r.');
axis equal

end

