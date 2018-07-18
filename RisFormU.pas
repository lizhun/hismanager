unit RisFormU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, HisManager, HisEntity;

type
  TRisTimeForm = class(TForm)
    btn_risTime: TButton;
    lbledt_ordrowid: TLabeledEdit;
    lbledt_studyno: TLabeledEdit;
    lbledt_doccode: TLabeledEdit;
    lbledt_doc: TLabeledEdit;
    lbledt_startDate: TLabeledEdit;
    lbledt_starttime: TLabeledEdit;
    lbledt_endDate: TLabeledEdit;
    lbledt_endTime: TLabeledEdit;
    procedure btn_risTimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RisTimeForm: TRisTimeForm;

implementation

{$R *.dfm}

procedure TRisTimeForm.btn_risTimeClick(Sender: TObject);
var
  data: TRisTimeAxisReq;
begin
  data := TRisTimeAxisReq.Create;
  data.OrdRowID := lbledt_ordrowid.Text;
  data.StudyNo := lbledt_studyno.Text;
  data.DocCode := lbledt_doccode.Text;
  data.Doc := lbledt_doc.Text;
  data.StartDate := lbledt_startDate.Text;
  data.StartTime := lbledt_starttime.Text;
  data.EndDate := lbledt_endDate.Text;
  data.EndTime := lbledt_endTime.Text;

end;

end.

