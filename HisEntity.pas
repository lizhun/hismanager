unit HisEntity;

interface
uses
         SysUtils, Variants, Classes, Graphics, Controls, Forms,SOAPHTTPClient,Rio,StdCtrls,Dialogs,
  InvokeRegistry,xmldom,XMLDoc,msxmldom,XMLIntf;

type
    TPatOrd = class
    RegNo 	:string; //	�ǼǺ�
    CardNo	:string; //	����
    Name 	:string; //	���� 
    SexCode	:string; //	�Ա����
    Sex 	:string; //	�Ա� 
    Age 	:string; //	����
    BirthDay	:string; //	�������� 
    Marry 	:string; //	���� 
    Address 	:string; //	��ַ 
    Telephone 	:string; //	�绰 
    CredentialNo	:string; //	֤���� 
    NationCode	:string; //	�������
    Nation	:string; //	���� 
    OccupationCode	:string; //	ְҵ����
    Occupation	:string; //	ְҵ 
    DocumentID	:string; //	������
    InsuranceNo	:string; //	ҽ���� 
    AdmType	:string; //	�������
    AdmNo	:string; //	����ID 
    AdmSerialNum	:string; //	������ˮ�� 
    FeeType	:string; //	�ѱ�
    WardCode	:string; //	��������
    Ward	:string; //	���� 
    RoomCode	:string; //	�������
    Room	:string; //	�����
    BedNo	:string; //	���� 
    ClinicDiagnose 	:string; //	�ٴ���� 
    ClinicDisease 	:string; //	�ٴ���ʷ 
    OperationInfo 	:string; //	�������� 
    OtherInfo 	:string; //	������Ϣ
    OrdRowID	:string; //	ҽ����
    OrdName 	:string; //	ҽ������ 
    OrdCode	:string; //	ҽ�������
    OrdPrice	:string; //	ҽ���۸�
    OrdBillStatus	:string; //	�շ�״̬
    OrdPriorityCode	:string; //	ҽ��������
    OrdPriority	:string; //	ҽ�����
    Hospital 	:string; //	����ҽԺ 
    OrdLocCode	:string; //	�������Ҵ���
    OrdLoc 	:string; //	�������� 
    OrdDoctorCode	:string; //	����ҽ������
    OrdDoctor 	:string; //	����ҽ��
    OrdDate 	:string; //	�������� 
    OrdTime 	:string; //	����ʱ�� 
    OrdExeLocCode	:string; //	ִ�п��Ҵ���
    OrdExeLoc 	:string; //	ִ�п��� 
    Position	:string; //	��鲿λ
    Purpose	:string; //	���Ŀ��
    end;

type
    TBookedInfo = class
    OrdRowID	:string; //	ҽ���� 
    ResourceCode	:string; //	��Դ����
    Resource	:string; //	��Դ
    BookedDate 	:string; //	ԤԼ����
    BookedTime 	:string; //	ԤԼʱ��
    BookedAddress	:string; //	ԤԼ���ص�
    OperatorCode	:string; //	����Ա����
    Operator 	:string; //	����Ա
    NoteInfo 	:string; //	ע������
    OtherInfo 	:string; //	������Ϣ
end;

type
    TCancelBookedInfo = class
    OrdRowID 	:string; //	ҽ����
    CancelDate	:string; //	ȡ������
    CancelTime	:string; //	ȡ��ʱ��
    OperatorCode	:string; //	�����˴���
    Operator	:string; //	������

end;

type
    TRegInfo =class
    OrdRowID	:string; //	ҽ����
    StudyNo	:string; //	���ţ���������
    EQInfo	:string; //	�豸
    OperatorCode	:string; //	����Ա����
    Operator 	:string; //	����Ա
    MainDocCode	:string; //	���ҽ������
    MainDoc 	:string; //	���ҽ��
    RegDate	:string; //	�Ǽ�����
    RegTime	:string; //	�Ǽ�ʱ��
end;

