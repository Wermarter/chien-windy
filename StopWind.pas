var
    f:file;
begin
    assign(f,'D:\ccc.mrk');
    rewrite(f);
    close(f);
    erase(f)
end.
