function [fitmat]=gauss4fit(greyim) 
%% Die Funktion output=gauss4fit(input) gibt eine Matrix aus die aus den 
% approximierten Kurven die spaltenweise in das Schichtdickenbild
% eingepasst wurden aus.

[py, px]=size(greyim); % ermittelt Gr��e des Eingangsbildes (Pixel)
fitmat=zeros(py,px);   % definiert leere Matrix die der Gr��e des Eingangsbildes entspricht zum sp�teren "f�llen".

greyim=double(greyim); % stellt sicher das Eingangansbild im Datatype Double vorliegt. Nur damit kommt die Fitfunktion klar.
py=(1:py)';            % Vektor f�r sp�tere berechnung der Fitwerte 

tic                    % Startet Zeitmessung 
for i=1:px
    f=fit(py,greyim(:,i),'gauss4');
    fitmat(:,i)=f(py);
end
% for-Schleife fittet in x-Richtung des Bildes an jede Spalte eine Summe
% aus 4 Gauss-Kurven, setzt den Vektor py in diese Funktionen, berechenet
% die zugeh�rigen Funktionswerte und schreibt diese in die -noch- leere
% Matrix fitmat. 

toc % beendet Zeitmessung und gibt Rechendauer aus.
end

