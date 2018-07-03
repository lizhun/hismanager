unit HisEntity;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, SOAPHTTPClient, Rio,
  StdCtrls, Dialogs, InvokeRegistry, xmldom, XMLDoc, msxmldom, XMLIntf;

type
  TPatOrd = class
    RegNo: string; //	登记号
    CardNo: string; //	卡号
    Name: string; //	姓名
    SexCode: string; //	性别代码
    Sex: string; //	性别
    Age: string; //	年龄
    BirthDay: string; //	出生日期
    Marry: string; //	婚姻
    Address: string; //	地址
    Telephone: string; //	电话
    CredentialNo: string; //	证件号
    NationCode: string; //	民族代码
    Nation: string; //	民族
    OccupationCode: string; //	职业代码
    Occupation: string; //	职业
    DocumentID: string; //	病案号
    InsuranceNo: string; //	医保号
    AdmType: string; //	就诊类别
    AdmNo: string; //	就诊ID
    AdmSerialNum: string; //	就诊流水号
    FeeType: string; //	费别
    WardCode: string; //	病区代码
    Ward: string; //	病区
    RoomCode: string; //	房间代码
    Room: string; //	房间号
    BedNo: string; //	床号
    ClinicDiagnose: string; //	临床诊断
    ClinicDisease: string; //	临床病史
    OperationInfo: string; //	手术资料
    OtherInfo: string; //	其他信息
    OrdRowID: string; //	医嘱号
    OrdName: string; //	医嘱名称
    OrdCode: string; //	医嘱项代码
    OrdPrice: string; //	医嘱价格
    OrdBillStatus: string; //	收费状态
    OrdPriorityCode: string; //	医嘱类别代码
    OrdPriority: string; //	医嘱类别
    Hospital: string; //	开单医院
    OrdLocCode: string; //	开单科室代码
    OrdLoc: string; //	开单科室
    OrdDoctorCode: string; //	开单医生代码
    OrdDoctor: string; //	开单医生
    OrdDate: string; //	开单日期
    OrdTime: string; //	开单时间
    OrdExeLocCode: string; //	执行科室代码
    OrdExeLoc: string; //	执行科室
    Position: string; //	检查部位
    Purpose: string; //	检查目的
  end;

type
  TBookedInfo = class
    OrdRowID: string; //	医嘱号
    ResourceCode: string; //	资源代码
    Resource: string; //	资源
    BookedDate: string; //	预约日期
    BookedTime: string; //	预约时间
    BookedAddress: string; //	预约检查地点
    OperatorCode: string; //	操作员代码
    operator: string; //	操作员
    NoteInfo: string; //	注意事项
    OtherInfo: string; //	其他信息
  end;

type
  TCancelBookedInfo = class
    OrdRowID: string; //	医嘱号
    CancelDate: string; //	取消日期
    CancelTime: string; //	取消时间
    OperatorCode: string; //	操作人代码
    operator: string; //	操作人

  end;

type
  TRegInfo = class
    OrdRowID: string; //	医嘱号
    StudyNo: string; //	检查号（第三方）
    EQInfo: string; //	设备
    OperatorCode: string; //	操作员代码
    operator: string; //	操作员
    MainDocCode: string; //	检查医生代码
    MainDoc: string; //	检查医生
    RegDate: string; //	登记日期
    RegTime: string; //	登记时间
  end;

type
  TReturnReport = class
    OrdRowID: string; //	医嘱号
    StudyNo: string; //	检查号（第三方号）
    GetDocCode: string; //	取材医生代码
    GetDoc: string; //	取材医生
    ReportStatusCode: string; //	报告状态代码
    ReportStatus: string; //	报告状态描述
    UnsendCause: string; //	未发报告原因
    ReportDocCode: string; //	报告医生代码
    ReportDoc: string; //	报告医生
    AuditDocCode: string; //	审核医生代码
    AuditDoc: string; //	审核医生
    ReportDate: string; //	报告日期
    AuditDate: string; //	审核日期
    ReportTime: string; //	报告时间
    AuditTime: string; //	审核时间
    Memo: string; //	备注
    ImageFile: string; //	图像的路径（多幅图使用@分割）
    HisArchiveTag: string; //	HIS归档标记
    EyeSee: string; //	肉眼所见(用于病理取材)
    ExamSee: string; //	检查所见
    Diagnose: string; //	诊断结果
  end;

