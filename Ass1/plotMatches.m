function [] = plotMatches(set1, set2, matches)    
    figure;
    hold on;
    plot3(set1(1,:),set1(2,:),set1(3,:),'bo',set2(1,:),set2(2,:),set2(3,:),'r.')
    for j=1:size(set1, 2)
        plot3([set1(1, j), matches(1, j)], [set1(2, j), matches(2, j)], [set1(3, j), matches(3, j)], 'g')%. [set1(3, j), matches(3, j)])
    end
    hold off;
end
