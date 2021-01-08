%separate plotting routine for 2-hourly means of BVsquared

%rescale 3-hourly BVsquared data:
BV_image = -reshape(BV2_3h.*10^-5,[8,length(BV2_3h)/8]);
%create image:
image(BV_image);
%create colorbar:
h = colorbar;
set(h, 'ylim', [0 30]);
%define colorbar color scales:
c1 = [255, 255, 255]/255;
c2 = [246, 235, 20]/255;
c3 = [255, 200, 0]/255;
c4 = [255, 150, 0]/255;
c5 = [255, 0, 0]/255;
c6 = [200, 0, 0]/255;
c_p1 = [linspace(c1(1),c2(1),7)', linspace(c1(2),c2(2),7)', linspace(c1(3),c2(3),7)'];
c_p2 = [linspace(c2(1),c3(1),6)', linspace(c2(2),c3(2),6)', linspace(c2(3),c3(3),6)'];
c_p3 = [linspace(c3(1),c4(1),6)', linspace(c3(2),c4(2),6)', linspace(c3(3),c4(3),6)'];
c_p4 = [linspace(c4(1),c5(1),6)', linspace(c4(2),c5(2),6)', linspace(c4(3),c5(3),6)'];
c_p5 = [linspace(c5(1),c6(1),4)', linspace(c5(2),c6(2),4)', linspace(c5(3),c6(3),4)'];
colors_p = [c_p1;c_p2;c_p3;c_p4;c_p5];
colormap(colors_p)
colorbar
cbh = colorbar;
%colorbar label:
cbh.Label.String = '10^-5 mV/s';
%xtick lables from dates:
dates = date_info(1:10:end);
form = 'MMM d';
dates.Format = form;
%create xticks in correct places:
dateticks = [char(dates),strings(10,1)];
dateticks = dateticks.';
dateticks = dateticks(1:end);
xticks([(0.5:5:90.5)])
xticklabels(dateticks)
yticks([1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5])
%create yticks with time labels:
yticklabels({'03:00','06:00','09:00','12:00','15:00','18:00','21:00','24:00'})
set(gca,'FontSize',24)
%labels and title:
xlabel('Date') 
ylabel('Hour') 
title('Solar wind coupling function <B_sV^2>')
grid on

%cleanup:
clear h length blue red green colors_p1 colors_p2 colors_p c1 c2 c3 c4 c5 c6 c_p1 c_p2 c_p3 c_p4 c_p5 cbh chardates dates dateticks empties form Format  map cbh