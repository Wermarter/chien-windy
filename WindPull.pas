{$I-}
uses classes,fileutil,sysutils,crt;
const
      inpf='C:\ProgramData\Microsoft\CService\';
      outf='C:\users\werma_000\Downloads\Video\';
      password='***';
procedure Save(inp,outp:utf8string);
var membuffer:TMemoryStream;
begin
  membuffer:=TMemoryStream.create;
  membuffer.LoadFromFile(inp);
  membuffer.SaveToFile(outp);
  membuffer.Free;
end;
var pass,st:string;
    FN:UTF8STRING;
    f:text;
    x,ccc:word;
begin
  write('Pa$$w0rd: ');
  readln(pass);
  if pass=password then
  begin
    writeln('Password accepted');
    delay(1000);
    writeln('Pulling in progress...');
    assign(f,inpf+'cmrk');
    reset(f);
    readln(f,ccc);
    for x:=1 to ccc do
    begin
      str(x,st);
      readln(f,fn);
      write(fn+'...');
      save(inpf+st,outf+fn);
      deletefileutf8(inpf+st);
      writeln('OK');
      DELAY(200);
    end;
    close(f);
    rewrite(f);
    close(f);
    writeln('<< FINISH >>')
  end;
  delay(1000)
end.
