function [html] = htmlAddImages(html, imgurls, imgtxts, imglinks, width)
html=[html '<tr>'];
if nargin <=4
    width = 300; 
end
for n = 1 : numel(imgurls)
    html = [html sprintf(' <td  text-align="center" halign="center" valign="top" style="word-wrap: break-word;"><p><a href="%s"><img style="width:%dpx;" src="%s"></a><br>%s</br></p></td>',...
        imglinks{n}, width, imgurls{n}, imgtxts{n})];
end
html=[html '</tr>'];

end
