function [hasil] = imageQuery(img)
% QUERYZER2 Berguna untuk melakukan query dengan
%     menggunakan momen Zernike dengan membaca
%     data acuan dari file dbfitur.
 
load dbfitur; % Memuat database fitur
 
% Proses momen Zernike dan hitung jarak City-block
Query = im2bw(img, 0.5);
ZQuery = zermoment(Query, 10);
Hasil = [];
jumFitur = length(Fitur(1).momen);
for i=1 : length(Fitur)
    nama = Fitur(i).nama;
 
    jarak = 0;
%     for j=1 : jumFitur
%         jarak = jarak + abs(ZQuery(j) - Fitur(i).momen(j));
%     end
    
    jarak = pdist2(ZQuery,Fitur(i).momen,'euclidean');
    
    Hasil(i).nama = Fitur(i).nama;
    Hasil(i).jarak = jarak;
end
 
% Urutkan data pada array Hasil
jum = length(Hasil);
for p = 2: jum
    x = Hasil(p);
 
    % Sisipkan x ke dalam data[1..p-1]
    q = p - 1;
    ketemu = 0;
 
    while ((q >= 1) && (~ketemu))
        if (x.jarak < Hasil(q).jarak)
            Hasil(q+1) = Hasil(q);
            q = q - 1;
        else
            ketemu = 1;
        end
        
        Hasil(q+1) = x;
    end
end
hasil = Hasil; 
% Tampilkan hasil secara visual

% figure;
% disp('Hasil pencocokan dapat dilihat pada jendela gambar');
% subplot(3,3,1); 
% imshow(img);
% title('Query');
% for i=1 : jum
%    subplot(3,3, i+1); 
%    G = imread(char(Hasil(i).nama)); imshow(G);
%    title(num2str(Hasil(i).jarak));
% end
end