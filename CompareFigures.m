%% CompareFigures
% This function recieves two figures and plot them in the same figure for a
% visual comparison, the third argument is the location to save the new
% figure.
% carlosd.dc.it@gmail.com

function [] = CompareFigures(fig1,fig2,saveLoc)

open(fig1);
h=gcf;
axesObjs = get(h, 'Children');
dataObjs = get(axesObjs, 'Children');
xdata1 = get(dataObjs, 'XData');
ydata1 = get(dataObjs, 'YData');
zdata1 = get(dataObjs, 'ZData');
close;

open(fig2);
h=gcf;
axesObjs = get(h, 'Children');  %axes handles
dataObjs = get(axesObjs, 'Children'); %handles to low-level graphics objects in axes
xdata2 = get(dataObjs, 'XData');  %data from low-level grahics objects
ydata2 = get(dataObjs, 'YData');
zdata2 = get(dataObjs, 'ZData');
close;

figure(1)
hold on
colormap copper;
surf(xdata1,ydata1,zdata1,'LineStyle', 'none','FaceColor','interp','FaceLighting','phong');
freezeColors;% third party function for using a different mapcolor
colormap bone;
surf(xdata2,ydata2,zdata2,'LineStyle', 'none','FaceColor','interp','FaceLighting','phong');
savefig(saveLoc);
clf;

end