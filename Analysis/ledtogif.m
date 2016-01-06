function ledtogif(filename,data,fs,len)

framerate=32;
s= 64;

% Make colourmap - black body emitter

% 3000k black body 255 161  72
% see: http://www.vendian.org/mncharity/dir3/blackbody/

map=[ 0:1/200:1 ]' * [ 255 180  36 ] ./256;

maplen=length(map);
scale = 0.8*maplen/(median(data));

N=fs*len;
%N=length(data)-1;

pointer=1;
while (pointer <= N)
    
    brightness=scale*(data(floor(pointer)))+1;  
    
    if brightness>maplen 
        brightness=maplen;
    end
    
    pic=ones(s*2);
    pic(s-s/4:s+s/4-1,s-s/4:s+s/4-1)=ones(s/2)*brightness;
    
    if pointer == 1
        imwrite(pic,map,filename,'gif','LoopCount',Inf,'DelayTime',1/framerate);
    else
        imwrite(pic,map,filename,'gif','WriteMode','append','DelayTime',1/framerate);    
    end
    pointer = pointer + fs/framerate;
end

