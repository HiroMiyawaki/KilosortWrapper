function createChannelMapFile_Local(basepath)
%  create a channel map file

% modified by Hiro Miyawaki, 2017

if ~exist('basepath','var')
    basepath = cd;
end
d   = dir([basepath '*.xml']);
createChannelMapFileFromXml(basepath,d.name(1:end-4))


% par = LoadXml(fullfile(basepath,d(1).name));
% 
% xcoords = [];
% ycoords = [];
% kcoords = [];
% 
% if par.nElecGps == 0
%     error('No Electrode/Spike Groups found in xml')
% end
% 
% chanMap = [];
% for a= 1:par.nElecGps %being super lazy and making this map with loops
%     x = [];
%     y = [];
%     tchannels  = par.ElecGp{a};
%     for i =1:length(tchannels)
%         x(i) = length(tchannels)-i;
%         y(i) = -i*1;
%         if mod(i,2)
%             x(i) = -x(i);
%         end
%         chanMap(end+1)=tchannels(i)+1;
%         kcoords(end+1)=a;
%     end
%     x = x+a*100;
%     xcoords = cat(1,xcoords,x(:));
%     ycoords = cat(1,ycoords,y(:));
% end
% 
% Nchannels = length(xcoords);
% 
% connected   = true(Nchannels, 1);
% chanMap0ind = chanMap - 1;
% 
% save(fullfile(basepath,'chanMap.mat'), ...
%     'chanMap','connected', 'xcoords', 'ycoords', 'kcoords', 'chanMap0ind')

%%
% % 
% Nchannels = 128;
% connected = true(Nchannels, 1);
% chanMap   = 1:Nchannels;
% chanMap0ind = chanMap - 1;
% 
% xcoords   = repmat([1 2 3 4]', 1, Nchannels/4);
% xcoords   = xcoords(:);
% ycoords   = repmat(1:Nchannels/4, 4, 1);
% ycoords   = ycoords(:);
% kcoords   = ones(Nchannels,1); % grouping of channels (i.e. tetrode groups)
% 
% save('C:\DATA\Spikes\Piroska\chanMap.mat', ...
%     'chanMap','connected', 'xcoords', 'ycoords', 'kcoords', 'chanMap0ind')
%%

% kcoords is used to forcefully restrict templates to channels in the same
% channel group. An option can be set in the master_file to allow a fraction 
% of all templates to span more channel groups, so that they can capture shared 
% noise across all channels. This option is

% ops.criterionNoiseChannels = 0.2; 

% if this number is less than 1, it will be treated as a fraction of the total number of clusters

% if this number is larger than 1, it will be treated as the "effective
% number" of channel groups at which to set the threshold. So if a template
% occupies more than this many channel groups, it will not be restricted to
% a single channel group. 