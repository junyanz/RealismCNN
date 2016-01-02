function [html] = htmlAddTable(html, border)
if nargin <=1
    border = 1; 
end
html=[html sprintf('<table border="%d" style="table-layout: fixed;"> <tbody>',border)];
end

