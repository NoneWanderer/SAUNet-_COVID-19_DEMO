image=imread('C:\Users\DN\Desktop\US\IMG_20200516_1_1.jpg');%����ͼ��
im0=rgb2gray(image);%ת��Ϊ�Ҷ�ͼ
%im0=image;
figure
subplot(221),imshow(im0),title('\fontsize{16}�Ҷ�ͼ')
%% ��ֵ�ָ�Ա�
% ����Otsu������ȫ��ͼ����ֵ�ָ�
im1=imbinarize(im0,'global');%ͨ����ֵ������ά�Ҷ�ͼ���ֵ��
%�ֲ�����Ӧͼ����ֵ�ָ�
im2=imbinarize(im0,'adaptive');
% �����������طָ�
Eidx=edge(im0,'Sobel');%ʹ��Sobel��ȡ��Ե
E1=im0(Eidx);%��ȡ��Ե����
E1=E1(E1>0);
im3=imbinarize(im0,graythresh(E1));
subplot(222),imshow(im1),title('\fontsize{16}ȫ�ַָ�')
subplot(223),imshow(im2),title('\fontsize{16}�ֲ�����Ӧ�ָ�')
subplot(224),imshow(im3),title('\fontsize{16}�����������طָ�')
%% ȥ����������ȸ��ţ���ȡ���岿��
% ������ͨ����
[label,num]=bwlabel(im1);
% ���������ͨ����
MAX = 0;
for k = 1:num
    maxtmp = sum(find(label==k));
    if maxtmp>MAX
        IDX = k;
        MAX = maxtmp;
    end
end
im4 = label==IDX;
figure
subplot(221),imshow(im4),title('\fontsize{16}��ǻ')
%% ��ȡ���Ʒ���
im5 = imfill(im4,'hole'); % ���
subplot(222),imshow(im5),title('\fontsize{16}���')
im6 = im5-im4;
subplot(223),imshow(im6),title('\fontsize{16}���')
%ȥ�����ܵ�
P = 2000;
im7 = bwareaopen(im6,P,4);  % ɾ�����С��P��4��ͨ����
subplot(224),imshow(im7),title('\fontsize{16}ȥ������')
%% ��̬ѧ����
SE1=strel('disk',2);%����ṹԪ�ص���״��Բ��-�뾶2
SE2=strel('disk',4);
im8=imdilate(imerode(im7,SE1),SE2);%�����㣬�������ٸ�ʴ
figure
subplot(221),imshow(im8),title('\fontsize{16}������')
%% �����Ĥ
im9 = imfill(im8,'hole'); %���
figure
subplot(222),imshow(im9),title('\fontsize{16}��Ĥ')
%% ��ȡ��ʵ��
im10=immultiply(im0,im9);%���
figure
imshow(im10)
imshow(image)
figure
imshow(im10)