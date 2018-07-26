unit HisManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  SOAPHTTPClient, Rio, StdCtrls, Dialogs, InvokeRegistry, xmldom, XMLDoc,
  msxmldom, XMLIntf, HisEntity, StrUtils, ADODB, DB, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Buttons; //,xmldom,XMLDoc,msxml,XMLIntf

type
  THisManager = class
  private
  public
    class function MGetPatOrdList(ACardValue: string; ACardTypes: string; AStartDate: string; AEndDate: string; AExeLoc: string; AEpsiodeType: string): TStringList; //获取医嘱列表	14
    class function MBookedInfo(Abookedinfo: TBookedInfo): Boolean; //预约	16
    class function MCancelBookedInfo(AcancelBookedInfo: TCancelBookedInfo): Boolean; //取消预约	17
    class function MRegInfo(Areginfo: TRegInfo): Boolean; //检查登记	18
    class function MCancelFeeApp(AcancelFeeApp: TCancelFeeApp): Boolean; //退费申请	20
    class function MCheckComplete(Acheckcomplete: TCheckComplete): Boolean; //检查完成信息	21
    class function MReturnReports(AReturnReport: TReturnReport): Boolean; //返回报告	22
    class function MCancelReport(AcancelReport: TCancelReport): Boolean; //取消报告审核	23
    class function MGetAppForm(AOrdRowID: string): string; //取得申请单内容,html文档	传入医嘱号
    class function MGetDictInfo(AdicCat: string): TStringList; //科室人员字典	 0科室 1病区  2人员
                                                          //  3 医嘱大类 4 医嘱子类 (4@医嘱大类) 5 医嘱字典信息(按大类获取)
                                                          //(5@医嘱大类) 6医嘱字典信息（按子类获取）6@医嘱子类)
    class function MGetPatInfo(AcardNo: string; AcardType: string): TStringList; //获取病人基本信息	28
    class function MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean; //保存危急值
    class function SaveAntCVResultToDb(con: TADOConnection; data: TSaveAntCVResult): Boolean; //保存危急值到数据库
    class function MMakeSaveAntCVResultStr(ASaveAntCVResult: TSaveAntCVResult): WideString;
    class function MRegisterDocument(ARegisterDocument: TRegisterDocument): Boolean;
    class function MValidateTicket(const Asourcing: string; const Atickets: string; const Acode: string): TValidateTicketRes;
    class function MGetValidateInfo: TValidateInfo;  //单点登录
    class function MGetAdmInfo(const admNo: string): TAdmRes;  //获取就诊信息
    class function MRisTimeAxis(const risTimeAxis: TRisTimeAxisReq): Boolean;  // 时间轴
  end;

implementation

function BookedInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function CancelBookedInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function CancelFeeApp(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function CancelReport(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function CheckComplete(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function GetAppForm(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function GetDictInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function GetPatInfoToRIS(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function GetPatOrdList(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function RegInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function ReturnReports(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function SendPatOrdListToRis(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function SaveAntCVResult(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function DHCWebInterface(const Input: PWideChar; const Input1: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';

function RegisterDocument(const Input: PWideChar; const Input1: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';
{ THisManager }

class function THisManager.MBookedInfo(Abookedinfo: TBookedInfo): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><BookedInfos><BookedInfo>';
    resultstr := resultstr + '<OrdRowID>' + Abookedinfo.OrdRowID + '</OrdRowID>';
    resultstr := resultstr + '<ResourceCode>' + Abookedinfo.ResourceCode + '</ResourceCode>';
    resultstr := resultstr + '<Resource>' + Abookedinfo.Resource + '</Resource>';
    resultstr := resultstr + '<BookedDate>' + Abookedinfo.BookedDate + '</BookedDate>';
    resultstr := resultstr + '<BookedTime>' + Abookedinfo.BookedTime + '</BookedTime>';
    resultstr := resultstr + '<BookedAddress>' + Abookedinfo.BookedAddress + '</BookedAddress>';
    resultstr := resultstr + '<OperatorCode>' + Abookedinfo.OperatorCode + '</OperatorCode>';
    resultstr := resultstr + '<Operator>' + Abookedinfo.operator + '</Operator>';
    resultstr := resultstr + '<NoteInfo>' + Abookedinfo.NoteInfo + '</NoteInfo>';
    resultstr := resultstr + '<OtherInfo>' + Abookedinfo.OtherInfo + '</OtherInfo>';
    resultstr := resultstr + '</BookedInfo></BookedInfos></Request>';
        // ShowMessage(resultstr);
    resultstr := BookedInfo(PWideChar(resultstr));
        // ShowMessage(resultstr);
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
        //ShowMessage(resultstr);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

class function THisManager.MCancelBookedInfo(AcancelBookedInfo: TCancelBookedInfo): Boolean;
begin
  Result := False;
end;

class function THisManager.MCancelFeeApp(AcancelFeeApp: TCancelFeeApp): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><CancelFeeApps><CancelFeeApp>';
    resultstr := resultstr + '<OrdRowID>' + AcancelFeeApp.OrdRowID + '</OrdRowID>';
    resultstr := resultstr + '<OperatorCode>' + AcancelFeeApp.OperatorCode + '</OperatorCode>';
    resultstr := resultstr + '<Operator>' + AcancelFeeApp.operator + '</Operator>';
    resultstr := resultstr + '<CancelFeeAppDate>' + AcancelFeeApp.CancelFeeAppDate + '</CancelFeeAppDate>';
    resultstr := resultstr + '<CancelFeeAppTime>' + AcancelFeeApp.CancelFeeAppTime + '</CancelFeeAppTime>';
    resultstr := resultstr + '<CancelFeeAppReason>' + AcancelFeeApp.CancelFeeAppReason + '</CancelFeeAppReason>';
    resultstr := resultstr + '</CancelFeeApp></CancelFeeApps></Request>';
        //ShowMessage(resultstr);
    resultstr := CancelFeeApp(PWideChar(resultstr));
         //ShowMessage(resultstr);
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
        //ShowMessage(resultstr);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

class function THisManager.MCancelReport(AcancelReport: TCancelReport): Boolean;
begin
  Result := False;
end;

class function THisManager.MCheckComplete(Acheckcomplete: TCheckComplete): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><CheckCompletes><CheckComplete>';
    resultstr := resultstr + '<OrdRowID>' + Acheckcomplete.OrdRowID + '</OrdRowID>'; //	医嘱Rowid
    resultstr := resultstr + '<StudyNo>' + Acheckcomplete.StudyNo + '</StudyNo>';	 //	检查号
    resultstr := resultstr + '<PicturePath>' + Acheckcomplete.PicturePath + '</PicturePath>'; //	图像路径
    resultstr := resultstr + '<OperatorCode>' + Acheckcomplete.OperatorCode + '</OperatorCode>'; //	操作员代码
    resultstr := resultstr + '<Operator>' + Acheckcomplete.operator + '</Operator>'; //	操作员
    resultstr := resultstr + '<CheckUpDate>' + Acheckcomplete.CheckUpDate + '</CheckUpDate>';  //	检查日期
    resultstr := resultstr + '<CheckUpTime>' + Acheckcomplete.CheckUpTime + '</CheckUpTime>';  //	检查时间
    resultstr := resultstr + '</CheckComplete></CheckCompletes></Request>';
    resultstr := CheckComplete(PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

class function THisManager.MGetAppForm(AOrdRowID: string): string;
begin
  Result := '';
end;

class function THisManager.MGetDictInfo(AdicCat: string): TStringList;
begin
  Result := nil;
end;

class function THisManager.MGetPatInfo(AcardNo: string; AcardType: string): TStringList;
var
  resultstr: WideString;
  xml: IXMLDocument;
  xmlnode: IXMLNode;
  nodelist: IXMLNodeList;
  data: TPatInfo;
  list: TStringList;
  i: Integer;
  ansistr: string;
begin
  try
    resultstr := '<Request><CardNo>' + AcardNo + '</CardNo><CardType>' + AcardType + '</CardType ></Request>';
    resultstr := GetPatInfoToRIS(PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    list := TStringList.Create;
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      nodelist := xml.ChildNodes.Nodes['Request'].ChildNodes.Nodes['PatInfos'].ChildNodes;
      for i := 0 to nodelist.Count - 1 do
      begin
        xmlnode := nodelist.Get(i);
        data := TPatInfo.Create;
        data.RegNo := xmlnode.ChildNodes.Nodes['RegNo'].Text;
        data.DocumentID := xmlnode.ChildNodes.Nodes['DocumentID'].Text;
        data.PatName := xmlnode.ChildNodes.Nodes['PatName'].Text;
        data.Age := xmlnode.ChildNodes.Nodes['Age'].Text;
        data.Sex := xmlnode.ChildNodes.Nodes['Sex'].Text;
        data.CardID := xmlnode.ChildNodes.Nodes['CardID'].Text;
        data.Telephone := xmlnode.ChildNodes.Nodes['Telephone'].Text;
        data.Address := xmlnode.ChildNodes.Nodes['Address'].Text;
        data.Nation := xmlnode.ChildNodes.Nodes['Nation'].Text;
        list.AddObject(inttostr(i), data);
      end;
    end;
    xml := nil;
    nodelist := nil;
    xmlnode := nil;
    Result := list;
  except
    Result := nil;
  end;
end;

class function THisManager.MGetPatOrdList(ACardValue, ACardTypes, AStartDate, AEndDate, AExeLoc, AEpsiodeType: string): TStringList;
var
  data: TPatOrd;
  list: TStringList;
  xmllist: IXMLNodeList;
  resultstr: WideString;
  xml: IXMLDocument;
  xmlnode: IXMLNode;
  i: Integer;
  ansistr: string;
begin
  try
    list := TStringList.Create;
    resultstr := resultstr + '<Request>';
    resultstr := resultstr + '<CardValue>' + ACardValue + '</CardValue>';
    resultstr := resultstr + '<CardTypes>' + ACardTypes + '</CardTypes>';
    resultstr := resultstr + '<StartDate>' + AStartDate + '</StartDate>';
    resultstr := resultstr + '<EndDate>' + AEndDate + '</EndDate>';
    resultstr := resultstr + '<ExeLoc>' + AExeLoc + '</ExeLoc>';
    resultstr := resultstr + '<EpsiodeType>' + AEpsiodeType + '</EpsiodeType>';
    resultstr := resultstr + '</Request>';
      // ShowMessage(resultstr);
    resultstr := GetPatOrdList(PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    resultstr := StringReplace(resultstr, ']]]]><![CDATA[>', '', [rfReplaceAll]);
    resultstr := StringReplace(resultstr, '<![CDATA[', '', [rfReplaceAll]);
    resultstr := StringReplace(resultstr, ']]>', '', [rfReplaceAll]);
    resultstr := StringReplace(resultstr, '&', '', [rfReplaceAll]);
    resultstr := StringReplace(resultstr, '^', '', [rfReplaceAll]);
       //ShowMessage(resultstr);
    ansistr := UTF8Encode(resultstr);
       // ShowMessage(ansistr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      xmllist := xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['PatOrdLists'].ChildNodes;
      for i := 0 to xmllist.Count - 1 do
      begin
        xmlnode := xmllist.Get(i);
        data := TPatOrd.Create;
        data.RegNo := xmlnode.ChildNodes.Nodes['RegNo'].Text;
        data.CardNo := xmlnode.ChildNodes.Nodes['RegNo'].Text;
        data.Name := xmlnode.ChildNodes.Nodes['Name'].Text;
        data.SexCode := xmlnode.ChildNodes.Nodes['SexCode'].Text;
        data.Sex := xmlnode.ChildNodes.Nodes['Sex'].Text;
        data.Age := xmlnode.ChildNodes.Nodes['Age'].Text;
        data.BirthDay := xmlnode.ChildNodes.Nodes['BirthDay'].Text;
        data.Marry := xmlnode.ChildNodes.Nodes['Marry'].Text;
        data.Address := xmlnode.ChildNodes.Nodes['Address'].Text;
        data.Telephone := xmlnode.ChildNodes.Nodes['Telephone'].Text;
        data.CredentialNo := xmlnode.ChildNodes.Nodes['CredentialNo'].Text;
        data.NationCode := xmlnode.ChildNodes.Nodes['NationCode'].Text;
        data.Nation := xmlnode.ChildNodes.Nodes['Nation'].Text;
        data.OccupationCode := xmlnode.ChildNodes.Nodes['OccupationCode'].Text;
        data.Occupation := xmlnode.ChildNodes.Nodes['Occupation'].Text;
        data.DocumentID := xmlnode.ChildNodes.Nodes['DocumentID'].Text;
        data.InsuranceNo := xmlnode.ChildNodes.Nodes['InsuranceNo'].Text;
        data.AdmType := xmlnode.ChildNodes.Nodes['AdmType'].Text;
        data.AdmNo := xmlnode.ChildNodes.Nodes['AdmNo'].Text;
        data.AdmSerialNum := xmlnode.ChildNodes.Nodes['AdmSerialNum'].Text;
        data.FeeType := xmlnode.ChildNodes.Nodes['FeeType'].Text;
        data.WardCode := xmlnode.ChildNodes.Nodes['WardCode'].Text;
        data.Ward := xmlnode.ChildNodes.Nodes['Ward'].Text;
        data.RoomCode := xmlnode.ChildNodes.Nodes['RoomCode'].Text;
        data.Room := xmlnode.ChildNodes.Nodes['Room'].Text;
        data.BedNo := xmlnode.ChildNodes.Nodes['BedNo'].Text;
        data.ClinicDiagnose := xmlnode.ChildNodes.Nodes['ClinicDiagnose'].Text;
        data.ClinicDisease := xmlnode.ChildNodes.Nodes['ClinicDisease'].Text;
        data.OperationInfo := xmlnode.ChildNodes.Nodes['OperationInfo'].Text;
        data.OtherInfo := xmlnode.ChildNodes.Nodes['OtherInfo'].Text;
        data.OrdRowID := xmlnode.ChildNodes.Nodes['OrdRowID'].Text;
        data.OrdName := xmlnode.ChildNodes.Nodes['OrdName'].Text;
        data.OrdCode := xmlnode.ChildNodes.Nodes['OrdCode'].Text;
        data.OrdPrice := xmlnode.ChildNodes.Nodes['OrdPrice'].Text;
        data.OrdBillStatus := xmlnode.ChildNodes.Nodes['OrdBillStatus'].Text;
        data.OrdPriorityCode := xmlnode.ChildNodes.Nodes['OrdPriorityCode'].Text;
        data.OrdPriority := xmlnode.ChildNodes.Nodes['OrdPriority'].Text;
        data.Hospital := xmlnode.ChildNodes.Nodes['Hospital'].Text;
        data.OrdLocCode := xmlnode.ChildNodes.Nodes['OrdLocCode'].Text;
        data.OrdLoc := xmlnode.ChildNodes.Nodes['OrdLoc'].Text;
        data.OrdDoctorCode := xmlnode.ChildNodes.Nodes['OrdDoctorCode'].Text;
        data.OrdDoctor := xmlnode.ChildNodes.Nodes['OrdDoctor'].Text;
        data.OrdDate := xmlnode.ChildNodes.Nodes['OrdDate'].Text;
        data.OrdTime := xmlnode.ChildNodes.Nodes['OrdTime'].Text;
        data.OrdExeLocCode := xmlnode.ChildNodes.Nodes['OrdExeLocCode'].Text;
        data.OrdExeLoc := xmlnode.ChildNodes.Nodes['OrdExeLoc'].Text;
        data.Position := xmlnode.ChildNodes.Nodes['Position'].Text;
        data.Purpose := xmlnode.ChildNodes.Nodes['Purpose'].Text;
        list.AddObject(inttostr(i), data);
      end;
    end;
    xml := nil;
    xmllist := nil;
    xmlnode := nil;
    Result := list;
  except
    Result := nil;
  end;
end;

class function THisManager.MRegInfo(Areginfo: TRegInfo): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><RegInfos><RegInfo>';
    resultstr := resultstr + '<OrdRowID>' + Areginfo.OrdRowID + '</OrdRowID>'; //	医嘱Rowid
    resultstr := resultstr + '<StudyNo>' + Areginfo.StudyNo + '</StudyNo>';	 //	检查号
    resultstr := resultstr + '<EQInfo>' + Areginfo.EQInfo + '</EQInfo>'; //	图像路径
    resultstr := resultstr + '<OperatorCode>' + Areginfo.OperatorCode + '</OperatorCode>'; //	操作员代码
    resultstr := resultstr + '<Operator>' + Areginfo.operator + '</Operator>'; //	操作员
    resultstr := resultstr + '<MainDocCode>' + Areginfo.MainDocCode + '</MainDocCode>';
    resultstr := resultstr + '<MainDoc>' + Areginfo.MainDoc + '</MainDoc>';
    resultstr := resultstr + '<RegDate>' + Areginfo.RegDate + '</RegDate>';
    resultstr := resultstr + '<RegTime>' + Areginfo.RegTime + '</RegTime>';
    resultstr := resultstr + '</RegInfo></RegInfos></Request>';
        //ShowMessage(resultstr);
    resultstr := RegInfo(PWideChar(resultstr));
         //ShowMessage(resultstr);
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
        //ShowMessage(resultstr);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end
  except
    Result := False;
  end;
end;

class function THisManager.MReturnReports(AReturnReport: TReturnReport): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><ReturnReports><ReturnReport>';
    resultstr := resultstr + '<OrdRowID>' + AReturnReport.OrdRowID + '</OrdRowID>'; //	医嘱Rowid
    resultstr := resultstr + '<StudyNo>' + AReturnReport.StudyNo + '</StudyNo>';	 //	检查号
    resultstr := resultstr + '<GetDocCode>' + AReturnReport.GetDocCode + '</GetDocCode>';
    resultstr := resultstr + '<GetDoc>' + AReturnReport.GetDoc + '</GetDoc>';
    resultstr := resultstr + '<ReportStatusCode>' + AReturnReport.ReportStatusCode + '</ReportStatusCode>';
    resultstr := resultstr + '<ReportStatus>' + AReturnReport.ReportStatus + '</ReportStatus>';
    resultstr := resultstr + '<UnsendCause>' + AReturnReport.UnsendCause + '</UnsendCause>';
    resultstr := resultstr + '<ReportDocCode>' + AReturnReport.ReportDocCode + '</ReportDocCode>';
    resultstr := resultstr + '<AuditDoc>' + AReturnReport.AuditDoc + '</AuditDoc>';
    resultstr := resultstr + '<ReportDate>' + AReturnReport.ReportDate + '</ReportDate>';
    resultstr := resultstr + '<ReportTime>' + AReturnReport.ReportTime + '</ReportTime>';
    resultstr := resultstr + '<AuditTime>' + AReturnReport.AuditTime + '</AuditTime>';
    resultstr := resultstr + '<Memo>' + AReturnReport.Memo + '</Memo>';
    resultstr := resultstr + '<ImageFile>' + AReturnReport.ImageFile + '</ImageFile>';
    resultstr := resultstr + '<EyeSee>' + AReturnReport.EyeSee + '</EyeSee>';
    resultstr := resultstr + '<ExamSee>' + AReturnReport.ExamSee + '</ExamSee>';
    resultstr := resultstr + '<Diagnose>' + AReturnReport.Diagnose + '</Diagnose>';
    resultstr := resultstr + '</ReturnReport></ReturnReports></Request>';
        //ShowMessage(resultstr);
    resultstr := ReturnReports(PWideChar(resultstr));
        //ShowMessage(resultstr);
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
        //ShowMessage(resultstr);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end
  except
    Result := False;
  end;
end;

class function THisManager.MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  try
    resultstr := '<Request><SaveAntCVResults><SaveAntCVResult>';
    resultstr := resultstr + '<AntCVResultID>' + ASaveAntCVResult.AntCVResultID + '</AntCVResultID>';
    resultstr := resultstr + '<ReportType>' + ASaveAntCVResult.ReportType + '</ReportType>';
    resultstr := resultstr + '<StudyNo>' + ASaveAntCVResult.StudyNo + '</StudyNo>';
    resultstr := resultstr + '<OrdRowID>' + ASaveAntCVResult.OrdRowID + '</OrdRowID>';
    resultstr := resultstr + '<AuditDate>' + ASaveAntCVResult.AuditDate + '</AuditDate>';
    resultstr := resultstr + '<AuditTime>' + ASaveAntCVResult.AuditTime + '</AuditTime>';
    resultstr := resultstr + '<AuditDocCode>' + ASaveAntCVResult.AuditDocCode + '</AuditDocCode>';
    resultstr := resultstr + '<AuditDocname>' + ASaveAntCVResult.AuditDocname + '</AuditDocname>';
    resultstr := resultstr + '<AuditComment>' + ASaveAntCVResult.AuditComment + '</AuditComment>';
    resultstr := resultstr + '<OrdName>' + ASaveAntCVResult.OrdName + '</OrdName>';
    resultstr := resultstr + '<Result>' + ASaveAntCVResult.Result + '</Result>';
    resultstr := resultstr + '<Ranges>' + ASaveAntCVResult.Ranges + '</Ranges>';
    resultstr := resultstr + '<OrdDoc>' + ASaveAntCVResult.OrdDoc + '</OrdDoc>';
    resultstr := resultstr + '<OrdDate>' + ASaveAntCVResult.OrdDate + '</OrdDate>';
    resultstr := resultstr + '<OrdTime>' + ASaveAntCVResult.OrdTime + '</OrdTime>';
    resultstr := resultstr + '<ColDoc>' + ASaveAntCVResult.ColDoc + '</ColDoc>';
    resultstr := resultstr + '<ColDate>' + ASaveAntCVResult.ColDate + '</ColDate>';
    resultstr := resultstr + '<ColTime>' + ASaveAntCVResult.ColTime + '</ColTime>';
    resultstr := resultstr + '<RecDoc>' + ASaveAntCVResult.RecDoc + '</RecDoc>';
    resultstr := resultstr + '<RecDate>' + ASaveAntCVResult.RecDate + '</RecDate>';
    resultstr := resultstr + '<RecTime>' + ASaveAntCVResult.RecTime + '</RecTime>';
    resultstr := resultstr + '<WarDate>' + ASaveAntCVResult.WarDate + '</WarDate>';
    resultstr := resultstr + '<WarTime>' + ASaveAntCVResult.WarTime + '</WarTime>';
    resultstr := resultstr + '<CheckDoc>' + ASaveAntCVResult.CheckDoc + '</CheckDoc>';
    resultstr := resultstr + '<CheckDate>' + ASaveAntCVResult.CheckDate + '</CheckDate>';
    resultstr := resultstr + '<CheckTime>' + ASaveAntCVResult.CheckTime + '</CheckTime>';
    resultstr := resultstr + '<ReportDoc>' + ASaveAntCVResult.ReportDoc + '</ReportDoc>';
    resultstr := resultstr + '<ReportDate>' + ASaveAntCVResult.ReportDate + '</ReportDate>';
    resultstr := resultstr + '<ReportTime>' + ASaveAntCVResult.ReportTime + '</ReportTime>';
    resultstr := resultstr + '<SpecType>' + ASaveAntCVResult.SpecType + '</SpecType>';
    resultstr := resultstr + '<Comment>' + ASaveAntCVResult.Comment + '</Comment>';
    resultstr := resultstr + '<Note>' + ASaveAntCVResult.Note + '</Note>';
    resultstr := resultstr + '</SaveAntCVResult></SaveAntCVResults></Request>';
    resultstr := SaveAntCVResult(PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;
end;

class function THisManager.MMakeSaveAntCVResultStr(ASaveAntCVResult: TSaveAntCVResult): WideString;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
begin
  resultstr := '<Request><SaveAntCVResults><SaveAntCVResult>';
  resultstr := resultstr + '<AntCVResultID>' + ASaveAntCVResult.AntCVResultID + '</AntCVResultID>';
  resultstr := resultstr + '<ReportType>' + ASaveAntCVResult.ReportType + '</ReportType>';
  resultstr := resultstr + '<StudyNo>' + ASaveAntCVResult.StudyNo + '</StudyNo>';
  resultstr := resultstr + '<OrdRowID>' + ASaveAntCVResult.OrdRowID + '</OrdRowID>';
  resultstr := resultstr + '<AuditDate>' + ASaveAntCVResult.AuditDate + '</AuditDate>';
  resultstr := resultstr + '<AuditTime>' + ASaveAntCVResult.AuditTime + '</AuditTime>';
  resultstr := resultstr + '<AuditDocCode>' + ASaveAntCVResult.AuditDocCode + '</AuditDocCode>';
  resultstr := resultstr + '<AuditDocName>' + ASaveAntCVResult.AuditDocname + '</AuditDocName>';
  resultstr := resultstr + '<AuditComment>' + ASaveAntCVResult.AuditComment + '</AuditComment>';
  resultstr := resultstr + '<OrdName>' + ASaveAntCVResult.OrdName + '</OrdName>';
  resultstr := resultstr + '<Result>' + ASaveAntCVResult.Result + '</Result>';
  resultstr := resultstr + '<Ranges>' + ASaveAntCVResult.Ranges + '</Ranges>';
  resultstr := resultstr + '<OrdDoc>' + ASaveAntCVResult.OrdDoc + '</OrdDoc>';
  resultstr := resultstr + '<OrdDate>' + ASaveAntCVResult.OrdDate + '</OrdDate>';
  resultstr := resultstr + '<OrdTime>' + ASaveAntCVResult.OrdTime + '</OrdTime>';
  resultstr := resultstr + '<ColDoc>' + ASaveAntCVResult.ColDoc + '</ColDoc>';
  resultstr := resultstr + '<ColDate>' + ASaveAntCVResult.ColDate + '</ColDate>';
  resultstr := resultstr + '<ColTime>' + ASaveAntCVResult.ColTime + '</ColTime>';
  resultstr := resultstr + '<RecDoc>' + ASaveAntCVResult.RecDoc + '</RecDoc>';
  resultstr := resultstr + '<RecDate>' + ASaveAntCVResult.RecDate + '</RecDate>';
  resultstr := resultstr + '<RecTime>' + ASaveAntCVResult.RecTime + '</RecTime>';
  resultstr := resultstr + '<WarDate>' + ASaveAntCVResult.WarDate + '</WarDate>';
  resultstr := resultstr + '<WarTime>' + ASaveAntCVResult.WarTime + '</WarTime>';
  resultstr := resultstr + '<CheckDoc>' + ASaveAntCVResult.CheckDoc + '</CheckDoc>';
  resultstr := resultstr + '<CheckDate>' + ASaveAntCVResult.CheckDate + '</CheckDate>';
  resultstr := resultstr + '<CheckTime>' + ASaveAntCVResult.CheckTime + '</CheckTime>';
  resultstr := resultstr + '<ReportDoc>' + ASaveAntCVResult.ReportDoc + '</ReportDoc>';
  resultstr := resultstr + '<ReportDate>' + ASaveAntCVResult.ReportDate + '</ReportDate>';
  resultstr := resultstr + '<ReportTime>' + ASaveAntCVResult.ReportTime + '</ReportTime>';
  resultstr := resultstr + '<SpecType>' + ASaveAntCVResult.SpecType + '</SpecType>';
  resultstr := resultstr + '<Comment>' + ASaveAntCVResult.Comment + '</Comment>';
  resultstr := resultstr + '<Note>' + ASaveAntCVResult.Note + '</Note>';
  resultstr := resultstr + '</SaveAntCVResult></SaveAntCVResults></Request>';
  Result := resultstr;
end;

class function THisManager.SaveAntCVResultToDb(con: TADOConnection; data: TSaveAntCVResult): Boolean;
var
  query: TADOQuery;
  count: Integer;
begin
  query := TADOQuery.Create(nil);
  query.Connection := con;
  query.SQL.Text := 'select 1 from TB_AckAntCVResult where StudyNo=:StudyNo';
  query.Parameters.ParamByName('StudyNo').value := data.StudyNo;
  query.Prepared := True;
  query.Open;
  count := query.Recordset.RecordCount;
  query.Close;
  query.SQL.Clear;
  query.Parameters.Clear;
  if count > 0 then
  begin
    query.SQL.Text := 'update TB_AckAntCVResult set AntCVResultID=:AntCVResultID,ReportType=:ReportType,StudyNo=:StudyNo,OrdRowID=:OrdRowID,AuditDate=:AuditDate,AuditTime=:AuditTime,AuditDocCode=:AuditDocCode,AuditDocName=:AuditDocName,' + 'AuditComment=:AuditComment,OrdName=:OrdName,Result=:Result,Ranges=:Ranges,OrdDoc=:OrdDoc,OrdDate=:OrdDate,OrdTime=:OrdTime,ColDoc=:ColDoc, ' + 'ColDate=:ColDate,ColTime=:ColTime,RecDoc=:RecDoc,RecDate=:RecDate,RecTime=:RecTime,WarDate=:WarDate,WarTime=:WarTime,CheckDoc=:CheckDoc,CheckDate=:CheckDate, ' + 'CheckTime=:CheckTime,ReportDoc=:ReportDoc,ReportDate=:ReportDate,ReportTime=:ReportTime,SpecType=:SpecType,Comment=:Comment,Note=:Note,Status=:Status,LastUpateTime=:LastUpateTime where StudyNo=:StudyNo; ';

  end
  else
  begin
    query.SQL.Text := 'Insert into TB_AckAntCVResult ' + '(AntCVResultID,ReportType,StudyNo,OrdRowID,AuditDate,AuditTime,AuditDocCode,AuditDocName,' + 'AuditComment,OrdName,Result,Ranges,OrdDoc,OrdDate,OrdTime,ColDoc, ' + 'ColDate,ColTime,RecDoc,RecDate,RecTime,WarDate,WarTime,CheckDoc,CheckDate, ' + 'CheckTime,ReportDoc,ReportDate,ReportTime,SpecType,Comment,Note,Status,LastUpateTime) ' + 'VALUES ' + '(:AntCVResultID,:ReportType,:StudyNo,:OrdRowID,:AuditDate,:AuditTime,:AuditDocCode,:AuditDocName,' +
      ':AuditComment,:OrdName,:Result,:Ranges,:OrdDoc,:OrdDate,:OrdTime,:ColDoc,' + ':ColDate,:ColTime,:RecDoc,:RecDate,:RecTime,:WarDate,:WarTime,:CheckDoc,:CheckDate,' + ':CheckTime,:ReportDoc,:ReportDate,:ReportTime,:SpecType,:Comment,:Note,:Status,:LastUpateTime); ';
  end;
  query.Parameters.ParamByName('AntCVResultID').value := data.AntCVResultID;
  query.Parameters.ParamByName('ReportType').value := data.ReportType;
  query.Parameters.ParamByName('StudyNo').value := data.StudyNo;
  query.Parameters.ParamByName('OrdRowID').value := data.OrdRowID;
  query.Parameters.ParamByName('AuditDate').value := data.AuditDate;
  query.Parameters.ParamByName('AuditTime').value := data.AuditTime;
  query.Parameters.ParamByName('AuditDocCode').value := data.AuditDocCode;
  query.Parameters.ParamByName('AuditDocName').value := data.AuditDocName;
  query.Parameters.ParamByName('AuditComment').value := data.AuditComment;
  query.Parameters.ParamByName('OrdName').value := data.OrdName;
  query.Parameters.ParamByName('Result').value := data.Result;
  query.Parameters.ParamByName('Ranges').value := data.Ranges;
  query.Parameters.ParamByName('OrdDoc').value := data.OrdDoc;
  query.Parameters.ParamByName('OrdDate').value := data.OrdDate;
  query.Parameters.ParamByName('OrdTime').value := data.OrdTime;
  query.Parameters.ParamByName('ColDoc').value := data.ColDoc;
  query.Parameters.ParamByName('ColDate').value := data.ColDate;
  query.Parameters.ParamByName('ColTime').value := data.ColTime;
  query.Parameters.ParamByName('RecDoc').value := data.RecDoc;
  query.Parameters.ParamByName('RecDate').value := data.RecDate;
  query.Parameters.ParamByName('RecTime').value := data.RecTime;
  query.Parameters.ParamByName('WarDate').value := data.WarDate;
  query.Parameters.ParamByName('WarTime').value := data.WarTime;
  query.Parameters.ParamByName('CheckDoc').value := data.CheckDoc;
  query.Parameters.ParamByName('CheckDate').value := data.CheckDate;
  query.Parameters.ParamByName('CheckTime').value := data.CheckTime;
  query.Parameters.ParamByName('ReportDoc').value := data.ReportDoc;
  query.Parameters.ParamByName('ReportDate').value := data.ReportDate;
  query.Parameters.ParamByName('ReportTime').value := data.ReportTime;
  query.Parameters.ParamByName('SpecType').value := data.SpecType;
  query.Parameters.ParamByName('Comment').value := data.Comment;
  query.Parameters.ParamByName('Status').DataType := ftInteger;
  query.Parameters.ParamByName('Status').value := 1;
  query.Parameters.ParamByName('LastUpateTime').DataType := ftDateTime;
  query.Parameters.ParamByName('LastUpateTime').value := Now;
  query.Prepared := True;

  query.ExecSQL;
  query.Free;
  query := nil;
  Result := True;
end;

class function THisManager.MRegisterDocument(ARegisterDocument: TRegisterDocument): Boolean;
var
  resultstr: WideString;
  msgCode: WideString;
  xml: IXMLDocument;
  ansistr: string;
  len: Integer;
  i: Integer;
  admInfo: TAdmRes;
begin

  resultstr := '<BasicDataset code="HDSD00.05" displayName="检查报告" codeSystem="WSXXX-2012" codeSystemName="电子病历基本数据集" version="1.0">';
  resultstr := resultstr + '<HDSD00_05_078 dataelementCode="HDSD00.05.078" dataelementName="住院号" value="' + ARegisterDocument.ZYH + '"></HDSD00_05_078>';
  resultstr := resultstr + '<HDSD00_05_016 dataelementCode="HDSD00.05.016" dataelementName="电子申请单编号" value="' + ARegisterDocument.DZSQDBH + '"></HDSD00_05_016>';
  resultstr := resultstr + '<HDSD00_05_506 dataelementCode="HDSD00.05.506" dataelementName="患者身份证号" value="' + ARegisterDocument.HZSFZH + '"></HDSD00_05_506>';
  resultstr := resultstr + '<HDSD00_05_064 dataelementCode="HDSD00.05.064" dataelementName="门（急）诊号" value="' + ARegisterDocument.MJZH + '"></HDSD00_05_064>';
  resultstr := resultstr + '<HDSD00_05_065 dataelementCode="HDSD00.05.065" dataelementName="年龄（岁）" value="' + ARegisterDocument.NL_Year + '"></HDSD00_05_065>';
  resultstr := resultstr + '<HDSD00_05_066 dataelementCode="HDSD00.05.066" dataelementName="年龄（月）" value="' + ARegisterDocument.NL_Month + '"></HDSD00_05_066>';
  resultstr := resultstr + '<HDSD00_05_015 dataelementCode="HDSD00.05.015" dataelementName="电话号码" value="' + ARegisterDocument.Phone + '"></HDSD00_05_015>';
  resultstr := resultstr + '<HDSD00_05_069 dataelementCode="HDSD00.05.069" dataelementName="性别代码" value="' + ARegisterDocument.XB_Code + '"></HDSD00_05_069>';
  resultstr := resultstr + '<HDSD00_05_0691 dataelementCode="HDSD00.05.0691" dataelementName="性别名称" value="' + ARegisterDocument.XB_Name + '"></HDSD00_05_0691>';
  resultstr := resultstr + '<HDSD00_05_017 dataelementCode="HDSD00.05.017" dataelementName="患者类型代码" value="' + ARegisterDocument.HZLX_Code + '"></HDSD00_05_017>';
  resultstr := resultstr + '<HDSD00_05_0171 dataelementCode="HDSD00.05.0171" dataelementName="患者类型描述" value="' + ARegisterDocument.HZLX_Des + '"></HDSD00_05_0171>';
  resultstr := resultstr + '<HDSD00_05_018 dataelementCode="HDSD00.05.018" dataelementName="患者姓名" value="' + ARegisterDocument.HZ_Name + '"></HDSD00_05_018>';
  resultstr := resultstr + '<HDSD00_05_006 dataelementCode="HDSD00.05.006" dataelementName="病床号" value="' + ARegisterDocument.BC_Number + '"></HDSD00_05_006>';
  resultstr := resultstr + '<HDSD00_05_007 dataelementCode="HDSD00.05.007" dataelementName="病房号" value="' + ARegisterDocument.BF_Number + '"></HDSD00_05_007>';
  resultstr := resultstr + '<HDSD00_05_0071 dataelementCode="HDSD00.05.0071" dataelementName="病房代码" value="' + ARegisterDocument.BF_Code + '"></HDSD00_05_0071>';
  resultstr := resultstr + '<HDSD00_05_008 dataelementCode="HDSD00.05.008" dataelementName="病区名称" value="' + ARegisterDocument.BQ_Name + '"></HDSD00_05_008>';
  resultstr := resultstr + '<HDSD00_05_0081 dataelementCode="HDSD00.05.0081" dataelementName="病区代码" value="' + ARegisterDocument.BQ_Code + '"></HDSD00_05_0081>';
  resultstr := resultstr + '<HDSD00_05_059 dataelementCode="HDSD00.05.059" dataelementName="科室名称" value="' + ARegisterDocument.KS_Name + '"></HDSD00_05_059>';
  resultstr := resultstr + '<HDSD00_05_0591 dataelementCode="HDSD00.05.0591" dataelementName="科室代码" value="' + ARegisterDocument.KS_Code + '"></HDSD00_05_0591>';
  resultstr := resultstr + '<HDSD00_05_070 dataelementCode="HDSD00.05.070" dataelementName="医疗机构组织机构代码" value="' + ARegisterDocument.YLJGZZJG_Code + '"></HDSD00_05_070>';
  resultstr := resultstr + '<HDSD00_05_035 dataelementCode="HDSD00.05.035" dataelementName="检查申请机构名称" value="' + ARegisterDocument.JCSQJG_Name + '"></HDSD00_05_035>';
  resultstr := resultstr + '<HDSD00_05_022 dataelementCode="HDSD00.05.022" dataelementName="检查报告机构名称" value="' + ARegisterDocument.JCBGJG_Name + '"></HDSD00_05_022>';
  resultstr := resultstr + '<HDSD00_05_071 dataelementCode="HDSD00.05.071" dataelementName="诊断机构名称" value="' + ARegisterDocument.ZDJG_Name + '"></HDSD00_05_071>';
  resultstr := resultstr + '<HDSD00_05_033 dataelementCode="HDSD00.05.033" dataelementName="检查类别" value="' + ARegisterDocument.JC_Type + '"></HDSD00_05_033>';
  resultstr := resultstr + '<HDSD00_05_025 dataelementCode="HDSD00.05.025" dataelementName="检查报告科室" value="' + ARegisterDocument.JCBGKS + '"></HDSD00_05_025>';
  resultstr := resultstr + '<HDSD00_05_0251 dataelementCode="HDSD00.05.0251" dataelementName="检查报告科室代码" value="' + ARegisterDocument.JCBGKS_Code + '"></HDSD00_05_0251>';
  resultstr := resultstr + '<HDSD00_05_036 dataelementCode="HDSD00.05.036" dataelementName="检查申请科室" value="' + ARegisterDocument.JCSQKS + '"></HDSD00_05_036>';
  resultstr := resultstr + '<HDSD00_05_0361 dataelementCode="HDSD00.05.0361" dataelementName="检查申请科室代码" value="' + ARegisterDocument.JCSQKS_Code + '"></HDSD00_05_0361>';
  resultstr := resultstr + '<HDSD00_05_021 dataelementCode="HDSD00.05.021" dataelementName="检查报告单编号" value="' + ARegisterDocument.JCBGDBH + '"></HDSD00_05_021>';
  resultstr := resultstr + '<HDSD00_05_031 dataelementCode="HDSD00.05.031" dataelementName="检查技师签名" value="' + ARegisterDocument.JCJSQM + '"></HDSD00_05_031>';
  resultstr := resultstr + '<HDSD00_05_0311 dataelementCode="HDSD00.05.0311" dataelementName="检查技师签名代码" value="' + ARegisterDocument.JCJSQM_Code + '"></HDSD00_05_0311>';
  resultstr := resultstr + '<HDSD00_05_032 dataelementCode="HDSD00.05.032" dataelementName="检查结果代码" value="' + ARegisterDocument.JCJG_Code + '"></HDSD00_05_032>';
  resultstr := resultstr + '<HDSD00_05_0321 dataelementCode="HDSD00.05.0321" dataelementName="检查结果描述" value="' + ARegisterDocument.JCJG_Des + '"></HDSD00_05_0321>';
  resultstr := resultstr + '<HDSD00_05_034 dataelementCode="HDSD00.05.034" dataelementName="检查日期" value="' + ARegisterDocument.JC_Date + '"></HDSD00_05_034>';
  resultstr := resultstr + '<HDSD00_05_037 dataelementCode="HDSD00.05.037" dataelementName="检查项目代码" value="' + ARegisterDocument.JCXM_Code + '"></HDSD00_05_037>';
  resultstr := resultstr + '<HDSD00_05_0371 dataelementCode="HDSD00.05.0371" dataelementName="检查项目描述" value="' + ARegisterDocument.JCXM_Des + '"></HDSD00_05_0371>';
  resultstr := resultstr + '<HDSD00_05_020 dataelementCode="HDSD00.05.020" dataelementName="检查报告备注" value="' + ARegisterDocument.JCBGBZ + '"></HDSD00_05_020>';
  resultstr := resultstr + '<HDSD00_05_023 dataelementCode="HDSD00.05.023" dataelementName="检查报告结果-客观所见" value="' + ARegisterDocument.JCBGJG_KGSJ + '"></HDSD00_05_023>';
  resultstr := resultstr + '<HDSD00_05_024 dataelementCode="HDSD00.05.024" dataelementName="检查报告结果-主观提示" value="' + ARegisterDocument.JCBGJG_ZGTS + '"></HDSD00_05_024>';
  resultstr := resultstr + '<HDSD00_05_030 dataelementCode="HDSD00.05.030" dataelementName="检查方法名称" value="' + ARegisterDocument.JCFF_Name + '"></HDSD00_05_030>';
  resultstr := resultstr + '<HDSD00_05_026 dataelementCode="HDSD00.05.026" dataelementName="检查报告日期" value="' + ARegisterDocument.JCBG_Date + '"></HDSD00_05_026>';
  resultstr := resultstr + '<HDSD00_05_038 dataelementCode="HDSD00.05.038" dataelementName="检查医师签名" value="' + ARegisterDocument.JCYSQM + '"></HDSD00_05_038>';
  resultstr := resultstr + '<HDSD00_05_0381 dataelementCode="HDSD00.05.0381" dataelementName="检查医师签名代码" value="' + ARegisterDocument.JCYSQM_Code + '"></HDSD00_05_0381>';
  resultstr := resultstr + '<HDSD00_05_001 dataelementCode="HDSD00.05.001" dataelementName="报告医师签名" value="' + ARegisterDocument.BGYSQM + '"></HDSD00_05_001>';
  resultstr := resultstr + '<HDSD00_05_0011 dataelementCode="HDSD00.05.0011" dataelementName="报告医师签名代码" value="' + ARegisterDocument.BGYSQM_Code + '"></HDSD00_05_0011>';
  resultstr := resultstr + '<HDSD00_05_067 dataelementCode="HDSD00.05.067" dataelementName="审核医师签名" value="' + ARegisterDocument.SHYSQM + '"></HDSD00_05_067>';
  resultstr := resultstr + '<HDSD00_05_0671 dataelementCode="HDSD00.05.0671" dataelementName="审核医师签名代码" value="' + ARegisterDocument.SHYSQM_Code + '"></HDSD00_05_0671>';
  resultstr := resultstr + '<HDSD00_05_002 dataelementCode="HDSD00.05.002" dataelementName="标本采样日期时间" value="' + ARegisterDocument.BBCY_Date + '"></HDSD00_05_002>';
  resultstr := resultstr + '<HDSD00_05_003 dataelementCode="HDSD00.05.003" dataelementName="标本固定液名称" value="' + ARegisterDocument.BBGDY_Name + '"></HDSD00_05_003>';
  resultstr := resultstr + '<HDSD00_05_004 dataelementCode="HDSD00.05.004" dataelementName="标本类别" value="' + ARegisterDocument.BB_Type + '"></HDSD00_05_004>';
  resultstr := resultstr + '<HDSD00_05_005 dataelementCode="HDSD00.05.005" dataelementName="标本状态" value="' + ARegisterDocument.BB_Status + '"></HDSD00_05_005>';
  resultstr := resultstr + '<HDSD00_05_009 dataelementCode="HDSD00.05.009" dataelementName="操作编码" value="' + ARegisterDocument.CZ_Code + '"></HDSD00_05_009>';
  resultstr := resultstr + '<HDSD00_05_010 dataelementCode="HDSD00.05.010" dataelementName="操作部位编码" value="' + ARegisterDocument.CZBW_Code + '"></HDSD00_05_010>';
  resultstr := resultstr + '<HDSD00_05_011 dataelementCode="HDSD00.05.011" dataelementName="操作次数" value="' + ARegisterDocument.CZCS + '"></HDSD00_05_011>';
  resultstr := resultstr + '<HDSD00_05_012 dataelementCode="HDSD00.05.012" dataelementName="操作方法描述" value="' + ARegisterDocument.CZFF_Des + '"></HDSD00_05_012>';
  resultstr := resultstr + '<HDSD00_05_013 dataelementCode="HDSD00.05.013" dataelementName="操作名称" value="' + ARegisterDocument.CZ_Name + '"></HDSD00_05_013>';
  resultstr := resultstr + '<HDSD00_05_014 dataelementCode="HDSD00.05.014" dataelementName="操作日期时间" value="' + ARegisterDocument.CZ_Date + '"></HDSD00_05_014>';
  resultstr := resultstr + '<HDSD00_05_027 dataelementCode="HDSD00.05.027" dataelementName="检查标本号" value="' + ARegisterDocument.JCBB_Number + '"></HDSD00_05_027>';
  resultstr := resultstr + '<HDSD00_05_028 dataelementCode="HDSD00.05.028" dataelementName="检查定量结果" value="' + ARegisterDocument.JCDLJG + '"></HDSD00_05_028>';
  resultstr := resultstr + '<HDSD00_05_029 dataelementCode="HDSD00.05.029" dataelementName="检查定量结果计量单位" value="' + ARegisterDocument.JCDLJG_Unit + '"></HDSD00_05_029>';
  resultstr := resultstr + '<HDSD00_05_057 dataelementCode="HDSD00.05.057" dataelementName="接收标本日期时间" value="' + ARegisterDocument.JSBB_Date + '"></HDSD00_05_057>';
  resultstr := resultstr + '<HDSD00_05_058 dataelementCode="HDSD00.05.058" dataelementName="介入物名称" value="' + ARegisterDocument.JRW_Name + '"></HDSD00_05_058>';
  resultstr := resultstr + '<HDSD00_05_060 dataelementCode="HDSD00.05.060" dataelementName="麻醉方法代码" value="' + ARegisterDocument.MZFF_Code + '"></HDSD00_05_060>';
  resultstr := resultstr + '<HDSD00_05_061 dataelementCode="HDSD00.05.061" dataelementName="麻醉观察结果" value="' + ARegisterDocument.MZGCJG + '"></HDSD00_05_061>';
  resultstr := resultstr + '<HDSD00_05_062 dataelementCode="HDSD00.05.062" dataelementName="麻醉医师签名" value="' + ARegisterDocument.MZYSQM + '"></HDSD00_05_062>';
  resultstr := resultstr + '<HDSD00_05_063 dataelementCode="HDSD00.05.063" dataelementName="麻醉中西医标识代码" value="' + ARegisterDocument.MZZXYBS_Code + '"></HDSD00_05_063>';
  resultstr := resultstr + '<HDSD00_05_068 dataelementCode="HDSD00.05.068" dataelementName="特殊检查标志" value="' + ARegisterDocument.TSJCBZ + '"></HDSD00_05_068>';
  resultstr := resultstr + '<HDSD00_05_073 dataelementCode="HDSD00.05.073" dataelementName="诊疗过程描述" value="' + ARegisterDocument.ZLGC_des + '"></HDSD00_05_073>';
  resultstr := resultstr + '<HDSD00_05_074 dataelementCode="HDSD00.05.074" dataelementName="症状开始日期时间" value="' + ARegisterDocument.ZZ_StartDate + '"></HDSD00_05_074>';
  resultstr := resultstr + '<HDSD00_05_075 dataelementCode="HDSD00.05.075" dataelementName="症状描述" value="' + ARegisterDocument.ZZ_Des + '"></HDSD00_05_075>';
  resultstr := resultstr + '<HDSD00_05_076 dataelementCode="HDSD00.05.076" dataelementName="症状停止日期时间" value="' + ARegisterDocument.ZZ_StopDate + '"></HDSD00_05_076>';
  resultstr := resultstr + '<HDSD00_05_077 dataelementCode="HDSD00.05.077" dataelementName="主诉" value="' + ARegisterDocument.ZS + '"></HDSD00_05_077>';
  resultstr := resultstr + '<DiagnoseRowInfo>';
  len := Length(ARegisterDocument.DiagnoseRowInfo) - 1;
  for i := 0 to len do
  begin
    resultstr := resultstr + '<Row>';
    resultstr := resultstr + '<DiagnoseCode dataelementCode="患者诊断信息" dataelementName="疾病诊断编码" value="' + ARegisterDocument.DiagnoseRowInfo[i].DiagnoseCode + '"></DiagnoseCode>';
    resultstr := resultstr + '<DiagnoseDesc dataelementCode="患者诊断信息" dataelementName="疾病诊断描述" value="' + ARegisterDocument.DiagnoseRowInfo[i].DiagnoseDesc + '"></DiagnoseDesc>';
    resultstr := resultstr + '<DiagnoseTypeCode dataelementCode="患者诊断信息" dataelementName="疾病诊断类型代码" value="' + ARegisterDocument.DiagnoseRowInfo[i].DiagnoseTypeCode + '"></DiagnoseTypeCode>';
    resultstr := resultstr + '<DiagnoseTypeDesc dataelementCode="患者诊断信息" dataelementName="疾病诊断类型描述" value="' + ARegisterDocument.DiagnoseRowInfo[i].DiagnoseTypeDesc + '"></DiagnoseTypeDesc>';
    resultstr := resultstr + '<HDSD00_05_072 dataelementCode="HDSD00.05.072" dataelementName="诊断日期" value="' + ARegisterDocument.DiagnoseRowInfo[i].DiagnoseDate + '"></HDSD00_05_072>';
    resultstr := resultstr + '</Row>';
  end;
  resultstr := resultstr + '</DiagnoseRowInfo>';
  resultstr := resultstr + '</BasicDataset>';
  try
    msgCode := ARegisterDocument.RegisterNo + ',' + ARegisterDocument.AdmNo + ',' + ARegisterDocument.DocumentCode + ',' + ARegisterDocument.DocumentID; //'RegisterDocument';
    resultstr := RegisterDocument(PWideChar(msgCode), PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    Result := False;
  end;

end;

class function THisManager.MValidateTicket(const Asourcing: string; const Atickets: string; const Acode: string): TValidateTicketRes;
var
  resultstr: WideString;
  msgCode: WideString;
  xml: IXMLDocument;
  ansistr: string;
  res: TValidateTicketRes;
begin
  res := TValidateTicketRes.Create;
  res.CanLogin := False;
  try
    resultstr := '<Request>';
    resultstr := resultstr + '<SourceSystem>' + Asourcing + '</SourceSystem>';
    resultstr := resultstr + '<Ptickets>' + Atickets + '</Ptickets>';
    resultstr := resultstr + '<Pcode>' + Acode + '</Pcode>';
    resultstr := resultstr + '</Request>';
    msgCode := 'ValidateTicket';
    resultstr := DHCWebInterface(PWideChar(msgCode), PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      res.CanLogin := True;
      res.ResText := xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultContent'].text;
      Result := res;
    end
    else
    begin

      Result := res;
    end;
  except
    Result := res;
  end;
end;

class function THisManager.MGetValidateInfo: TValidateInfo;
var
  validateInfo: TValidateInfo;
  pcount: Integer;
  pinput: string;
  pinputlist, plist1, plist2: TStringList;
begin
  validateInfo := TValidateInfo.Create;
  pcount := ParamCount;
  pinputlist := TStringList.Create;
  plist1 := TStringList.Create;
  plist2 := TStringList.Create;
  if ParamCount > 0 then
  begin
    pinput := ParamStr(1);
    //pinput := LowerCase(pinput);
    ExtractStrings(['&'], [' '], PChar(pinput), pinputlist);
    if pinputlist.Count > 1 then
    begin
      ExtractStrings(['='], [' '], PChar(pinputlist[0]), plist1);
      ExtractStrings(['='], [' '], PChar(pinputlist[1]), plist2);
      if plist1.Count > 1 then
      begin
        if Pos('pcode', plist1[0]) > 0 then
        begin
          validateInfo.Pcode := plist1[1];
        end;
        if Pos('ptickets', plist1[0]) > 0 then
        begin
          validateInfo.Ptickets := plist1[1];
        end;
      end;
      if plist2.Count > 1 then
      begin
        if Pos('pcode', plist2[0]) > 0 then
        begin
          validateInfo.Pcode := plist2[1];
        end;
        if Pos('ptickets', plist2[0]) > 0 then
        begin
          validateInfo.Ptickets := plist2[1];
        end;
      end;
    end;

  end;
  FreeAndNil(pinputlist);
  FreeAndNil(plist1);
  FreeAndNil(plist2);
  Result := validateInfo;
end;

function AnsiToWide(const S: AnsiString): WideString;
var
  len: integer;
  ws: WideString;
begin
  Result := '';
  if (Length(S) = 0) then
    exit;
  len := MultiByteToWideChar(CP_ACP, 0, PChar(S), -1, nil, 0);
  SetLength(ws, len);
  MultiByteToWideChar(CP_ACP, 0, PChar(S), -1, PWideChar(ws), len);
  Result := ws;
end;

class function THisManager.MGetAdmInfo(const admNo: string): TAdmRes;
var
  resultstr: WideString;
  msgCode: WideString;
  xml: IXMLDocument;
  ansistr: string;
  res: TAdmRes;
  resitems: TArrayTDiagnoseRowInfo;
  admInfo: IXMLNode;
  itemnode: IXMLNode;
  i, len: Integer;
begin
  res := TAdmRes.Create;
  try
    msgCode := 'S1001';
    resultstr := DHCWebInterface(PWideChar(msgCode), PWideChar(AnsiToWide(admNo)));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['Body'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      admInfo := xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['Body'].ChildNodes.Nodes['AdmInfo'];
      res.AdmNo := admInfo.ChildNodes.Nodes['AdmNo'].Text;
      res.AdmSerialNum := admInfo.ChildNodes.Nodes['AdmSerialNum'].Text;
      res.DocumentID := admInfo.ChildNodes.Nodes['DocumentID'].Text;
      res.PatRowID := admInfo.ChildNodes.Nodes['PatRowID'].Text;
      res.RegisterNo := admInfo.ChildNodes.Nodes['RegisterNo'].Text;
      res.AdmName := admInfo.ChildNodes.Nodes['AdmName'].Text;
      res.SexCode := admInfo.ChildNodes.Nodes['SexCode'].Text;
      res.Age := admInfo.ChildNodes.Nodes['Age'].Text;
      res.Birthday := admInfo.ChildNodes.Nodes['Birthday'].Text;
      res.AdmHospID := admInfo.ChildNodes.Nodes['AdmHospID'].Text;
      res.AdmHospCode := admInfo.ChildNodes.Nodes['AdmHospCode'].Text;
      res.AdmHospDesc := admInfo.ChildNodes.Nodes['AdmHospDesc'].Text;
      res.AdmStatusCode := admInfo.ChildNodes.Nodes['AdmStatusCode'].Text;
      res.AdmStatusDesc := admInfo.ChildNodes.Nodes['AdmStatusDesc'].Text;
      res.AdmTypeCode := admInfo.ChildNodes.Nodes['AdmTypeCode'].Text;
      res.AdmTypeDesc := admInfo.ChildNodes.Nodes['AdmTypeDesc'].Text;
      res.FeeTypeRowID := admInfo.ChildNodes.Nodes['FeeTypeRowID'].Text;
      res.FeeTypeCode := admInfo.ChildNodes.Nodes['FeeTypeCode'].Text;
      res.FeeTypeDesc := admInfo.ChildNodes.Nodes['FeeTypeDesc'].Text;
      res.AdmDate := admInfo.ChildNodes.Nodes['AdmDate'].Text;
      res.AdmTime := admInfo.ChildNodes.Nodes['AdmTime'].Text;
      res.InBedDate := admInfo.ChildNodes.Nodes['InBedDate'].Text;
      res.InBedTime := admInfo.ChildNodes.Nodes['InBedTime'].Text;
      res.AdmDoctorRowID := admInfo.ChildNodes.Nodes['AdmDoctorRowID'].Text;
      res.AdmDoctorCode := admInfo.ChildNodes.Nodes['AdmDoctorCode'].Text;
      res.AdmDoctorDesc := admInfo.ChildNodes.Nodes['AdmDoctorDesc'].Text;
      res.Height := admInfo.ChildNodes.Nodes['Height'].Text;
      res.Weigth := admInfo.ChildNodes.Nodes['Weigth'].Text;
      res.VisitNum := admInfo.ChildNodes.Nodes['VisitNum'].Text;
      res.ResidentDays := admInfo.ChildNodes.Nodes['ResidentDays'].Text;
      res.DisDateMR := admInfo.ChildNodes.Nodes['DisDateMR'].Text;
      res.DisTimeMR := admInfo.ChildNodes.Nodes['DisTimeMR'].Text;
      res.DisDateNurse := admInfo.ChildNodes.Nodes['DisDateNurse'].Text;
      res.DisTimeNurse := admInfo.ChildNodes.Nodes['DisTimeNurse'].Text;
      res.DisDateDoctor := admInfo.ChildNodes.Nodes['DisDateDoctor'].Text;
      res.DisTimeDoctor := admInfo.ChildNodes.Nodes['DisTimeDoctor'].Text;
      res.AdmDeptRowID := admInfo.ChildNodes.Nodes['AdmDeptRowID'].Text;
      res.AdmDeptCode := admInfo.ChildNodes.Nodes['AdmDeptCode'].Text;
      res.AdmDeptDesc := admInfo.ChildNodes.Nodes['AdmDeptDesc'].Text;
      res.AdmWardRowID := admInfo.ChildNodes.Nodes['AdmWardRowID'].Text;
      res.AdmWardCode := admInfo.ChildNodes.Nodes['AdmWardCode'].Text;
      res.AdmWardDesc := admInfo.ChildNodes.Nodes['AdmWardDesc'].Text;
      res.AdmRoomRowID := admInfo.ChildNodes.Nodes['AdmRoomRowID'].Text;
      res.AdmRoomCode := admInfo.ChildNodes.Nodes['AdmRoomCode'].Text;
      res.AdmRoomDesc := admInfo.ChildNodes.Nodes['AdmRoomDesc'].Text;
      res.AdmBedRowID := admInfo.ChildNodes.Nodes['AdmBedRowID'].Text;
      res.AdmBedNo := admInfo.ChildNodes.Nodes['AdmBedNo'].Text;
      res.CurrentDetpRowID := admInfo.ChildNodes.Nodes['CurrentDetpRowID'].Text;
      res.CurrentDetpCode := admInfo.ChildNodes.Nodes['CurrentDetpCode'].Text;
      res.CurrentDetpDesc := admInfo.ChildNodes.Nodes['CurrentDetpDesc'].Text;
      res.CurrentWardRowID := admInfo.ChildNodes.Nodes['CurrentWardRowID'].Text;
      res.CurrentWardCode := admInfo.ChildNodes.Nodes['CurrentWardCode'].Text;
      res.CurrentWardDesc := admInfo.ChildNodes.Nodes['CurrentWardDesc'].Text;
      res.CurrentRoomRowID := admInfo.ChildNodes.Nodes['CurrentRoomRowID'].Text;
      res.CurrentRoomCode := admInfo.ChildNodes.Nodes['CurrentRoomCode'].Text;
      res.CurrentRoomDesc := admInfo.ChildNodes.Nodes['CurrentRoomDesc'].Text;
      res.CurrentBedRowID := admInfo.ChildNodes.Nodes['CurrentBedRowID'].Text;
      res.CurrentBedNo := admInfo.ChildNodes.Nodes['CurrentBedNo'].Text;
      res.ClinicDisease := admInfo.ChildNodes.Nodes['ClinicDisease'].Text;
      res.OperationInfo := admInfo.ChildNodes.Nodes['OperationInfo'].Text;
      res.OtherInfo := admInfo.ChildNodes.Nodes['OtherInfo'].Text;
      res.DischCondit := admInfo.ChildNodes.Nodes['DischCondit'].Text;
      res.PhyAddress := admInfo.ChildNodes.Nodes['PhyAddress'].Text;
      res.TimeRangeCode := admInfo.ChildNodes.Nodes['TimeRangeCode'].Text;
      res.RegfeeNo := admInfo.ChildNodes.Nodes['RegfeeNo'].Text;
      len := admInfo.ChildNodes.Nodes['Diagnoses'].ChildNodes.Count;
      if len > 0 then
      begin
        SetLength(resitems, len);
        for i := 0 to len - 1 do
        begin
          resitems[i] := TDiagnoseRowInfo.Create;
          itemnode := admInfo.ChildNodes.Nodes['Diagnoses'].ChildNodes[i];
          resitems[i].DiagnoseTypeCode := itemnode.ChildNodes.Nodes['DiagnoseTypeCode'].Text;
          resitems[i].DiagnoseTypeDesc := itemnode.ChildNodes.Nodes['DiagnoseTypeDesc'].Text;
          resitems[i].DiagnoseCode := itemnode.ChildNodes.Nodes['DiagnoseCode'].Text;
          resitems[i].DiagnoseDesc := itemnode.ChildNodes.Nodes['DiagnoseDesc'].Text;
          resitems[i].DiagUserCode := itemnode.ChildNodes.Nodes['DiagUserCode'].Text;
          resitems[i].DiagUserDesc := itemnode.ChildNodes.Nodes['DiagUserDesc'].Text;
          resitems[i].DiagnoseDate := itemnode.ChildNodes.Nodes['DiagnoseDate'].Text;
          resitems[i].DiagnoseTime := itemnode.ChildNodes.Nodes['DiagnoseTime'].Text;
        end;
        res.Diagnoses := resitems;
      end;
    end;
    Result := res;
  except
    Result := res;
  end;
end;

class function THisManager.MRisTimeAxis(const risTimeAxis: TRisTimeAxisReq): Boolean;
var
  resultstr: WideString;
  xml: IXMLDocument;
  ansistr: string;
  msgCode: WideString;
begin
  try
    msgCode := 'RisTimeAxis';
    resultstr := '<Request>';
    resultstr := resultstr + '<OrdRowID>' + risTimeAxis.OrdRowID + '</OrdRowID>';
    resultstr := resultstr + '<StudyNo>' + risTimeAxis.StudyNo + '</StudyNo>';
    resultstr := resultstr + '<DocCode>' + risTimeAxis.DocCode + '</DocCode>';
    resultstr := resultstr + '<Doc>' + risTimeAxis.Doc + '</Doc>';
    resultstr := resultstr + '<StartDate>' + risTimeAxis.StartDate + '</StartDate>';
    resultstr := resultstr + '<StartTime>' + risTimeAxis.StartTime + '</StartTime>';
    resultstr := resultstr + '<EndDate>' + risTimeAxis.EndDate + '</EndDate>';
    resultstr := resultstr + '<EndTime>' + risTimeAxis.EndTime + '</EndTime>';
    resultstr := resultstr + '</Request>';
    resultstr := DHCWebInterface(PWideChar(msgCode), PWideChar(resultstr));
    resultstr := LeftStr(resultstr, Length(resultstr) - 3);
    resultstr := RightStr(resultstr, Length(resultstr) - 9);
    ansistr := UTF8Encode(resultstr);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end
  except
    Result := False;
  end;
end;

end.