type
  TPatInfo = class
    RegNo: string; //	病人登记号
    DocumentID: string; //	病案号
    PatName: string; //	病人姓名
    Age: string; //	年龄
    Sex: string; //	性别
    CardID: string; //	身份证号
    Telephone: string; //	联系电话
    Address: string; //	联系地址
    Nation: string; //	民族
  end;

type
  TCancelFeeApp = class
    OrdRowID: string; //	医嘱Rowid
    OperatorCode: string; //	操作员代码
    operator: string; //	操作员
    CancelFeeAppDate: string; //	取消日期
    CancelFeeAppTime: string; //	取消时间
    CancelFeeAppReason: string; //	取消原因
  end;

type
  TCheckComplete = class
    OrdRowID: string; //	医嘱Rowid
    StudyNo: string; //	检查号
    PicturePath: string; //	图像路径
    OperatorCode: string; //	操作员代码
    operator: string; //	操作员
    CheckUpDate: string; //	检查日期
    CheckUpTime: string; //	检查时间

  end;

type
  TCancelReport = class
    OrdRowID: string; //	医嘱号
    StudyNo: string; //	检查号（第三方）
    CancelDocCode: string; //	取消医生代码
    CancelDoc: string; //	取消医生
    CancelDate: string; //	取消日期
    CancelTime: string; //	取消时间
    CacelReportReason: string; //	取消报告原因
  end;

type
  TDictInfo = class
    Code: string; //	代码
    Desc: string; //	描述
    Alias: string; //	助记码
  end;

type
  TSaveAntCVResult = class
    AntCVResultID: string;   //	危急值结果ID 唯一标识一次危急值记录ID
    ReportType: string;     // 报告类型	 1检验、2病理、3心电、4超声、5内镜、6放射
    StudyNo: string;         //	检查号（第三方）
    OrdRowID: string; //     医嘱ID 多个医嘱ID用英文分号;分隔
    AuditDate: string; //	危急值发送日期     YYYY-MM-DD
    AuditTime: string; //	危急值发送时间     HH:MM:SS
    AuditDocCode: string; //	危急值发送人工号      取不到的可暂为空
    AuditDocName: string;       //危急值发送人姓名    张三
    AuditComment: string; //     审核说明
    OrdName: string; //	提醒内容
    Result: string; //	危急值结果内容
    Ranges: string; //	参考范围
    OrdDoc: string; //	申请人
    OrdDate: string; //	申请日期
    OrdTime: string; //	申请时间
    ColDoc: string; //	采集人
    ColDate: string; //	采集日期
    ColTime: string; //	采集时间
    RecDoc: string; //	接收人
    RecDate: string; //	接收日期
    RecTime: string; //	接收时间
    WarDate: string; //	预警日期
    WarTime: string; //   预警时间
    CheckDoc: string; //	复核人
    CheckDate: string; //	复核日期
    CheckTime: string; //	复核时间
    ReportDoc: string; //	报告人
    ReportDate: string; //	报告日期
    ReportTime: string; //	报告时间
    SpecType: string; //	标本类型
    Comment: string; //	危机说明
    Note: string; //	备注
    Status: Integer;
    SendUser: string;
    SendUserCode: string;
    LastUpateTime: TDateTime;
    CreateTime: TDateTime;
  end;

type
  TDiagnoseRowInfo = class
    DiagnoseCode: string;      //疾病诊断编码
    DiagnoseDesc: string;      //疾病诊断描述
    DiagnoseTypeCode: string;  //疾病诊断类型代码
    DiagnoseTypeDesc: string;  //疾病诊断类型描述
    DiagnoseDate: string;      //诊断日期
  end;

  TArrayTDiagnoseRowInfo = array of TDiagnoseRowInfo;

