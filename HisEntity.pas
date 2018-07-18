unit HisEntity;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, SOAPHTTPClient, Rio,
  StdCtrls, Dialogs, InvokeRegistry, xmldom, XMLDoc, msxmldom, XMLIntf;

type
  TPatOrd = class
    RegNo: string; //	�ǼǺ�
    CardNo: string; //	����
    Name: string; //	����
    SexCode: string; //	�Ա����
    Sex: string; //	�Ա�
    Age: string; //	����
    BirthDay: string; //	��������
    Marry: string; //	����
    Address: string; //	��ַ
    Telephone: string; //	�绰
    CredentialNo: string; //	֤����
    NationCode: string; //	�������
    Nation: string; //	����
    OccupationCode: string; //	ְҵ����
    Occupation: string; //	ְҵ
    DocumentID: string; //	������
    InsuranceNo: string; //	ҽ����
    AdmType: string; //	�������
    AdmNo: string; //	����ID
    AdmSerialNum: string; //	������ˮ��
    FeeType: string; //	�ѱ�
    WardCode: string; //	��������
    Ward: string; //	����
    RoomCode: string; //	�������
    Room: string; //	�����
    BedNo: string; //	����
    ClinicDiagnose: string; //	�ٴ����
    ClinicDisease: string; //	�ٴ���ʷ
    OperationInfo: string; //	��������
    OtherInfo: string; //	������Ϣ
    OrdRowID: string; //	ҽ����
    OrdName: string; //	ҽ������
    OrdCode: string; //	ҽ�������
    OrdPrice: string; //	ҽ���۸�
    OrdBillStatus: string; //	�շ�״̬
    OrdPriorityCode: string; //	ҽ��������
    OrdPriority: string; //	ҽ�����
    Hospital: string; //	����ҽԺ
    OrdLocCode: string; //	�������Ҵ���
    OrdLoc: string; //	��������
    OrdDoctorCode: string; //	����ҽ������
    OrdDoctor: string; //	����ҽ��
    OrdDate: string; //	��������
    OrdTime: string; //	����ʱ��
    OrdExeLocCode: string; //	ִ�п��Ҵ���
    OrdExeLoc: string; //	ִ�п���
    Position: string; //	��鲿λ
    Purpose: string; //	���Ŀ��
  end;

type
  TBookedInfo = class
    OrdRowID: string; //	ҽ����
    ResourceCode: string; //	��Դ����
    Resource: string; //	��Դ
    BookedDate: string; //	ԤԼ����
    BookedTime: string; //	ԤԼʱ��
    BookedAddress: string; //	ԤԼ���ص�
    OperatorCode: string; //	����Ա����
    operator: string; //	����Ա
    NoteInfo: string; //	ע������
    OtherInfo: string; //	������Ϣ
  end;

type
  TCancelBookedInfo = class
    OrdRowID: string; //	ҽ����
    CancelDate: string; //	ȡ������
    CancelTime: string; //	ȡ��ʱ��
    OperatorCode: string; //	�����˴���
    operator: string; //	������

  end;

type
  TRegInfo = class
    OrdRowID: string; //	ҽ����
    StudyNo: string; //	���ţ���������
    EQInfo: string; //	�豸
    OperatorCode: string; //	����Ա����
    operator: string; //	����Ա
    MainDocCode: string; //	���ҽ������
    MainDoc: string; //	���ҽ��
    RegDate: string; //	�Ǽ�����
    RegTime: string; //	�Ǽ�ʱ��
  end;

type
  TReturnReport = class
    OrdRowID: string; //	ҽ����
    StudyNo: string; //	���ţ��������ţ�
    GetDocCode: string; //	ȡ��ҽ������
    GetDoc: string; //	ȡ��ҽ��
    ReportStatusCode: string; //	����״̬����
    ReportStatus: string; //	����״̬����
    UnsendCause: string; //	δ������ԭ��
    ReportDocCode: string; //	����ҽ������
    ReportDoc: string; //	����ҽ��
    AuditDocCode: string; //	���ҽ������
    AuditDoc: string; //	���ҽ��
    ReportDate: string; //	��������
    AuditDate: string; //	�������
    ReportTime: string; //	����ʱ��
    AuditTime: string; //	���ʱ��
    Memo: string; //	��ע
    ImageFile: string; //	ͼ���·�������ͼʹ��@�ָ
    HisArchiveTag: string; //	HIS�鵵���
    EyeSee: string; //	��������(���ڲ���ȡ��)
    ExamSee: string; //	�������
    Diagnose: string; //	��Ͻ��
  end;

