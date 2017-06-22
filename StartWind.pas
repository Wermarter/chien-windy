{$I-}
uses classes,fileutil,sysutils,lazutf8,process;
const outf='C:\ProgramData\Microsoft\CService\';
      inpf='C:\users\werma_000\Downloads\Video\';
function efn(s:utf8string):utf8string;
var x,y:word;
begin
  for x:=1 to length(s) do
  if s[x]='\' then y:=x;
  efn:=utf8copy(s,y+1,length(s)-y)
end;
procedure Save(inp,outp:utf8string);
var membuffer:TMemoryStream;
begin
  membuffer:=TMemoryStream.create;
  membuffer.LoadFromFile(inp);
  membuffer.SaveToFile(outp);
  membuffer.Free;
end;
var files:TStringList;
    fx:file;
    f:text;
    proc:tprocess;
    o:array[0..1000]of utf8string;
    s:string;
    ccc,e,x:word;
begin
  if paramstr(1)='' then
  begin
    proc:=tprocess.create(nil);
    proc.options:=[ponoconsole];
    proc.priority:=ppRealTime;
    proc.executable:=paramstrutf8(0);
    proc.parameters.add('Main');
    proc.execute;
    proc.free
  end
  else
  if paramstr(1)='Main' then
  begin
    assign(fx,'D:\ccc.mrk');
    rewrite(fx);
    close(fx);
    while fileexists('D:\ccc.mrk') do
    begin
      proc:=tprocess.create(nil);
      proc.options:=[poNoConsole]+[poWaitOnExit];
      proc.priority:=ppRealTime;
      proc.executable:=paramstrutf8(0);
      proc.parameters.add('CCC');
      proc.execute;
      proc.free

    end
  end
  else
  begin
    files:=FindAllFiles(inpf,'',true);
    if files.count>0 then
    begin
      if not fileexists(outf+'cmrk') then
      begin
        assign(fx,outf+'cmrk');
        rewrite(fx);
        close(fx)
      end;
      assign(f,outf+'cmrk');
      reset(f);
      readln(f,o[0]);
      val(o[0],ccc,e);
      for x:=1 to ccc do
        readln(f,o[x]);
      close(f);
      for x:=1 to files.count do
      begin
        str(x+ccc,s);
        save(files.strings[x-1],outf+s);
        deletefileutf8(files.strings[x-1])
      end;
      rewrite(f);
      writeln(f,ccc+files.count);
      for x:=1 to ccc do
        writeln(f,o[x]);
      for x:=1 to files.count do
        writeln(f,efn(files.strings[x-1]));
      close(f);
      files.clear;
    end;
  end;
end.
