unit HisManager;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,SOAPHTTPClient,Rio,StdCtrls,Dialogs,
  InvokeRegistry,xmldom,XMLDoc,msxmldom,XMLIntf,HisEntity, StrUtils,ADODB,DB,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Buttons;//,xmldom,XMLDoc,msxml,XMLIntf
type
   THisManager=class
  private
    public
    class   function  MGetPatOrdList(ACardValue :string;ACardTypes:string;AStartDate:string;
      AEndDate:string;AExeLoc:string;AEpsiodeType:string):TStringList;//获取医嘱列表	14
    class   function  MBookedInfo(Abookedinfo:TBookedInfo):Boolean;//预约	16
    class   function  MCancelBookedInfo(AcancelBookedInfo:TCancelBookedInfo):Boolean;//取消预约	17
    class   function  MRegInfo(Areginfo:TRegInfo):Boolean;//检查登记	18
    class   function  MCancelFeeApp(AcancelFeeApp:TCancelFeeApp):Boolean;//退费申请	20
    class   function  MCheckComplete(Acheckcomplete:TCheckComplete):Boolean;//检查完成信息	21
    class   function  MReturnReports(AReturnReport:TReturnReport):Boolean;//返回报告	22
    class   function  MCancelReport(AcancelReport:TCancelReport):Boolean;//取消报告审核	23
    class   function  MGetAppForm(AOrdRowID:string):string;//取得申请单内容,html文档	传入医嘱号
    class   function  MGetDictInfo(AdicCat:string):TStringList;//科室人员字典	 0科室 1病区  2人员
                                                          //  3 医嘱大类 4 医嘱子类 (4@医嘱大类) 5 医嘱字典信息(按大类获取)
                                                          //(5@医嘱大类) 6医嘱字典信息（按子类获取）6@医嘱子类)
    class   function  MGetPatInfo(AcardNo: string;AcardType:string): TStringList;//获取病人基本信息	28
    class   function  MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;//保存危急值
    class   function   SaveAntCVResultToDb(con:TADOConnection;data:TSaveAntCVResult):Boolean; //保存危急值到数据库
    class   function   MMakeSaveAntCVResultStr(ASaveAntCVResult: TSaveAntCVResult): WideString;


 end;