type
  TPatInfo = class
    RegNo: string; //	���˵ǼǺ�
    DocumentID: string; //	������
    PatName: string; //	��������
    Age: string; //	����
    Sex: string; //	�Ա�
    CardID: string; //	���֤��
    Telephone: string; //	��ϵ�绰
    Address: string; //	��ϵ��ַ
    Nation: string; //	����
  end;

type
  TCancelFeeApp = class
    OrdRowID: string; //	ҽ��Rowid
    OperatorCode: string; //	����Ա����
    operator: string; //	����Ա
    CancelFeeAppDate: string; //	ȡ������
    CancelFeeAppTime: string; //	ȡ��ʱ��
    CancelFeeAppReason: string; //	ȡ��ԭ��
  end;

type
  TCheckComplete = class
    OrdRowID: string; //	ҽ��Rowid
    StudyNo: string; //	����
    PicturePath: string; //	ͼ��·��
    OperatorCode: string; //	����Ա����
    operator: string; //	����Ա
    CheckUpDate: string; //	�������
    CheckUpTime: string; //	���ʱ��

  end;

type
  TCancelReport = class
    OrdRowID: string; //	ҽ����
    StudyNo: string; //	���ţ���������
    CancelDocCode: string; //	ȡ��ҽ������
    CancelDoc: string; //	ȡ��ҽ��
    CancelDate: string; //	ȡ������
    CancelTime: string; //	ȡ��ʱ��
    CacelReportReason: string; //	ȡ������ԭ��
  end;

type
  TDictInfo = class
    Code: string; //	����
    Desc: string; //	����
    Alias: string; //	������
  end;

type
  TSaveAntCVResult = class
    AntCVResultID: string;   //	Σ��ֵ���ID Ψһ��ʶһ��Σ��ֵ��¼ID
    ReportType: string;     // ��������	 1���顢2����3�ĵ硢4������5�ھ���6����
    StudyNo: string;         //	���ţ���������
    OrdRowID: string; //     ҽ��ID ���ҽ��ID��Ӣ�ķֺ�;�ָ�
    AuditDate: string; //	Σ��ֵ��������     YYYY-MM-DD
    AuditTime: string; //	Σ��ֵ����ʱ��     HH:MM:SS
    AuditDocCode: string; //	Σ��ֵ�����˹���      ȡ�����Ŀ���Ϊ��
    AuditDocName: string;       //Σ��ֵ����������    ����
    AuditComment: string; //     ���˵��
    OrdName: string; //	��������
    Result: string; //	Σ��ֵ�������
    Ranges: string; //	�ο���Χ
    OrdDoc: string; //	������
    OrdDate: string; //	��������
    OrdTime: string; //	����ʱ��
    ColDoc: string; //	�ɼ���
    ColDate: string; //	�ɼ�����
    ColTime: string; //	�ɼ�ʱ��
    RecDoc: string; //	������
    RecDate: string; //	��������
    RecTime: string; //	����ʱ��
    WarDate: string; //	Ԥ������
    WarTime: string; //   Ԥ��ʱ��
    CheckDoc: string; //	������
    CheckDate: string; //	��������
    CheckTime: string; //	����ʱ��
    ReportDoc: string; //	������
    ReportDate: string; //	��������
    ReportTime: string; //	����ʱ��
    SpecType: string; //	�걾����
    Comment: string; //	Σ��˵��
    Note: string; //	��ע
    Status: Integer;
    SendUser: string;
    SendUserCode: string;
    LastUpateTime: TDateTime;
    CreateTime: TDateTime;
  end;

type
  TDiagnoseRowInfo = class
    DiagnoseTypeCode: string;  //	������ʹ���
    DiagnoseTypeDesc: string;  //	�����������
    DiagnoseCode: string;  //	��ϴ���
    DiagnoseDesc: string;  //	�������
    DiagUserCode: string;  //	���ҽ������
    DiagUserDesc: string;  //	���ҽ��
    DiagnoseDate: string;  //	�������
    DiagnoseTime: string;  //	���ʱ��
  end;

  TArrayTDiagnoseRowInfo = array of TDiagnoseRowInfo;

