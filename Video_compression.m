#using video quantization for the better quality video in the video survealliancing through raspberry pi camera
#using matlab to perform the needed task.

function imgComp = motionComp(imgI, motionVect, mbSize)

[row col] = size(imgI);


mbCount = 1;
for i = 1:bsize:row-bsize+1
    for j = 1:size:col-bsize+1
        
        dy = motionVect(1,mbCount);
        dx = motionVect(2,mbCount);
        refBlkVer = i + dy;
        refBlkHor = j + dx;
        imageComp(i:i+bsize-1,j:j+bsize-1) = imgI(refBlkVer:refBlkVer+bsize-1, refBlkHor:refBlkHor+bsize-1);
    
        mbCount = mbCount + 1;
    end
end
