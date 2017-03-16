function createChannelMapFileFromXml(basepath,basename)
%  create a channel map file

if ~exist('basepath','var')
    basepath = cd;
end

par = LoadXml(fullfile(basepath , [basename '.xml']));

xcoords = [];
ycoords = [];
kcoords = [];

if par.nElecGps == 0
    error('No Electrode/Spike Groups found in xml')
end

chanMap = [];
for a= 1:par.nElecGps %being super lazy and making this map with loops
    x = [];
    y = [];
    tchannels  = par.ElecGp{a};
    for i =1:length(tchannels)
        x(i) = length(tchannels)-i;
        y(i) = -i*1;
        if mod(i,2)
            x(i) = -x(i);
        end
        chanMap(end+1)=tchannels(i)+1;
        kcoords(end+1)=a;
    end
    x = x+a*100;
    xcoords = cat(1,xcoords,x(:));
    ycoords = cat(1,ycoords,y(:));
end

Nchannels = length(xcoords);

connected   = true(Nchannels, 1);
chanMap0ind = chanMap - 1;

save(fullfile(basepath,'chanMap.mat'), ...
    'chanMap','connected', 'xcoords', 'ycoords', 'kcoords', 'chanMap0ind')

%%
% 