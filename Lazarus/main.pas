{$WARN UNIT_PLATFORM OFF}
unit main;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    CommandLineEdit: TEdit;
    CommandEdit: TEdit;
    ApplicationLabel: TLabel;
    RunBtn: TButton;
    StopBtn: TButton;
    CommandLabel: TLabel;
    SendBtn: TButton;
    OutputMemo: TMemo;
    ErrorMemo: TMemo;
    OutputLabel: TLabel;
    ErrorLabel: TLabel;
    DebugMemo: TMemo;
    DebugLabel: TLabel;
    ExitBtn: TButton;
    EnableKillCheck: TCheckBox;
    StopOnFreeCheck: TCheckBox;
    SetTerminateCommandBtn: TButton;
    SetWaitTimeoutBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
    procedure SendBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure ConsoleIO_Error(Sender: TObject; const Cmd: string);
    procedure ConsoleIO_ProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure ConsoleIO_ReceiveError(Sender: TObject; const Cmd: string);
    procedure ConsoleIO_ReceiveOutput(Sender: TObject; const Cmd: string);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EnableKillCheckClick(Sender: TObject);
    procedure StopOnFreeCheckClick(Sender: TObject);
    procedure SetTerminateCommandBtnClick(Sender: TObject);
    procedure SetWaitTimeoutBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RefreshButtonState;
  end;

var
  frmMain: TfrmMain;

implementation
uses
  ConsoleIO;

var
  ConsoleIO: TConsoleIO;

{$R *.lfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  OutputMemo.Clear;
  ErrorMemo.Clear;
  DebugMemo.Clear;
  RefreshButtonState;
end;

procedure TfrmMain.RunBtnClick(Sender: TObject);
begin
  ConsoleIO.RunProcess(CommandLineEdit.Text);
end;

procedure TfrmMain.SendBtnClick(Sender: TObject);
begin
  ConsoleIO.SendInput(CommandEdit.Text);
end;

procedure TfrmMain.StopBtnClick(Sender: TObject);
begin
  ConsoleIO.StopProcess;
end;

procedure TfrmMain.ConsoleIO_Error(Sender: TObject; const Cmd: string);
begin
  DebugMemo.Lines.Add(Cmd);
end;

procedure TfrmMain.ConsoleIO_ProcessStatusChange(Sender: TObject;
  IsRunning: Boolean);
begin
  RefreshButtonState;
end;

procedure TfrmMain.ConsoleIO_ReceiveError(Sender: TObject;
  const Cmd: string);
begin
  ErrorMemo.Lines.Add(Cmd);
end;

procedure TfrmMain.ConsoleIO_ReceiveOutput(Sender: TObject;
  const Cmd: string);
begin
  OutputMemo.Lines.Add(Cmd);
end;

procedure TfrmMain.RefreshButtonState;
begin
  //if Assigned(RunBtn) then
  //  RunBtn.Enabled:= not ConsoleIO.IsRunning;
  //if Assigned(StopBtn) then
  //  StopBtn.Enabled:= ConsoleIO.IsRunning;
end;

procedure TfrmMain.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //ConsoleIO:= TConsoleIO.Create;
  //ConsoleIO.OnReceiveOutput:= ConsoleIO_ReceiveOutput;
  //ConsoleIO.OnReceiveError:= ConsoleIO_ReceiveError;
  //ConsoleIO.OnError:= ConsoleIO_Error;
  //ConsoleIO.OnProcessStatusChange:= ConsoleIO_ProcessStatusChange;
  //ConsoleIO.TerminateCommand:= 'quit()';
end;

procedure TfrmMain.FormResize(Sender: TObject);
var
  MemoWidth: Integer;
begin
  MemoWidth := (ClientWidth - 32) div 3;
  OutputMemo.Width := MemoWidth;
  ErrorMemo.Width := MemoWidth;
  DebugMemo.Width := MemoWidth;
  OutputMemo.Left := 8;
  ErrorMemo.Left := OutputMemo.Left + OutputMemo.Width + 8;
  DebugMemo.Left := ErrorMemo.Left + ErrorMemo.Width + 8;
  OutputLabel.Left := OutputMemo.Left + 8;
  ErrorLabel.Left := ErrorMemo.Left + 8;
  DebugLabel.Left := DebugMemo.Left + 8;
end;

procedure TfrmMain.EnableKillCheckClick(Sender: TObject);
begin
  ConsoleIO.EnableKill := EnableKillCheck.Checked;
end;

procedure TfrmMain.StopOnFreeCheckClick(Sender: TObject);
begin
  ConsoleIO.StopProcessOnFree := StopOnFreeCheck.Checked;
end;

procedure TfrmMain.SetTerminateCommandBtnClick(Sender: TObject);
begin
  ConsoleIO.TerminateCommand := InputBox('Input',
    'Set terminate command for process:', ConsoleIO.TerminateCommand);
end;

procedure TfrmMain.SetWaitTimeoutBtnClick(Sender: TObject);
begin
  ConsoleIO.WaitTimeout := StrToInt(InputBox('Input',
    'Set wait process timeout:', IntToStr(ConsoleIO.WaitTimeout)));
end;

end.