type
    TReturnReport = class
    OrdRowID	:string; //	ҽ���� 
    StudyNo 	:string; //	���ţ��������ţ�
    GetDocCode	:string; //	ȡ��ҽ������
    GetDoc	:string; //	ȡ��ҽ�� 
    ReportStatusCode	:string; //	����״̬����
    ReportStatus 	:string; //	����״̬���� 
    UnsendCause 	:string; //	δ������ԭ�� 
    ReportDocCode	:string; //	����ҽ������
    ReportDoc 	:string; //	����ҽ�� 
    AuditDocCode	:string; //	���ҽ������
    AuditDoc 	:string; //	���ҽ�� 
    ReportDate 	:string; //	�������� 
    AuditDate 	:string; //	������� 
    ReportTime 	:string; //	����ʱ�� 
    AuditTime 	:string; //	���ʱ�� 
    Memo 	:string; //	��ע 
    ImageFile 	:string; //	ͼ���·�������ͼʹ��@�ָ 
    HisArchiveTag 	:string; //	HIS�鵵��� 
    EyeSee 	:string; //	��������(���ڲ���ȡ��) 
    ExamSee 	:string; //	������� 
    Diagnose 	:string; //	��Ͻ��
end;

type
  TPatInfo=class
    RegNo	:string; //	���˵ǼǺ�
    DocumentID	:string; //	������
    PatName	:string; //	��������
    Age	:string; //	����
    Sex	:string; //	�Ա�
    CardID	:string; //	���֤��
    Telephone	:string; //	��ϵ�绰
    Address	:string; //	��ϵ��ַ
    Nation	:string; //	����
end;

type
    TCancelFeeApp=class
    OrdRowID	:string; //	ҽ��Rowid
    OperatorCode	:string; //	����Ա����
    Operator	:string; //	����Ա
    CancelFeeAppDate	:string; //	ȡ������
    CancelFeeAppTime	:string; //	ȡ��ʱ��
    CancelFeeAppReason	:string; //	ȡ��ԭ��
end;

    type
    TCheckComplete=class
    OrdRowID	:string; //	ҽ��Rowid
    StudyNo	:string; //	����
    PicturePath	:string; //	ͼ��·��
    OperatorCode	:string; //	����Ա����
    Operator	:string; //	����Ա
    CheckUpDate	:string; //	�������
    CheckUpTime	:string; //	���ʱ��

end;

type
    TCancelReport=class
    OrdRowID	:string; //	ҽ����
    StudyNo	:string; //	���ţ���������
    CancelDocCode	:string; //	ȡ��ҽ������
    CancelDoc	:string; //	ȡ��ҽ��
    CancelDate 	:string; //	ȡ������
    CancelTime	:string; //	ȡ��ʱ��
    CacelReportReason	:string; //	ȡ������ԭ��
end ;

type
    TDictInfo = class
    Code	:string;//	����
    Desc	:string;//	����
    Alias	:string;//	������
end;

type
    TSaveAntCVResult = class
    AntCVResultID	:string;   //	Σ��ֵ���ID Ψһ��ʶһ��Σ��ֵ��¼ID
    ReportType	:string;     // ��������	 1���顢2����3�ĵ硢4������5�ھ���6����
    StudyNo	:string;         //	���ţ���������
    OrdRowID	:string;//     ҽ��ID ���ҽ��ID��Ӣ�ķֺ�;�ָ�
    AuditDate	:string;//	Σ��ֵ��������     YYYY-MM-DD
    AuditTime	:string;//	Σ��ֵ����ʱ��     HH:MM:SS
    AuditDocCode	:string;//	Σ��ֵ�����˹���      ȡ�����Ŀ���Ϊ��
    AuditDocName:string;       //Σ��ֵ����������    ����
    AuditComment	:string;//     ���˵��
    OrdName	:string;//	��������
    Result	:string;//	Σ��ֵ�������
    Ranges	:string;//	�ο���Χ
    OrdDoc	:string;//	������
    OrdDate	:string;//	��������
    OrdTime	:string;//	����ʱ��
    ColDoc	:string;//	�ɼ���
    ColDate	:string;//	�ɼ�����
    ColTime	:string;//	�ɼ�ʱ��
    RecDoc	:string;//	������
    RecDate	:string;//	��������
    RecTime	:string;//	����ʱ��
    WarDate	:string;//	Ԥ������
    WarTime:string;//   Ԥ��ʱ��
    CheckDoc	:string;//	������
    CheckDate	:string;//	��������
    CheckTime	:string;//	����ʱ��
    ReportDoc	:string;//	������
    ReportDate	:string;//	��������
    ReportTime	:string;//	����ʱ��
    SpecType	:string;//	�걾����
    Comment	:string;//	Σ��˵��
    Note	:string;//	��ע
    Status :Integer;
    SendUser:string;
    SendUserCode:string;
    LastUpateTime  :TDateTime ;
    CreateTime  :TDateTime;

end;

TArrayTPatOrd  =array of TPatOrd;
implementation

end.
 