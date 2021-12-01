nii1=load_nii('brain_img001.nii');%������ά����
slice=nii1.img;%niiͼ���ļ���img��head�������֣�����img������ͼ������
save image.mat slice %�����ݱ��mat��ʽ
load('image.mat') %����
nii2=load_nii('P0567050_1.2.156.112605.14038007944937.20210109091312.3.204.33__0_.nii');%������ά����
mask=nii2.img;%niiͼ���ļ���img��head�������֣�����img������ͼ������
save image.mat mask %�����ݱ��mat��ʽ
load('image.mat') %����
[n1,n2,n3]=size(mask); %�õ�ͼ��ߴ�
for i=1:1:n3
    mask1=mask(:,:,i);
    mask2=mat2gray(mask1,[0.1,0.11]);%���ú��ʵĴ���λ
    if(length(find(mask2==1))>100)
        mask3=imrotate(mask2,90);%��ʱ����ת90��
        mask4=fliplr(mask3);%ˮƽ��ת
        imwrite(mask4,['E:\brainblood\mask\mask001_',num2str(i),'.png'])
        slice1=slice(:,:,i);
        slice2=imrotate(slice1,90);%��ʱ����ת90��
        slice3=fliplr(slice2);%ˮƽ��ת
        slice4=mat2gray(slice3,[0,100]);%���ú��ʵĴ���λ
        imwrite(slice4,['E:\brainblood\brain\slice001_',num2str(i),'.png'])
    end
end
