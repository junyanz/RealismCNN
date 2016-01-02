function html = endhtml(html)
html = [html {'</body></html>'}];
html = cell2mat(html);
end
