function [locmax] = thickness(fitmat) 
%% Diese Funktion gibt die gemittelte Dicke und die Kurven für die
% Schicht und Substratoberflächen als Koordinaten im Bild aus.

[~, px]=size(fitmat); % ermittelt x-Ausdehunung von fitmat


locmax=zeros(2,px); % erstellt leere Matrix 
            % erstellt Vektor mit x-Koordinaten für Plot 

%%


%%                                                                                                                                                                                                                                                                                                    


for i=1:px
    maxima = fitmat((find(diff(sign(diff([0;fitmat(:,i);0])))<0)),i);  % Ermittelung aller lokaler Maxima
    index = find(diff(sign(diff([0;fitmat(:,i);0])))<0);               % und ihrer Indizees

    
    hm=[maxima index];
    [~, h2]=max(hm(:,1));
    locmax(1,i)=hm(h2,2);
    
    if length(index)>1          % Wenn nur ein Maximum existert wird dieses für Schicht und Substrat genutzt.                             
    hm(h2,1)=0;
    end
    
    [~, h2]=max(hm(:,1));
    locmax(2,i)=hm(h2,2);
    
%     if length(index) == 1;
%         locmax(1,i)=index(1);
%         locmax(2,i)=index(1);
%     else
%         locmax(1,i)=index(1);
%         locmax(1,i)=index(2);
%        [h1, h2]=max(hm(:,1));
%     end

end

% locmax=uint8(locmax);
 
 
 %% Ab hier Plot
 %%



end
 