type
  TRegisterDocument = class
    RegisterNo: string;      // �ǼǺ�
    AdmNo: string;           // �����
    DocumentCode: string;    // �ĵ�����
    DocumentID: string;      // �ĵ�ID
    ZYH: string;            // סԺ��
    DZSQDBH: string;        // �������뵥���
    HZSFZH: string;        // �������֤��
    MJZH: string;          // �ţ��������
    NL_Year: string;        // ���䣨�꣩
    NL_Month: string;      // ���䣨�£�
    Phone: string;          // �绰����
    XB_Code: string;         // �Ա����
    XB_Name: string;         // �Ա�����
    HZLX_Code: string;      // �������ʹ���
    HZLX_Des: string;      // ������������
    HZ_Name: string;        // ��������
    BC_Number: string;      // ������
    BF_Number: string;      // ������
    BF_Code: string;        // ��������
    BQ_Name: string;        // ��������
    BQ_Code: string;        // ��������
    KS_Name: string;         // ��������
    KS_Code: string;         // ���Ҵ���
    YLJGZZJG_Code: string;  // ҽ�ƻ�����֯��������
    JCSQJG_Name: string;    // ��������������
    JCBGJG_Name: string;    // ��鱨���������
    ZDJG_Name: string;      // ��ϻ�������
    JC_Type: string;        // ������
    JCBGKS: string;        // ��鱨�����
    JCBGKS_Code: string;    // ��鱨����Ҵ���
    JCSQKS: string;          // ����������
    JCSQKS_Code: string;    // ���������Ҵ���
    JCBGDBH: string;        // ��鱨�浥���
    JCJSQM: string;        // ��鼼ʦǩ��
    JCJSQM_Code: string;    // ��鼼ʦǩ������
    JCJG_Code: string;      // ���������
    JCJG_Des: string;      // ���������
    JC_Date: string;        // �������
    JCXM_Code: string;      // �����Ŀ����
    JCXM_Des: string;      // �����Ŀ����
    JCBGBZ: string;         // ��鱨�汸ע
    JCBGJG_KGSJ: string;     // ��鱨����-�͹�����
    JCBGJG_ZGTS: string;     // ��鱨����-������ʾ
    JCFF_Name: string;    // ��鷽������
    JCBG_Date: string;     // ��鱨������
    JCYSQM: string;        // ���ҽʦǩ��
    JCYSQM_Code: string;   // ���ҽʦǩ������
    BGYSQM: string;        // ����ҽʦǩ��
    BGYSQM_Code: string;   // ����ҽʦǩ������
    SHYSQM: string;        // ���ҽʦǩ��
    SHYSQM_Code: string;   // ���ҽʦǩ������
    BBCY_Date: string;      // �걾��������ʱ��
    BBGDY_Name: string;    // �걾�̶�Һ����
    BB_Type: string;        // �걾���
    BB_Status: string;      // �걾״̬
    CZ_Code: string;        // ��������
    CZBW_Code: string;      // ������λ����
    CZCS: string;          // ��������
    CZFF_Des: string;      // ������������
    CZ_Name: string;        // ��������
    CZ_Date: string;        // ��������ʱ��
    JCBB_Number: string;    // ���걾��
    JCDLJG: string;        // ��鶨�����
    JCDLJG_Unit: string;    // ��鶨�����������λ
    JSBB_Date: string;      // ���ձ걾����ʱ��
    JRW_Name: string;      // ����������
    MZFF_Code: string;      // ����������
    MZGCJG: string;        // ����۲���
    MZYSQM: string;        // ����ҽʦǩ��
    MZZXYBS_Code: string;  // ��������ҽ��ʶ����
    TSJCBZ: string;        // �������־
    ZLGC_des: string;      // ���ƹ�������
    ZZ_StartDate: string;  // ֢״��ʼ����ʱ��
    ZZ_Des: string;        // ֢״����
    ZZ_StopDate: string;    // ֢״ֹͣ����ʱ��
    ZS: string;            // ����
    DiagnoseRowInfo:TArrayTDiagnoseRowInfo; //���������Ϣ����
  end;

  TArrayTPatOrd = array of TPatOrd;

type
  TValidateTicketRes = class
    CanLogin: Boolean;
    ResText: string;
  end;

type
  TValidateInfo = class
    Ptickets: string;
    Pcode: string;
  end;

