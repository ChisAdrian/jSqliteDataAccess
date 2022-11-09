{hint: Pascal files location: ...\AppLAMWProject_x\jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, Laz_And_Controls;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    Button1: jButton;
    Button2: jButton;
    EditText1: jEditText;
    jSqliteDataAccess1: jSqliteDataAccess;
    jSqliteCursor1: jSqliteCursor;
    ListView1: jListView;
    lvLog: jTextView;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.Button1Click(Sender: TObject);
var
    i :Integer;
begin

  jSqliteDataAccess1.Cursor:= jSqliteCursor1;
  jSqliteDataAccess1.DataBaseName := 'my.db';
  jSqliteDataAccess1.OpenOrCreate(jSqliteDataAccess1.DataBaseName);
  ListView1.Clear;

    {If not jSqliteDataAccess1.InsertIntoTable('insert into test values(''z'')') then
    begin
        lvLog.Append('FAILED insert\n')  ;
        exit;
    end;    }


   {
   if jSqliteDataAccess1.CreateTable('create table if not exists test( name text)') then
     lvLog.Append('CreateTable\n')
   else
    lvLog.Append('FAILED CreateTable\n');
   If jSqliteDataAccess1.InsertIntoTable('insert into test values(''ccc'')') then
     lvLog.Append('insert\n')
     else
        lvLog.Append('FAILED insert\n')  ;

       }

     jSqliteDataAccess1.Select(EditText1.Text);
     i :=  jSqliteCursor1.GetRowCount;
     lvLog.Text:='NrofRows:' + IntToStr(i);
     if i >0 then
     begin
      jSqliteCursor1.MoveToFirst;
        While not jSqliteCursor1.EOF do
        begin
             ListView1.Add(jSqliteCursor1.GetValueAsString(0));
             jSqliteCursor1.MoveToNext;
        end;
     end;
end;

procedure TAndroidModule1.Button2Click(Sender: TObject);
var
    qstr : String;

begin
     qstr :=  EditText1.Text;

  lvLog.Text:='';
  jSqliteDataAccess1.DataBaseName := 'my.db';
  jSqliteDataAccess1.OpenOrCreate(jSqliteDataAccess1.DataBaseName);

 // jSqliteDataAccess1.ExecSQL();

  If not jSqliteDataAccess1.InsertIntoTable(qstr) then
    begin
        lvLog.Append('FAILED insert\n')  ;
        exit;
    end;
  end;



end.
