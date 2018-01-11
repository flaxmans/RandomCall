function randomSeatSelector(r,c,usableSeat,interval,rotateMap)

%rowlabs={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','BB','CC','DD','EE','FF','GG','HH','II','JJ','KK','LL','MM','NN','OO','PP','QQ','RR','SS','TT','UU','VV','WW','XX','YY','ZZ'};


if nargin < 1
    r = 25;
end
if nargin < 2
    c = 20;
end
if nargin < 3
    usableSeat = zeros(r,c);
    for i = 1:r
        for j = 1:c
            if j == 7 || j == 14
                usableSeat(i,j) = 0;
            elseif j == 1 && i > 15
                usableSeat(i,j) = 0;
            elseif j == c && i > 15
                usableSeat(i,j) = 0;
            else
                usableSeat(i,j) = 1;
            end
        end
    end
else
    [r,c] = size(usableSeat);
end

rowlabs = cell(1,r);

for i = 1:r
    if rotateMap
        rowlabs{i} = num2str(r+1 - i);
    else
        rowlabs{i} = num2str(i);
    end
end


hold off;
for i = 1:interval
    chosenSeat = usableSeat;
    findIt = 1;
    while findIt
        randRow = randi(r);
        randCol = randi(c);
        if chosenSeat(randRow,randCol)
            findIt = 0;
        end
    end
    chosenSeat(randRow, randCol) = 0.5;
    imagesc(chosenSeat);
    colormap('Hot');
    %set(gca,'FontSize',20,'FontName','Arial','XTick',(1:c),'YTick',(1:r),'YTickLabel',rowlabs(r:-1:1));
    set(gca,'FontSize',20,'FontName','Arial','XTick',(1:c),'XTickLabel',[],'YTick',(1:r),'YTickLabel',rowlabs);
%     grid on;
%     set(gca, 'GridAlpha', 1);
    set(gca, 'Box', 'off', 'XTick', []);
    ylabel('Seat Row');
    if rotateMap
        xlabel('Podium');
        title('Rear of Auditorium');
    else
        title('PODIUM');
        xlabel('Rear of Auditorium');
    end
    %title(['Random seat: ' rowlabs{randRow} ', ' num2str(randCol)], 'FontSize',24,'FontName', 'Arial');
    drawnow;
    pause(0.025)
end
hold on;
for i = 1:r+1
    plot([0.5,c+0.5], [i-0.5,i-0.5], 'k');
end
for i = 1:c+1
    plot([i-0.5,i-0.5], [0.5,r+0.5], 'k');
end
