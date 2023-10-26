unit source;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ScktComp;

type
  TMainForm = class(TForm)
    ServerSocket1: TServerSocket;
    ClientSocket1: TClientSocket;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
function GetNetUser : Ansistring;
var
dwl : DWORD;
begin
dwl :=MAX_PATH;
SetLength(Result, dwl+1);
if WNetGetUser(Nil,PChar(Result),dwl)=no_error then
SetLength(Result,StrLen(PChar(Result)))
else
SetLength(Result,0);
end;
procedure TMainForm.Button1Click(Sender: TObject);
begin
if Button1.Caption='Putus' then
begin
ClientSocket1.Active:=false;
Button1.Caption:='Connect'
end else
begin
ClientSocket1.Host:=Edit1.Text;
ClientSocket1.Port:=1880;
ClientSocket1.Active:=True;
Button1.Caption:='Putus';
if MessageDlg('Koneksi Berhasil, Silahkan Chat Sepuasnya..',mtInformation,[mbYes],0)=1 then
begin
Edit3.SetFocus;
end else
if MessageDlg('Koneksi Bermasalah !! Sambungan Gagal',mtError,[mbOk],0)=mrOk then
begin
Abort;
end else
Abort;
end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  if (ClientSocket1.Socket.Connected) then
begin
if Trim(Edit2.Text)='' then
begin
memo1.Lines.Add(Edit2.Text+Edit3.Text);
end else
begin
memo1.Lines.Add(Edit2.Text+':'+Edit3.Text);
ClientSocket1.Socket.sendtext(Edit2.Text+':'+Edit3.Text);
end;
Edit3.Text:='';
end;
    end;
procedure TMainForm.FormCreate(Sender: TObject);
begin
 ServerSocket1.Port:=1880;
ServerSocket1.Open;
Edit2.Text:=GetNetUser;
end;

procedure TMainForm.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
    if MessageDlg('Koneksi Bermasalah !! Sambungan Gagal',mtError,[mbOk],0)=mrOk then
begin
Abort;
end else
Abort;end;
 
procedure TMainForm.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 memo1.Lines.Add(Socket.ReceiveText);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Edit3.SetFocus;
end;

end.
