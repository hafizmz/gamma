% cd 'D:\MyData\OneDrive - RTI2Research\Pretreatment QA\PSQA data list\Ahmad Sobri SRT'
[Praw, map] = dicomread('RTD00001');
infodose = dicominfo('RTD00001');
infoplan = dicominfo('RTP00001');
montage(Praw, map, 'Size', [12 10]);
Pcoronal=permute(Praw,[2 4 3 1]);
montage(Pcoronal, map, 'Size', [12 10]);
P=Pcoronal(:,:,55);
P=imrotate(P,90);
Pdouble=double(P);
Pdose=Pdouble*infodose.DoseGridScaling;
PdosemGy=Pdose*1000;
PdoseGy=PdosemGy/1000;
PdoseGy=round(PdoseGy,3);
doseph=PdoseGy(1:107,2:108);%ORIGINAL coordinate
%doseph=PdoseGy(2:107,2:107);
figure, imagesc(doseph); colorbar; title 'doseph';


[X2,Y2]=meshgrid(-159:3:159);
[X2q,Y2q]=meshgrid(-159:1:159);
doseph2=interp2(X2,Y2,doseph,X2q,Y2q);
doseph3=sepblockfun(doseph2
doseph3=doseph2(30:290,30:290);

%theResult = sepblockfun(yourMatrix,[1,8],'mean');