type
  TAdmRes = class
    AdmNo: string;  //	�����
    AdmSerialNum: string;  //	������ˮ��
    DocumentID: string;  //	������
    PatRowID: string;  //	����ROWID
    RegisterNo: string;  //	�ǼǺ�
    AdmName: string;  //	��������
    SexCode: string;  //	�Ա�
    Age: string;  //	����
    Birthday: string;  //	��������
    AdmHospID: string;  //	����Ժ��
    AdmHospCode: string;  //	����Ժ������
    AdmHospDesc: string;  //	����Ժ������
    AdmStatusCode: string;  //	����״̬����
    AdmStatusDesc: string;  //	����״̬����
    AdmTypeCode: string;  //	�������ʹ���
    AdmTypeDesc: string;  //	������������
    FeeTypeRowID: string;  //	�ѱ�RowID
    FeeTypeCode: string;  //	�ѱ����
    FeeTypeDesc: string;  //	�ѱ�����
    AdmDate: string;  //	��������
    AdmTime: string;  //	����ʱ��
    InBedDate: string;  //	�ִ�����
    InBedTime: string;  //	�ִ�ʱ��
    AdmDoctorRowID: string;  //	����ҽ��RowID������ҽ������Ժҽ����
    AdmDoctorCode: string;  //	����ҽ�����루����ҽ������Ժҽ����
    AdmDoctorDesc: string;  //	����ҽ������������ҽ������Ժҽ����
    Height: string;  //	���
    Weigth: string;  //	����
    VisitNum: string;  //	סԺ����
    ResidentDays: string;  //	סԺ����
    DisDateMR: string;  //	��Ժ����(ͳ��)
    DisTimeMR: string;  //	��Ժʱ��(ͳ��)
    DisDateNurse: string;  //	��Ժ����(��ʿ����)
    DisTimeNurse: string;  //	��Ժʱ��(��ʿ����)
    DisDateDoctor: string;  //	��Ժ����(ҽ������)
    DisTimeDoctor: string;  //	��Ժʱ��(ҽ������)
    AdmDeptRowID: string;  //	��Ժ���Һţ�����RowID
    AdmDeptCode: string;  //	��Ժ���Һţ����Ҵ���
    AdmDeptDesc: string;  //	��Ժ���Һţ���������
    AdmWardRowID: string;  //	��Ժ����RowID
    AdmWardCode: string;  //	��Ժ��������
    AdmWardDesc: string;  //	��Ժ��������
    AdmRoomRowID: string;  //	��Ժ����RowID
    AdmRoomCode: string;  //	��Ժ�������
    AdmRoomDesc: string;  //	��Ժ��������
    AdmBedRowID: string;  //	��Ժ����RowID
    AdmBedNo: string;  //	��Ժ����
    CurrentDetpRowID: string;  //	��ǰ(��Ժ)����RowID
    CurrentDetpCode: string;  //	��ǰ(��Ժ)���Ҵ���
    CurrentDetpDesc: string;  //	��ǰ(��Ժ)��������
    CurrentWardRowID: string;  //	��ǰ(��Ժ)����RowID
    CurrentWardCode: string;  //	��ǰ(��Ժ)��������
    CurrentWardDesc: string;  //	��ǰ(��Ժ)��������
    CurrentRoomRowID: string;  //	��ǰ(��Ժ)����RowID
    CurrentRoomCode: string;  //	��ǰ(��Ժ)�������
    CurrentRoomDesc: string;  //	��ǰ(��Ժ)��������
    CurrentBedRowID: string;  //	��ǰ(��Ժ)����RowID
    CurrentBedNo: string;  //	��ǰ(��Ժ)����
    ClinicDisease: string;  //	�ٴ���ʷ
    OperationInfo: string;  //	������Ϣ
    OtherInfo: string;  //	������Ϣ
    DischCondit: string;  //	��Ժ���
    PhyAddress: string;  //	���������ַ
    TimeRangeCode: string;  //	����ʱ��
    RegfeeNo: string;  //	�������
    Diagnoses: TArrayTDiagnoseRowInfo;
  end;

type
  TRisTimeAxisReq = class
    OrdRowID: string;    //���ҽ������@�ָ�
    StudyNo: string;
    DocCode: string;
    Doc: string;
    StartDate: string;  //YYYY-MM-DD  StartDate+StartTime�ǿ�ʱ��EndDate+ EndTimeΪ��ʱ���ж�Ϊ��鿪ʼ��
    StartTime: string;   //HH:MM:SS
    EndDate: string;    //YYYY-MM-DD    StartDate+StartTimeΪ��ʱ��EndDate+ EndTime�ǿ�ʱ���ж�Ϊ��������
    EndTime: string;    //HH:MM:SS
  end;

implementation

end.