implementation 
    function  BookedInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';
    function  CancelBookedInfo(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  CancelFeeApp(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  CancelReport(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  CheckComplete(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  GetAppForm(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  GetDictInfo(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  GetPatInfoToRIS(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  GetPatOrdList(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  RegInfo(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';
    function  ReturnReports(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';
    function  SendPatOrdListToRis(const Input: PWideChar): PWideChar; stdcall; external 'HISDHC.dll';
    function  TestReturnReports(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';
    function  SaveAntCVResult(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';

{ THisManager }

class function THisManager.MBookedInfo(Abookedinfo: TBookedInfo): Boolean;
var
  resultstr :WideString;
  xml :IXMLDocument;
   ansistr:string;
begin
    try
        resultstr := '<Request><BookedInfos><BookedInfo>';
        resultstr :=resultstr+'<OrdRowID>'+Abookedinfo.OrdRowID+'</OrdRowID>';
        resultstr :=resultstr+'<ResourceCode>'+Abookedinfo.ResourceCode+'</ResourceCode>';
        resultstr :=resultstr+'<Resource>'+Abookedinfo.Resource+'</Resource>';
        resultstr :=resultstr+'<BookedDate>'+Abookedinfo.BookedDate+'</BookedDate>';
        resultstr :=resultstr+'<BookedTime>'+Abookedinfo.BookedTime+'</BookedTime>';
        resultstr :=resultstr+'<BookedAddress>'+Abookedinfo.BookedAddress+'</BookedAddress>';
        resultstr :=resultstr+'<OperatorCode>'+Abookedinfo.OperatorCode+'</OperatorCode>';
        resultstr :=resultstr+'<Operator>'+Abookedinfo.Operator+'</Operator>';
        resultstr :=resultstr+'<NoteInfo>'+Abookedinfo.NoteInfo+'</NoteInfo>';
        resultstr :=resultstr+'<OtherInfo>'+Abookedinfo.OtherInfo+'</OtherInfo>';
        resultstr :=resultstr+'</BookedInfo></BookedInfos></Request>';
        // ShowMessage(resultstr);
        resultstr:=  BookedInfo(PWideChar(resultstr));
        // ShowMessage(resultstr);
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        //ShowMessage(resultstr);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end;
    except
        Result:=False;
    end;
end;

class function THisManager.MCancelBookedInfo(
  AcancelBookedInfo: TCancelBookedInfo): Boolean;
begin
  Result := False;
end;

class function THisManager.MCancelFeeApp(AcancelFeeApp: TCancelFeeApp): Boolean;
  var
  resultstr :WideString;
  xml :IXMLDocument;
   ansistr:string;
begin
    try
        resultstr := '<Request><CancelFeeApps><CancelFeeApp>';
        resultstr :=resultstr+'<OrdRowID>'+AcancelFeeApp.OrdRowID+'</OrdRowID>';
        resultstr :=resultstr+'<OperatorCode>'+AcancelFeeApp.OperatorCode+'</OperatorCode>';
        resultstr :=resultstr+'<Operator>'+AcancelFeeApp.Operator+'</Operator>';
        resultstr :=resultstr+'<CancelFeeAppDate>'+AcancelFeeApp.CancelFeeAppDate+'</CancelFeeAppDate>';
        resultstr :=resultstr+'<CancelFeeAppTime>'+AcancelFeeApp.CancelFeeAppTime+'</CancelFeeAppTime>';
        resultstr :=resultstr+'<CancelFeeAppReason>'+AcancelFeeApp.CancelFeeAppReason+'</CancelFeeAppReason>';
        resultstr :=resultstr+'</CancelFeeApp></CancelFeeApps></Request>';
        //ShowMessage(resultstr);
        resultstr:=  CancelFeeApp(PWideChar(resultstr));
         //ShowMessage(resultstr);
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        //ShowMessage(resultstr);
        ansistr :=  UTF8Encode(resultstr);
        xml :=  LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end;
    except
        Result:=False;
    end;
end;

class function THisManager.MCancelReport(
  AcancelReport: TCancelReport): Boolean;
begin
    Result := False;
end;

class function THisManager.MCheckComplete(
  Acheckcomplete: TCheckComplete): Boolean;
  var
     resultstr :WideString;
  xml :IXMLDocument;
   ansistr:string;
begin
    try
        resultstr := '<Request><CheckCompletes><CheckComplete>';
        resultstr :=resultstr+'<OrdRowID>'+acheckcomplete.OrdRowID+'</OrdRowID>'; //	医嘱Rowid
        resultstr :=resultstr+'<StudyNo>'+acheckcomplete.StudyNo+'</StudyNo>';	 //	检查号
        resultstr :=resultstr+'<PicturePath>'+acheckcomplete.PicturePath+'</PicturePath>';//	图像路径
        resultstr :=resultstr+'<OperatorCode>'+acheckcomplete.OperatorCode+'</OperatorCode>'; //	操作员代码
        resultstr :=resultstr+'<Operator>'+acheckcomplete.Operator+'</Operator>'; //	操作员
        resultstr :=resultstr+'<CheckUpDate>'+acheckcomplete.CheckUpDate+'</CheckUpDate>';  //	检查日期
        resultstr :=resultstr+'<CheckUpTime>'+acheckcomplete.CheckUpTime+'</CheckUpTime>';  //	检查时间
        resultstr :=resultstr+'</CheckComplete></CheckCompletes></Request>';
        resultstr:=  CheckComplete(PWideChar(resultstr));
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end;
    except
        Result:=False;
    end;
end;

class function THisManager.MGetAppForm(AOrdRowID: string): string;
begin
     Result:= '';
end;

class function THisManager.MGetDictInfo(AdicCat: string): TStringList;
begin
   Result := nil;
end;

class function THisManager.MGetPatInfo(AcardNo:string; AcardType: string): TStringList;
var
  resultstr :WideString;
  xml :IXMLDocument;
  xmlnode:IXMLNode;
  nodelist:IXMLNodeList;
  data:TPatInfo;
  list:TStringList;
  i:Integer;
  ansistr:string;
begin
    try
        resultstr:=  '<Request><CardNo>'+AcardNo+'</CardNo><CardType>'+AcardType+'</CardType ></Request>';
        resultstr:=  GetPatInfoToRIS(PWideChar(resultstr));
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        list := TStringList.Create;
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
          nodelist :=  xml.ChildNodes.Nodes['Request'].ChildNodes.Nodes['PatInfos'].ChildNodes;
            for i:=0 to nodelist.Count-1 do
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
                list.AddObject(inttostr(i),data);
            end;
        end;
        xml := nil;
        nodelist := nil;
        xmlnode:= nil;
        Result := list;
    except
        Result:=nil;
    end;
end;

class function THisManager.MGetPatOrdList(ACardValue, ACardTypes, AStartDate,
  AEndDate, AExeLoc, AEpsiodeType: string): TStringList;
  var
    data:TPatOrd;
    list:TStringList;
    xmllist:IXMLNodeList;
    resultstr:WideString;
    xml:IXMLDocument;
    xmlnode:IXMLNode;
    i:Integer;
    ansistr:string;
begin
    try
        list :=  TStringList.Create;
        resultstr :=resultstr+ '<Request>';
        resultstr :=resultstr+'<CardValue>'+acardvalue+'</CardValue>';
        resultstr :=resultstr+'<CardTypes>'+acardtypes+'</CardTypes>';
        resultstr :=resultstr+'<StartDate>'+AStartDate+'</StartDate>';
        resultstr :=resultstr+'<EndDate>'+AEndDate+'</EndDate>';
        resultstr :=resultstr+'<ExeLoc>'+AExeLoc+'</ExeLoc>';
        resultstr :=resultstr+'<EpsiodeType>'+AEpsiodeType+'</EpsiodeType>';
        resultstr :=resultstr+'</Request>';
      // ShowMessage(resultstr);
       resultstr :=  GetPatOrdList(PWideChar(resultstr));
       resultstr:= LeftStr(resultstr,Length(resultstr)-3);
       resultstr:= RightStr(resultstr,Length(resultstr)-9);
       resultstr := StringReplace(resultstr,']]]]><![CDATA[>','',[rfReplaceAll]);
       resultstr := StringReplace(resultstr,'<![CDATA[','',[rfReplaceAll]);
       resultstr := StringReplace(resultstr,']]>','',[rfReplaceAll]);
       resultstr := StringReplace(resultstr,'&','',[rfReplaceAll]);
       resultstr := StringReplace(resultstr,'^','',[rfReplaceAll]);
       //ShowMessage(resultstr);
       ansistr :=  UTF8Encode(resultstr);
       // ShowMessage(ansistr);
        xml :=  LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
            xmllist :=  xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['PatOrdLists'].ChildNodes;
            for i:=0 to xmllist.Count -1 do
            begin
                xmlnode := xmllist.Get(i);
                data := TPatOrd.Create;
                data.RegNo := xmlnode.ChildNodes.Nodes['RegNo'].Text;
                data.CardNo	:= xmlnode.ChildNodes.Nodes['RegNo'].Text;
                data.Name 	:= xmlnode.ChildNodes.Nodes['Name'].Text;
                data.SexCode	:= xmlnode.ChildNodes.Nodes['SexCode'].Text;
                data.Sex 	:= xmlnode.ChildNodes.Nodes['Sex'].Text;
                data.Age 	:= xmlnode.ChildNodes.Nodes['Age'].Text;
                data.BirthDay	:= xmlnode.ChildNodes.Nodes['BirthDay'].Text;
                data.Marry 	:= xmlnode.ChildNodes.Nodes['Marry'].Text;
                data.Address 	:= xmlnode.ChildNodes.Nodes['Address'].Text;
                data.Telephone 	:= xmlnode.ChildNodes.Nodes['Telephone'].Text;
                data.CredentialNo	:= xmlnode.ChildNodes.Nodes['CredentialNo'].Text;
                data.NationCode	:= xmlnode.ChildNodes.Nodes['NationCode'].Text;
                data.Nation	:= xmlnode.ChildNodes.Nodes['Nation'].Text;
                data.OccupationCode	:= xmlnode.ChildNodes.Nodes['OccupationCode'].Text;
                data.Occupation	:= xmlnode.ChildNodes.Nodes['Occupation'].Text;
                data.DocumentID	:= xmlnode.ChildNodes.Nodes['DocumentID'].Text;
                data.InsuranceNo	:= xmlnode.ChildNodes.Nodes['InsuranceNo'].Text;
                data.AdmType	:= xmlnode.ChildNodes.Nodes['AdmType'].Text;
                data.AdmNo	:= xmlnode.ChildNodes.Nodes['AdmNo'].Text;
                data.AdmSerialNum	:= xmlnode.ChildNodes.Nodes['AdmSerialNum'].Text;
                data.FeeType	:= xmlnode.ChildNodes.Nodes['FeeType'].Text;
                data.WardCode	:= xmlnode.ChildNodes.Nodes['WardCode'].Text;
                data.Ward	:= xmlnode.ChildNodes.Nodes['Ward'].Text;
                data.RoomCode:= xmlnode.ChildNodes.Nodes['RoomCode'].Text;
                data.Room:= xmlnode.ChildNodes.Nodes['Room'].Text;
                data.BedNo	:= xmlnode.ChildNodes.Nodes['BedNo'].Text;
                data.ClinicDiagnose 	:= xmlnode.ChildNodes.Nodes['ClinicDiagnose'].Text;
                data.ClinicDisease 	:= xmlnode.ChildNodes.Nodes['ClinicDisease'].Text;
                data.OperationInfo 	:= xmlnode.ChildNodes.Nodes['OperationInfo'].Text;
                data.OtherInfo 	:= xmlnode.ChildNodes.Nodes['OtherInfo'].Text;
                data.OrdRowID	:= xmlnode.ChildNodes.Nodes['OrdRowID'].Text;
                data.OrdName 	:= xmlnode.ChildNodes.Nodes['OrdName'].Text;
                data.OrdCode	:= xmlnode.ChildNodes.Nodes['OrdCode'].Text;
                data.OrdPrice	:= xmlnode.ChildNodes.Nodes['OrdPrice'].Text;
                data.OrdBillStatus	:= xmlnode.ChildNodes.Nodes['OrdBillStatus'].Text;
                data.OrdPriorityCode	:= xmlnode.ChildNodes.Nodes['OrdPriorityCode'].Text;
                data.OrdPriority	:= xmlnode.ChildNodes.Nodes['OrdPriority'].Text;
                data.Hospital 	:= xmlnode.ChildNodes.Nodes['Hospital'].Text;
                data.OrdLocCode	:= xmlnode.ChildNodes.Nodes['OrdLocCode'].Text;
                data.OrdLoc 	:= xmlnode.ChildNodes.Nodes['OrdLoc'].Text;
                data.OrdDoctorCode	:= xmlnode.ChildNodes.Nodes['OrdDoctorCode'].Text;
                data.OrdDoctor 	:= xmlnode.ChildNodes.Nodes['OrdDoctor'].Text;
                data.OrdDate 	:= xmlnode.ChildNodes.Nodes['OrdDate'].Text;
                data.OrdTime 	:= xmlnode.ChildNodes.Nodes['OrdTime'].Text;
                data.OrdExeLocCode	:= xmlnode.ChildNodes.Nodes['OrdExeLocCode'].Text;
                data.OrdExeLoc 	:= xmlnode.ChildNodes.Nodes['OrdExeLoc'].Text;
                data.Position:= xmlnode.ChildNodes.Nodes['Position'].Text;
                data.Purpose	:= xmlnode.ChildNodes.Nodes['Purpose'].Text;
                list.AddObject(inttostr(i),data);
            end;
        end;  
        xml := nil;
        xmllist := nil;
        xmlnode:= nil;
        Result := list;
    except
          Result:=nil;
    end;
end;



class function THisManager.MRegInfo(Areginfo: TRegInfo): Boolean;
var
  resultstr :WideString;
  xml :IXMLDocument;
  ansistr:string;
begin
    try
        resultstr := '<Request><RegInfos><RegInfo>';
        resultstr :=resultstr+'<OrdRowID>'+Areginfo.OrdRowID+'</OrdRowID>'; //	医嘱Rowid
        resultstr :=resultstr+'<StudyNo>'+Areginfo.StudyNo+'</StudyNo>';	 //	检查号
        resultstr :=resultstr+'<EQInfo>'+Areginfo.EQInfo+'</EQInfo>';//	图像路径
        resultstr :=resultstr+'<OperatorCode>'+Areginfo.OperatorCode+'</OperatorCode>'; //	操作员代码
        resultstr :=resultstr+'<Operator>'+Areginfo.Operator+'</Operator>'; //	操作员
        resultstr :=resultstr+'<MainDocCode>'+Areginfo.MainDocCode+'</MainDocCode>';
        resultstr :=resultstr+'<MainDoc>'+Areginfo.MainDoc+'</MainDoc>';
        resultstr :=resultstr+'<RegDate>'+Areginfo.RegDate+'</RegDate>';
        resultstr :=resultstr+'<RegTime>'+Areginfo.RegTime+'</RegTime>';
        resultstr :=resultstr+'</RegInfo></RegInfos></Request>';
        //ShowMessage(resultstr);
        resultstr:=  RegInfo(PWideChar(resultstr));
         //ShowMessage(resultstr);
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        //ShowMessage(resultstr);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end
    except
        Result:=False;
    end;
end;

class function THisManager.MReturnReports(AReturnReport: TReturnReport): Boolean;
var
  resultstr :WideString;
  xml :IXMLDocument;
  ansistr:string;
begin
    try
        resultstr := '<Request><ReturnReports><ReturnReport>';
        resultstr :=resultstr+'<OrdRowID>'+AReturnReport.OrdRowID+'</OrdRowID>'; //	医嘱Rowid
        resultstr :=resultstr+'<StudyNo>'+AReturnReport.StudyNo+'</StudyNo>';	 //	检查号
        resultstr :=resultstr+'<GetDocCode>'+AReturnReport.GetDocCode+'</GetDocCode>';
        resultstr :=resultstr+'<GetDoc>'+AReturnReport.GetDoc+'</GetDoc>';
        resultstr :=resultstr+'<ReportStatusCode>'+AReturnReport.ReportStatusCode+'</ReportStatusCode>';
        resultstr :=resultstr+'<ReportStatus>'+AReturnReport.ReportStatus+'</ReportStatus>';
        resultstr :=resultstr+'<UnsendCause>'+AReturnReport.UnsendCause+'</UnsendCause>';
        resultstr :=resultstr+'<ReportDocCode>'+AReturnReport.ReportDocCode+'</ReportDocCode>';
        resultstr :=resultstr+'<AuditDoc>'+AReturnReport.AuditDoc+'</AuditDoc>';
        resultstr :=resultstr+'<ReportDate>'+AReturnReport.ReportDate+'</ReportDate>';
        resultstr :=resultstr+'<ReportTime>'+AReturnReport.ReportTime+'</ReportTime>';
        resultstr :=resultstr+'<AuditTime>'+AReturnReport.AuditTime+'</AuditTime>';
        resultstr :=resultstr+'<Memo>'+AReturnReport.Memo+'</Memo>';
        resultstr :=resultstr+'<ImageFile>'+AReturnReport.ImageFile+'</ImageFile>';
        resultstr :=resultstr+'<EyeSee>'+AReturnReport.EyeSee+'</EyeSee>';
        resultstr :=resultstr+'<ExamSee>'+AReturnReport.ExamSee+'</ExamSee>';
        resultstr :=resultstr+'<Diagnose>'+AReturnReport.Diagnose+'</Diagnose>';
        resultstr :=resultstr+'</ReturnReport></ReturnReports></Request>';
        //ShowMessage(resultstr);
        resultstr:=  ReturnReports(PWideChar(resultstr));
        //ShowMessage(resultstr);
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        //ShowMessage(resultstr);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end
    except
        Result:=False;
    end;
end;

class function THisManager.MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;
  var
   resultstr :WideString;
   xml :IXMLDocument;
   ansistr:string;
begin
    try
        resultstr := '<Request><SaveAntCVResults><SaveAntCVResult>';
        resultstr :=resultstr+'<AntCVResultID>'+ASaveAntCVResult.AntCVResultID+'</AntCVResultID>';
        resultstr :=resultstr+'<ReportType>'+ASaveAntCVResult.ReportType+'</ReportType>';
        resultstr :=resultstr+'<StudyNo>'+ASaveAntCVResult.StudyNo+'</StudyNo>';
        resultstr :=resultstr+'<OrdRowID>'+ASaveAntCVResult.OrdRowID+'</OrdRowID>';
        resultstr :=resultstr+'<AuditDate>'+ASaveAntCVResult.AuditDate+'</AuditDate>';
        resultstr :=resultstr+'<AuditTime>'+ASaveAntCVResult.AuditTime+'</AuditTime>';
        resultstr :=resultstr+'<AuditDocCode>'+ASaveAntCVResult.AuditDocCode+'</AuditDocCode>';
        resultstr :=resultstr+'<AuditDocname>'+ASaveAntCVResult.AuditDocname+'</AuditDocname>';
        resultstr :=resultstr+'<AuditComment>'+ASaveAntCVResult.AuditComment+'</AuditComment>';
        resultstr :=resultstr+'<OrdName>'+ASaveAntCVResult.OrdName+'</OrdName>';
        resultstr :=resultstr+'<Result>'+ASaveAntCVResult.Result+'</Result>';
        resultstr :=resultstr+'<Ranges>'+ASaveAntCVResult.Ranges+'</Ranges>';
        resultstr :=resultstr+'<OrdDoc>'+ASaveAntCVResult.OrdDoc+'</OrdDoc>';
        resultstr :=resultstr+'<OrdDate>'+ASaveAntCVResult.OrdDate+'</OrdDate>';
        resultstr :=resultstr+'<OrdTime>'+ASaveAntCVResult.OrdTime+'</OrdTime>';
        resultstr :=resultstr+'<ColDoc>'+ASaveAntCVResult.ColDoc+'</ColDoc>';
        resultstr :=resultstr+'<ColDate>'+ASaveAntCVResult.ColDate+'</ColDate>';
        resultstr :=resultstr+'<ColTime>'+ASaveAntCVResult.ColTime+'</ColTime>';
        resultstr :=resultstr+'<RecDoc>'+ASaveAntCVResult.RecDoc+'</RecDoc>';
        resultstr :=resultstr+'<RecDate>'+ASaveAntCVResult.RecDate+'</RecDate>';
        resultstr :=resultstr+'<RecTime>'+ASaveAntCVResult.RecTime+'</RecTime>';
        resultstr :=resultstr+'<WarDate>'+ASaveAntCVResult.WarDate+'</WarDate>';
        resultstr :=resultstr+'<WarTime>'+ASaveAntCVResult.WarTime+'</WarTime>';
        resultstr :=resultstr+'<CheckDoc>'+ASaveAntCVResult.CheckDoc+'</CheckDoc>';
        resultstr :=resultstr+'<CheckDate>'+ASaveAntCVResult.CheckDate+'</CheckDate>';
        resultstr :=resultstr+'<CheckTime>'+ASaveAntCVResult.CheckTime+'</CheckTime>';
        resultstr :=resultstr+'<ReportDoc>'+ASaveAntCVResult.ReportDoc+'</ReportDoc>';
        resultstr :=resultstr+'<ReportDate>'+ASaveAntCVResult.ReportDate+'</ReportDate>';
        resultstr :=resultstr+'<ReportTime>'+ASaveAntCVResult.ReportTime+'</ReportTime>';
        resultstr :=resultstr+'<SpecType>'+ASaveAntCVResult.SpecType+'</SpecType>';
        resultstr :=resultstr+'<Comment>'+ASaveAntCVResult.Comment+'</Comment>';
        resultstr :=resultstr+'<Note>'+ASaveAntCVResult.Note+'</Note>';
        resultstr :=resultstr+'</SaveAntCVResult></SaveAntCVResults></Request>';
        resultstr:=  SaveAntCVResult(PWideChar(resultstr));
        resultstr:= LeftStr(resultstr,Length(resultstr)-3);
        resultstr:= RightStr(resultstr,Length(resultstr)-9);
        ansistr :=  UTF8Encode(resultstr);
        xml :=    LoadXMLData(ansistr);
        if(xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['ResultCode'].text='0') then
        begin
           Result := True;
        end
        else
        begin
          Result := False;
        end;
    except
        Result:=False;
    end;
end;

class function THisManager.MMakeSaveAntCVResultStr(ASaveAntCVResult: TSaveAntCVResult): WideString;
  var
   resultstr :WideString;
   xml :IXMLDocument;
   ansistr:string;
begin
        resultstr := '<Request><SaveAntCVResults><SaveAntCVResult>';
        resultstr :=resultstr+'<AntCVResultID>'+ASaveAntCVResult.AntCVResultID+'</AntCVResultID>';
        resultstr :=resultstr+'<ReportType>'+ASaveAntCVResult.ReportType+'</ReportType>';
        resultstr :=resultstr+'<StudyNo>'+ASaveAntCVResult.StudyNo+'</StudyNo>';
        resultstr :=resultstr+'<OrdRowID>'+ASaveAntCVResult.OrdRowID+'</OrdRowID>';
        resultstr :=resultstr+'<AuditDate>'+ASaveAntCVResult.AuditDate+'</AuditDate>';
        resultstr :=resultstr+'<AuditTime>'+ASaveAntCVResult.AuditTime+'</AuditTime>';
        resultstr :=resultstr+'<AuditDocCode>'+ASaveAntCVResult.AuditDocCode+'</AuditDocCode>';
        resultstr :=resultstr+'<AuditDocName>'+ASaveAntCVResult.AuditDocname+'</AuditDocName>';
        resultstr :=resultstr+'<AuditComment>'+ASaveAntCVResult.AuditComment+'</AuditComment>';
        resultstr :=resultstr+'<OrdName>'+ASaveAntCVResult.OrdName+'</OrdName>';
        resultstr :=resultstr+'<Result>'+ASaveAntCVResult.Result+'</Result>';
        resultstr :=resultstr+'<Ranges>'+ASaveAntCVResult.Ranges+'</Ranges>';
        resultstr :=resultstr+'<OrdDoc>'+ASaveAntCVResult.OrdDoc+'</OrdDoc>';
        resultstr :=resultstr+'<OrdDate>'+ASaveAntCVResult.OrdDate+'</OrdDate>';
        resultstr :=resultstr+'<OrdTime>'+ASaveAntCVResult.OrdTime+'</OrdTime>';
        resultstr :=resultstr+'<ColDoc>'+ASaveAntCVResult.ColDoc+'</ColDoc>';
        resultstr :=resultstr+'<ColDate>'+ASaveAntCVResult.ColDate+'</ColDate>';
        resultstr :=resultstr+'<ColTime>'+ASaveAntCVResult.ColTime+'</ColTime>';
        resultstr :=resultstr+'<RecDoc>'+ASaveAntCVResult.RecDoc+'</RecDoc>';
        resultstr :=resultstr+'<RecDate>'+ASaveAntCVResult.RecDate+'</RecDate>';
        resultstr :=resultstr+'<RecTime>'+ASaveAntCVResult.RecTime+'</RecTime>';
        resultstr :=resultstr+'<WarDate>'+ASaveAntCVResult.WarDate+'</WarDate>';
        resultstr :=resultstr+'<WarTime>'+ASaveAntCVResult.WarTime+'</WarTime>';
        resultstr :=resultstr+'<CheckDoc>'+ASaveAntCVResult.CheckDoc+'</CheckDoc>';
        resultstr :=resultstr+'<CheckDate>'+ASaveAntCVResult.CheckDate+'</CheckDate>';
        resultstr :=resultstr+'<CheckTime>'+ASaveAntCVResult.CheckTime+'</CheckTime>';
        resultstr :=resultstr+'<ReportDoc>'+ASaveAntCVResult.ReportDoc+'</ReportDoc>';
        resultstr :=resultstr+'<ReportDate>'+ASaveAntCVResult.ReportDate+'</ReportDate>';
        resultstr :=resultstr+'<ReportTime>'+ASaveAntCVResult.ReportTime+'</ReportTime>';
        resultstr :=resultstr+'<SpecType>'+ASaveAntCVResult.SpecType+'</SpecType>';
        resultstr :=resultstr+'<Comment>'+ASaveAntCVResult.Comment+'</Comment>';
        resultstr :=resultstr+'<Note>'+ASaveAntCVResult.Note+'</Note>';
        resultstr :=resultstr+'</SaveAntCVResult></SaveAntCVResults></Request>';
       Result:=   resultstr;
end;



class function THisManager.SaveAntCVResultToDb(con:TADOConnection;data:TSaveAntCVResult):Boolean;
var
  query:TADOQuery;
  count:Integer;
begin
    query := TADOQuery.Create(nil);
    query.Connection := con;
    query.SQL.Text :='select 1 from TB_AckAntCVResult where StudyNo=:StudyNo';
    query.Parameters.ParamByName('StudyNo').value:=data.StudyNo;
    query.Prepared := True;
    query.Open;
    count  :=query.Recordset.RecordCount;
    query.Close;
    query.SQL.Clear;
    query.Parameters.Clear; 
    if    count>0     then
    begin
        query.SQL.Text :='update TB_AckAntCVResult set AntCVResultID=:AntCVResultID,ReportType=:ReportType,StudyNo=:StudyNo,OrdRowID=:OrdRowID,AuditDate=:AuditDate,AuditTime=:AuditTime,AuditDocCode=:AuditDocCode,AuditDocName=:AuditDocName,'+
        'AuditComment=:AuditComment,OrdName=:OrdName,Result=:Result,Ranges=:Ranges,OrdDoc=:OrdDoc,OrdDate=:OrdDate,OrdTime=:OrdTime,ColDoc=:ColDoc, '+
        'ColDate=:ColDate,ColTime=:ColTime,RecDoc=:RecDoc,RecDate=:RecDate,RecTime=:RecTime,WarDate=:WarDate,WarTime=:WarTime,CheckDoc=:CheckDoc,CheckDate=:CheckDate, '+
        'CheckTime=:CheckTime,ReportDoc=:ReportDoc,ReportDate=:ReportDate,ReportTime=:ReportTime,SpecType=:SpecType,Comment=:Comment,Note=:Note,Status=:Status,LastUpateTime=:LastUpateTime where StudyNo=:StudyNo; ';

    end
    else
    begin
        query.SQL.Text :='Insert into TB_AckAntCVResult '+
         '(AntCVResultID,ReportType,StudyNo,OrdRowID,AuditDate,AuditTime,AuditDocCode,AuditDocName,'+
         'AuditComment,OrdName,Result,Ranges,OrdDoc,OrdDate,OrdTime,ColDoc, '+
         'ColDate,ColTime,RecDoc,RecDate,RecTime,WarDate,WarTime,CheckDoc,CheckDate, '+
        'CheckTime,ReportDoc,ReportDate,ReportTime,SpecType,Comment,Note,Status,LastUpateTime) '+
         'VALUES '+
         '(:AntCVResultID,:ReportType,:StudyNo,:OrdRowID,:AuditDate,:AuditTime,:AuditDocCode,:AuditDocName,'+
         ':AuditComment,:OrdName,:Result,:Ranges,:OrdDoc,:OrdDate,:OrdTime,:ColDoc,'+
         ':ColDate,:ColTime,:RecDoc,:RecDate,:RecTime,:WarDate,:WarTime,:CheckDoc,:CheckDate,'+
         ':CheckTime,:ReportDoc,:ReportDate,:ReportTime,:SpecType,:Comment,:Note,:Status,:LastUpateTime); ';
    end;
    query.Parameters.ParamByName('AntCVResultID').value:=data.AntCVResultID ;
    query.Parameters.ParamByName('ReportType').value:=data.ReportType ;
    query.Parameters.ParamByName('StudyNo').value:=data.StudyNo;
    query.Parameters.ParamByName('OrdRowID').value:=data.OrdRowID;
    query.Parameters.ParamByName('AuditDate').value:=data.AuditDate;
    query.Parameters.ParamByName('AuditTime').value:=data.AuditTime;
    query.Parameters.ParamByName('AuditDocCode').value:=data.AuditDocCode;
    query.Parameters.ParamByName('AuditDocName').value:=data.AuditDocName;
    query.Parameters.ParamByName('AuditComment').value:=data.AuditComment;
    query.Parameters.ParamByName('OrdName').value:=data.OrdName;
    query.Parameters.ParamByName('Result').value:=data.Result ;
    query.Parameters.ParamByName('Ranges').value:=data.Ranges;
    query.Parameters.ParamByName('OrdDoc').value:=data.OrdDoc;
    query.Parameters.ParamByName('OrdDate').value:=data.OrdDate ;
    query.Parameters.ParamByName('OrdTime').value:=data.OrdTime ;
    query.Parameters.ParamByName('ColDoc').value:=data.ColDoc;
    query.Parameters.ParamByName('ColDate').value:=data.ColDate;
    query.Parameters.ParamByName('ColTime').value:=data.ColTime;
    query.Parameters.ParamByName('RecDoc').value:=data.RecDoc;
    query.Parameters.ParamByName('RecDate').value:=data.RecDate;
    query.Parameters.ParamByName('RecTime').value:=data.RecTime;
    query.Parameters.ParamByName('WarDate').value:=data.WarDate;
    query.Parameters.ParamByName('WarTime').value:=data.WarTime;
    query.Parameters.ParamByName('CheckDoc').value:=data.CheckDoc;
    query.Parameters.ParamByName('CheckDate').value:=data.CheckDate;
    query.Parameters.ParamByName('CheckTime').value:=data.CheckTime;
    query.Parameters.ParamByName('ReportDoc').value:=data.ReportDoc;
    query.Parameters.ParamByName('ReportDate').value:=data.ReportDate;
    query.Parameters.ParamByName('ReportTime').value:=data.ReportTime;
    query.Parameters.ParamByName('SpecType').value:=data.SpecType ;
    query.Parameters.ParamByName('Comment').value:=data.Comment ;
    query.Parameters.ParamByName('Status').DataType:=ftInteger;
    query.Parameters.ParamByName('Status').value:=1;
    query.Parameters.ParamByName('LastUpateTime').DataType:=ftDateTime;
    query.Parameters.ParamByName('LastUpateTime').value:=Now;
    query.Prepared := True;

    query.ExecSQL;
    query.Free;
    query:=nil;
    Result:=True;
end;



end.


