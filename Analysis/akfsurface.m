% S=data to do akf for
% WSize=Windowsize
% step=stepsize

function [S]= fftsurface(dat, Wsize, step, fs)

S=[];
N=length(dat);
pos=1;


while (pos+Wsize <= N)
    

    frame=dat(pos:pos+Wsize-1);
    
    corrout=autocorr(frame,Wsize-1);
 
    S=[S corrout]; 
    pos=pos+step;
end

F=1e3* (0:Wsize)' / fs;
T=(0:(1/fs):length(dat)/fs)';


imagesc(T,F,S);
xlabel('Time [s]');
ylabel('DeltaT [ms]');



