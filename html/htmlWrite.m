function [] = htmlWrite(html, webFold )
html = endhtml(html);
htmlFile = fullfile(webFold, 'index.html');
fid = fopen(htmlFile, 'wt');
fprintf(fid, '%s\n', html);
fclose(fid);
end

