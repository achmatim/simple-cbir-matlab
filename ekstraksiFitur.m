function [hasil] = ekstraksiFitur(path, outFitur)
% ekstraksiFitur() berguna untuk menghitung fitur
%     menggunakan momen Zernike dan kemudian
%     menyimpannya ke dalam file .MAT
 
% Citra yang akan menjadi acuan
imagefiles = dir(fullfile(path,'*.png'));      
nfiles = length(imagefiles);    % Number of files found
%disp(nfiles);
images = cell(1,nfiles);
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   %currentimage = imread(currentfilename);
   images{ii} = currentfilename;
end

%disp(length(images)); 
Citra = images;
 
% Proses menghitung momen Zernike
Fitur = [];
for i=1 : length(Citra)
    fprintf('Ekstraksi fitur citra %s\n', Citra{i});
    Image = imbinarize(imread(fullfile(path,Citra{i})), 0.5);
    Z.momen = zermoment(Image, 10);
    Z.nama = Citra(i);
    Fitur(i).momen = Z.momen;
    Fitur(i).nama = Z.nama;
end
 
% Simpan ke file dbfitur.mat
save(outFitur, 'Fitur');
hasil = length(Fitur);
clear Citra Fitur;
end