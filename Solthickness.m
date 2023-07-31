


%%
Brechzahl=1.46;                   % Brechzahl Schicht
SchrittweiteLSM=0.051282;         % Schrittweite LSM in z-Richtung
Medianbreite=5;                   % Anzahl Werte für Medianfilter
%%


h1=cd;
[h2, h3, h4]=uigetfile('Bitte Pfad angeben');
cd(h3);
xzbild=importdata(h2);
cd(h1);

[~,h5, h6]=size(xzbild);
if h6>1
    xzbild=xzbild(:,:,1);
end

x=1:h5;

disp('fit in progress...')
fitmat=gauss4fit(xzbild);       % erzeugt Fitbild

locmax=thickness(fitmat);       % findet lokale Maxima

%% Berechnung Schichtdicken

locmaxmed(1,:)=medfilt1(locmax(1,:),Medianbreite);              % Medianfilter über je 5 Werte (Schicht)
locmaxmed(2,:)=medfilt1(locmax(2,:),Medianbreite);              % Medianfilter über je 5 Werte (Substrat)
  
thic=(locmax(2,:)-locmax(1,:)).*Brechzahl.*SchrittweiteLSM;              % Berechnung Dicke
thicmed=(locmaxmed(2,:)-locmaxmed(1,:)).*Brechzahl.*SchrittweiteLSM;     % Berechnung Dicke median

avgthic=mean(abs(locmax(1,:)-locmax(2,:)).*(Brechzahl*SchrittweiteLSM));           % Berechnung mittlere Dicke
avgthicmed=mean(abs(locmaxmed(1,:)-locmaxmed(2,:)).*(Brechzahl*SchrittweiteLSM));  % Berechnung mittlere Dicke median

stddev=std(thic);                                               % Berechnung Standardabweichung der Dicke
stddevmed=std(thicmed);                                         % Berechnung Standardabweichung der Dicke median


%% Plot und Datenausgabe

figure
title('keine Glättung') 
imagesc(fitmat)
colormap('hot')
hold on
box on
plot(x,locmax(1,:),'c')
plot(x,locmax(2,:),'y')

figure
title('Medianfilter')
imagesc(fitmat)
colormap('hot')
hold on
box on
plot(x,locmaxmed(1,:),'c')
plot(x,locmaxmed(2,:),'y')

disp('Mittlere Dicke')
disp(avgthic)
disp('Standardabweichung')
disp(stddev)

disp('Mittlere Dicke median')
disp(avgthicmed)
disp('Standardabweichung median')
disp(stddevmed)

disp('done')