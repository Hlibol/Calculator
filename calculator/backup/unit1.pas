unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    btn_MC: TButton;
    btn_del: TButton;
    btn_1x: TButton;
    btn_x2: TButton;
    btn_sqr: TButton;
    btn_division: TButton;
    btn_7: TButton;
    btn_8: TButton;
    btn_9: TButton;
    btn_multi: TButton;
    btn_4: TButton;
    btn_MR: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_minus: TButton;
    btn_1: TButton;
    btn_2: TButton;
    btn_3: TButton;
    btn_plus: TButton;
    btn_change: TButton;
    btn_0: TButton;
    btn_comma: TButton;
    btn_Mplus: TButton;
    btn_equal: TButton;
    btn_Mminus: TButton;
    btn_MS: TButton;
    btn_sin: TButton;
    btn_CE: TButton;
    btn_C: TButton;
    btn_Msw: TButton;
    Btn_DEC: TButton;
    Btn_BIN: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_0Click(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_1xClick(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure btn_5Click(Sender: TObject);
    procedure btn_6Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure btn_8Click(Sender: TObject);
    procedure btn_9Click(Sender: TObject);
    procedure Btn_BINClick(Sender: TObject);
    procedure btn_CClick(Sender: TObject);
    procedure btn_CEClick(Sender: TObject);
    procedure btn_changeClick(Sender: TObject);
    procedure btn_commaClick(Sender: TObject);
    procedure Btn_DECClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure btn_divisionClick(Sender: TObject);
    procedure btn_equalClick(Sender: TObject);
    procedure btn_MCClick(Sender: TObject);
    procedure btn_minusClick(Sender: TObject);
    procedure btn_MminusClick(Sender: TObject);
    procedure btn_MplusClick(Sender: TObject);
    procedure btn_MRClick(Sender: TObject);
    procedure btn_MSClick(Sender: TObject);
    procedure btn_MswClick(Sender: TObject);
    procedure btn_multiClick(Sender: TObject);
    procedure btn_plusClick(Sender: TObject);
    procedure btn_sinClick(Sender: TObject);
    procedure btn_sqrClick(Sender: TObject);
    procedure btn_x2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  check,check2:boolean;
  firstnum,num,result,tempnum:double;
  operation,sign,temp:string;
  memory:array[1..10] of double;
  memorynum:longint =1 ;
  numtype:string = 'DEC';

implementation

{$R *.lfm}
{ TForm1 }


function numtostrbin(var number:double):string;
var
  num:longint;
begin
  num:=trunc(number);
  temp:='';
  while num>0 do
  begin
    temp:=chr((num mod 2)+ord('0'))+temp;
    num:=num div 2;
  end;
  if temp='' then temp:='0';
  numtostrbin:=temp;
end;


function strtonumbin(var edit1:Tedit):double;
var number,incbin:double;
  i:longint;
begin
    temp:=edit1.Text;
    number:=0;
    incbin:=1;
    for i:=length(temp) downto 1 do
    begin
      if temp[i]='1' then number:=number+incbin;
      incbin:=incbin*2;
    end;
    strtonumbin:=number;
end;

function strtonum(var edit1:Tedit):double;
var number:double;
begin
  number:=0;
  temp:=edit1.Text;
  if pos(',',temp)>0 then
    temp[pos(',',temp)]:='.';
  if temp[1]='-' then
  begin
     sign:='-' ;
     temp:=copy(temp,2,length(temp)-1);
  end
  else sign:='+';
  val(temp,number);
  if sign='-' then number:=number*-1;
  strtonum:=number;
end;
function numtostr(var number:double):string;
begin
  temp:=floattostrf(number,ffFixed,25,3);
  if pos('.',temp)>0 then
     temp[pos('.',temp)]:=',';
  if (temp[length(temp)]='0') and  (temp[length(temp)-1]='0') and (temp[length(temp)-2]='0') then
     Delete(temp,pos(',',temp),4);
  numtostr:=temp;
end;
procedure TForm1.btn_1Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='1';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'1';
end;

procedure TForm1.btn_1xClick(Sender: TObject);
begin
  tempnum:=strtonum(edit1);
  if tempnum<>0 then
  begin
    tempnum:=1/tempnum;
    edit1.Text:=numtostr(tempnum);
  end
  else
  begin
    edit1.Text:='Error';
    check:=true;
  end;
end;

procedure TForm1.btn_0Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='0';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'0';
end;

procedure TForm1.btn_2Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
    begin
       edit1.Text:='2';
       check:=false;
       check2:=false;
    end
    else edit1.Text:=edit1.Text+'2';
end;

procedure TForm1.btn_3Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='3';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'3'; ;
end;

procedure TForm1.btn_4Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='4';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'4';
end;

procedure TForm1.btn_5Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='5';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'5';
end;

procedure TForm1.btn_6Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='6';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'6';
end;

procedure TForm1.btn_7Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='7';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'7';
end;

procedure TForm1.btn_8Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='8';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'8';
end;

procedure TForm1.btn_9Click(Sender: TObject);
begin
  if (edit1.Text='0') or (check) or (check2) then
  begin
     edit1.Text:='9';
     check:=false;
     check2:=false;
  end
  else edit1.Text:=edit1.Text+'9';
end;

procedure TForm1.Btn_BINClick(Sender: TObject);
begin
  btn_DEC.enabled:=true;
  btn_BIN.enabled:=false;
  btn_2.enabled:=false;
  btn_3.enabled:=false;
  btn_4.enabled:=false;
  btn_5.enabled:=false;
  btn_6.enabled:=false;
  btn_7.enabled:=false;
  btn_8.enabled:=false;
  btn_9.enabled:=false;
  btn_change.enabled:=false;
  btn_comma.enabled:=false;
  btn_comma.enabled:=false;
  btn_sin.enabled:=false;
  btn_MC.enabled:=false;
  btn_MR.enabled:=false;
  btn_MS.enabled:=false;
  btn_Mplus.enabled:=false;
  btn_Mminus.enabled:=false;
  btn_Msw.enabled:=false;
  btn_1x.enabled:=false;
  if numtype='DEC' then
  begin
     numtype:='BIN';
     tempnum:=strtonum(edit1);
     edit1.Text:=numtostrbin(tempnum);

  end;
end;

procedure TForm1.btn_CClick(Sender: TObject);
begin
  edit1.Text:='0';
  check2:=false;
  check:=false;
  firstnum:=0;
  num:=0;
  result:=0;
  operation:='';
  sign:='';
  temp:='';
  tempnum:=0;
end;

procedure TForm1.btn_CEClick(Sender: TObject);
begin
    edit1.Text:='0';
end;

procedure TForm1.btn_changeClick(Sender: TObject);
begin
  if edit1.Text='0' then
  else if  edit1.Text[1]='-' then  edit1.Text:=copy(edit1.Text,2,length(edit1.Text)-1)
  else edit1.Text:='-'+edit1.Text;
end;

procedure TForm1.btn_commaClick(Sender: TObject);
begin
  if pos(',',edit1.Text)=0 then  edit1.Text:=edit1.Text+',';
end;

procedure TForm1.Btn_DECClick(Sender: TObject);
begin
    btn_DEC.enabled:=false;
    btn_BIN.enabled:=true;
    btn_2.enabled:=true;
    btn_3.enabled:=true;
    btn_4.enabled:=true;
    btn_5.enabled:=true;
    btn_6.enabled:=true;
    btn_7.enabled:=true;
    btn_8.enabled:=true;
    btn_9.enabled:=true;
    btn_change.enabled:=true;
    btn_comma.enabled:=true;
    btn_comma.enabled:=true;
    btn_sin.enabled:=true;
    btn_MC.enabled:=true;
    btn_MR.enabled:=true;
    btn_MS.enabled:=true;
    btn_Mplus.enabled:=true;
    btn_Mminus.enabled:=true;
    btn_Msw.enabled:=true;
    btn_1x.enabled:=true;
    if numtype='BIN' then
    begin
     numtype:='DEC';
     tempnum:=strtonumbin(edit1);
     edit1.Text:=numtostr(tempnum);
    end;

end;

procedure TForm1.btn_delClick(Sender: TObject);
begin
  if (length(edit1.Text)=1) or ((length(edit1.Text)=2) and (edit1.Text[1]='-')) then edit1.Text:='0'
  else if length(edit1.Text)>1 then edit1.Text:=copy(edit1.Text,1,length(edit1.Text)-1);
end;

procedure TForm1.btn_divisionClick(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    firstnum:=strtonum(edit1);
    operation:='/';
    check:=true;
  end
  else if numtype='BIN' then
  begin
    firstnum:=strtonumbin(edit1);
    operation:='/';
    check:=true;
  end;
end;

procedure TForm1.btn_equalClick(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    if operation<>'' then
    begin
      if check2 then
      else
      begin
        num:=strtonum(edit1);
      end;
      case operation of
        '+': result:=firstnum+num;
        '-': result:=firstnum-num;
        '*': result:=firstnum*num;
        '/': if num<>0 then
               result:=firstnum/num
             else
             begin
                edit1.Text:='Error';
                check:=true;
             end;
      end;
      if edit1.Text<>'Error' then
      begin
        edit1.Text:=numtostr(result);
        check2:=true;
        firstnum:=result;
      end;
    end;
  end
  else if numtype='BIN' then
  begin
    if operation<>'' then
    begin
      if check2 then
      else
      begin
        num:=strtonumbin(edit1);
      end;
      case operation of
        '+': result:=firstnum+num;
        '-': result:=firstnum-num;
        '*': result:=firstnum*num;
        '/': if num<>0 then
               result:=firstnum/num
             else
             begin
                edit1.Text:='Error';
                check:=true;
             end;
      end;
      if edit1.Text<>'Error' then
      begin
        edit1.Text:=numtostrbin(result);
        check2:=true;
        firstnum:=result;
      end;
    end;
  end;
end;

procedure TForm1.btn_MCClick(Sender: TObject);
begin
  memory[memorynum]:=0;
  edit2.text:=numtostr(memory[memorynum]);
end;

procedure TForm1.btn_minusClick(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    firstnum:=strtonum(edit1);
    operation:='-';
    check:=true;
  end
  else if numtype='BIN' then
  begin
    firstnum:=strtonumbin(edit1);
    operation:='-';
    check:=true;
  end;
end;

procedure TForm1.btn_MminusClick(Sender: TObject);
begin
   memory[memorynum]:=memory[memorynum]-strtonum(edit1);
   edit2.text:=numtostr(memory[memorynum]);
end;

procedure TForm1.btn_MplusClick(Sender: TObject);
begin
  memory[memorynum]:=memory[memorynum]+strtonum(edit1);
  edit2.text:=numtostr(memory[memorynum]);
end;

procedure TForm1.btn_MRClick(Sender: TObject);
begin
    edit1.Text:=numtostr(memory[memorynum]);
    edit2.text:=numtostr(memory[memorynum]);
end;

procedure TForm1.btn_MSClick(Sender: TObject);
begin
  memory[memorynum]:=strtonum(edit1);
  edit2.text:=numtostr(memory[memorynum]);
  btn_Mminus.Enabled:=true;
  btn_Mplus.Enabled:=true;
  btn_Mplus.Enabled:=true;
  btn_MR.Enabled:=true;
  btn_MC.Enabled:=true;
end;

procedure TForm1.btn_MswClick(Sender: TObject);
begin
  if memorynum<10 then
       inc(memorynum)
  else memorynum:=1;
  if memory[memorynum]=0 then
  begin
    btn_Mminus.Enabled:=false;
    btn_Mplus.Enabled:=false;
    btn_Mplus.Enabled:=false;
    btn_MR.Enabled:=false;
    btn_MC.Enabled:=false;
  end
  else
  begin
    btn_Mminus.Enabled:=true;
    btn_Mplus.Enabled:=true;
    btn_Mplus.Enabled:=true;
    btn_MR.Enabled:=true;
    btn_MC.Enabled:=true;
  end;
  edit2.text:=numtostr(memory[memorynum]);
  case memorynum of
    1:label2.Caption:='1';
    2:label2.Caption:='2';
    3:label2.Caption:='3';
    4:label2.Caption:='4';
    5:label2.Caption:='5';
    6:label2.Caption:='6';
    7:label2.Caption:='7';
    8:label2.Caption:='8';
    9:label2.Caption:='9';
    10:label2.Caption:='10';
  end;
end;

procedure TForm1.btn_multiClick(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    firstnum:=strtonum(edit1);
    operation:='*';
    check:=true;
  end
  else if numtype='BIN' then
  begin
    firstnum:=strtonumbin(edit1);
    operation:='*';
    check:=true;
  end;
end;

procedure TForm1.btn_plusClick(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    firstnum:=strtonum(edit1);
    operation:='+';
    check:=true;
  end
  else if numtype='BIN' then
  begin
    firstnum:=strtonumbin(edit1);
    operation:='+';
    check:=true;
  end;

end;

procedure TForm1.btn_sinClick(Sender: TObject);
begin
  tempnum:=strtonum(edit1);
  tempnum:=sin(tempnum);
  edit1.Text:=numtostr(tempnum);
end;

procedure TForm1.btn_sqrClick(Sender: TObject);
begin
  if numtype ='DEC' then
  begin
    tempnum:=strtonum(edit1);
    if tempnum>=0 then
    begin
      tempnum:=sqrt(tempnum);
      edit1.Text:=numtostr(tempnum);
    end
    else
    begin
      edit1.Text:='Error';
      check:=true;
    end;
  end
  else  if numtype= 'BIN' then
  begin
    tempnum:=strtonumbin(edit1);
    if tempnum>=0 then
    begin
      tempnum:=sqrt(tempnum);
      edit1.Text:=numtostrbin(tempnum);
    end
    else
    begin
      edit1.Text:='Error';
      check:=true;
    end;
  end;
end;

procedure TForm1.btn_x2Click(Sender: TObject);
begin
  if numtype='DEC' then
  begin
    tempnum:=strtonum(edit1);
    tempnum:=tempnum*tempnum;
    edit1.Text:=numtostr(tempnum);
  end
  else if numtype='BIN' then
  begin
    tempnum:=strtonumbin(edit1);
    tempnum:=tempnum*tempnum;
    edit1.Text:=numtostrbin(tempnum);
  end
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