type
  TRegisterDocument = class
    RegisterNo: string;      // 登记号
    AdmNo: string;           // 就诊号
    DocumentCode: string;    // 文档编码
    DocumentID: string;      // 文档ID
    ZYH: string;            // 住院号
    DZSQDBH: string;        // 电子申请单编号
    HZSFZH: string;        // 患者身份证号
    MJZH: string;          // 门（急）诊号
    NL_Year: string;        // 年龄（岁）
    NL_Month: string;      // 年龄（月）
    Phone: string;          // 电话号码
    XB_Code: string;         // 性别代码
    XB_Name: string;         // 性别名称
    HZLX_Code: string;      // 患者类型代码
    HZLX_Des: string;      // 患者类型描述
    HZ_Name: string;        // 患者姓名
    BC_Number: string;      // 病床号
    BF_Number: string;      // 病房号
    BF_Code: string;        // 病房代码
    BQ_Name: string;        // 病区名称
    BQ_Code: string;        // 病区代码
    KS_Name: string;         // 科室名称
    KS_Code: string;         // 科室代码
    YLJGZZJG_Code: string;  // 医疗机构组织机构代码
    JCSQJG_Name: string;    // 检查申请机构名称
    JCBGJG_Name: string;    // 检查报告机构名称
    ZDJG_Name: string;      // 诊断机构名称
    JC_Type: string;        // 检查类别
    JCBGKS: string;        // 检查报告科室
    JCBGKS_Code: string;    // 检查报告科室代码
    JCSQKS: string;          // 检查申请科室
    JCSQKS_Code: string;    // 检查申请科室代码
    JCBGDBH: string;        // 检查报告单编号
    JCJSQM: string;        // 检查技师签名
    JCJSQM_Code: string;    // 检查技师签名代码
    JCJG_Code: string;      // 检查结果代码
    JCJG_Des: string;      // 检查结果描述
    JC_Date: string;        // 检查日期
    JCXM_Code: string;      // 检查项目代码
    JCXM_Des: string;      // 检查项目描述
    JCBGBZ: string;         // 检查报告备注
    JCBGJG_KGSJ: string;     // 检查报告结果-客观所见
    JCBGJG_ZGTS: string;     // 检查报告结果-主观提示
    JCFF_Name: string;    // 检查方法名称
    JCBG_Date: string;     // 检查报告日期
    JCYSQM: string;        // 检查医师签名
    JCYSQM_Code: string;   // 检查医师签名代码
    BGYSQM: string;        // 报告医师签名
    BGYSQM_Code: string;   // 报告医师签名代码
    SHYSQM: string;        // 审核医师签名
    SHYSQM_Code: string;   // 审核医师签名代码
    BBCY_Date: string;      // 标本采样日期时间
    BBGDY_Name: string;    // 标本固定液名称
    BB_Type: string;        // 标本类别
    BB_Status: string;      // 标本状态
    CZ_Code: string;        // 操作编码
    CZBW_Code: string;      // 操作部位编码
    CZCS: string;          // 操作次数
    CZFF_Des: string;      // 操作方法描述
    CZ_Name: string;        // 操作名称
    CZ_Date: string;        // 操作日期时间
    JCBB_Number: string;    // 检查标本号
    JCDLJG: string;        // 检查定量结果
    JCDLJG_Unit: string;    // 检查定量结果计量单位
    JSBB_Date: string;      // 接收标本日期时间
    JRW_Name: string;      // 介入物名称
    MZFF_Code: string;      // 麻醉方法代码
    MZGCJG: string;        // 麻醉观察结果
    MZYSQM: string;        // 麻醉医师签名
    MZZXYBS_Code: string;  // 麻醉中西医标识代码
    TSJCBZ: string;        // 特殊检查标志
    ZLGC_des: string;      // 诊疗过程描述
    ZZ_StartDate: string;  // 症状开始日期时间
    ZZ_Des: string;        // 症状描述
    ZZ_StopDate: string;    // 症状停止日期时间
    ZS: string;            // 主诉
    DiagnoseRowInfo:TArrayTDiagnoseRowInfo //患者诊断信息数组
  end;

  TArrayTPatOrd = array of TPatOrd;

implementation

end.
 
