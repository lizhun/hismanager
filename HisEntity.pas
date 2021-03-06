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
    DiagnoseTypeCode: string;  //	诊断类型代码
    DiagnoseTypeDesc: string;  //	诊断类型描述
    DiagnoseCode: string;  //	诊断代码
    DiagnoseDesc: string;  //	诊断名称
    DiagUserCode: string;  //	诊断医生工号
    DiagUserDesc: string;  //	诊断医生
    DiagnoseDate: string;  //	诊断日期
    DiagnoseTime: string;  //	诊断时间
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
    DiagnoseRowInfo: TArrayTDiagnoseRowInfo; //患者诊断信息数组
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
    AdmNo: string;  //	就诊号
    AdmSerialNum: string;  //	就诊流水号
    DocumentID: string;  //	病案号
    PatRowID: string;  //	病人ROWID
    RegisterNo: string;  //	登记号
    AdmName: string;  //	就诊姓名
    SexCode: string;  //	性别
    Age: string;  //	年龄
    Birthday: string;  //	出生日期
    AdmHospID: string;  //	就诊院区
    AdmHospCode: string;  //	就诊院区代码
    AdmHospDesc: string;  //	就诊院区描述
    AdmStatusCode: string;  //	就诊状态代码
    AdmStatusDesc: string;  //	就诊状态描述
    AdmTypeCode: string;  //	就诊类型代码
    AdmTypeDesc: string;  //	就诊类型描述
    FeeTypeRowID: string;  //	费别RowID
    FeeTypeCode: string;  //	费别代码
    FeeTypeDesc: string;  //	费别描述
    AdmDate: string;  //	就诊日期
    AdmTime: string;  //	就诊时间
    InBedDate: string;  //	分床日期
    InBedTime: string;  //	分床时间
    AdmDoctorRowID: string;  //	就诊医生RowID（主治医生、入院医生）
    AdmDoctorCode: string;  //	就诊医生代码（主治医生、入院医生）
    AdmDoctorDesc: string;  //	就诊医生描述（主治医生、入院医生）
    Height: string;  //	身高
    Weigth: string;  //	体重
    VisitNum: string;  //	住院次数
    ResidentDays: string;  //	住院天数
    DisDateMR: string;  //	出院日期(统计)
    DisTimeMR: string;  //	出院时间(统计)
    DisDateNurse: string;  //	出院日期(护士结算)
    DisTimeNurse: string;  //	出院时间(护士结算)
    DisDateDoctor: string;  //	出院日期(医生结算)
    DisTimeDoctor: string;  //	出院时间(医生结算)
    AdmDeptRowID: string;  //	入院（挂号）科室RowID
    AdmDeptCode: string;  //	入院（挂号）科室代码
    AdmDeptDesc: string;  //	入院（挂号）科室描述
    AdmWardRowID: string;  //	入院病区RowID
    AdmWardCode: string;  //	入院病区代码
    AdmWardDesc: string;  //	入院病区描述
    AdmRoomRowID: string;  //	入院房间RowID
    AdmRoomCode: string;  //	入院房间代码
    AdmRoomDesc: string;  //	入院房间描述
    AdmBedRowID: string;  //	入院床号RowID
    AdmBedNo: string;  //	入院床号
    CurrentDetpRowID: string;  //	当前(出院)科室RowID
    CurrentDetpCode: string;  //	当前(出院)科室代码
    CurrentDetpDesc: string;  //	当前(出院)科室描述
    CurrentWardRowID: string;  //	当前(出院)病区RowID
    CurrentWardCode: string;  //	当前(出院)病区代码
    CurrentWardDesc: string;  //	当前(出院)病区描述
    CurrentRoomRowID: string;  //	当前(出院)房间RowID
    CurrentRoomCode: string;  //	当前(出院)房间代码
    CurrentRoomDesc: string;  //	当前(出院)房间描述
    CurrentBedRowID: string;  //	当前(出院)床号RowID
    CurrentBedNo: string;  //	当前(出院)床号
    ClinicDisease: string;  //	临床病史
    OperationInfo: string;  //	手术信息
    OtherInfo: string;  //	其他信息
    DischCondit: string;  //	出院情况
    PhyAddress: string;  //	病区物理地址
    TimeRangeCode: string;  //	就诊时段
    RegfeeNo: string;  //	就诊序号
    Diagnoses: TArrayTDiagnoseRowInfo;
  end;

type
  TRisTimeAxisReq = class
    OrdRowID: string;    //多个医嘱号用@分隔
    StudyNo: string;
    DocCode: string;
    Doc: string;
    StartDate: string;  //YYYY-MM-DD  StartDate+StartTime非空时，EndDate+ EndTime为空时，判定为检查开始；
    StartTime: string;   //HH:MM:SS
    EndDate: string;    //YYYY-MM-DD    StartDate+StartTime为空时，EndDate+ EndTime非空时，判定为检查结束；
    EndTime: string;    //HH:MM:SS
  end;

type
  TSendAppBillReq = class
    RegNo: string;  //登记号 1301
    CardNo: string;  //卡号123121
    Name: string;  //姓名 张三
    SexCode: string;  //性别代码M
    Sex: string;  //性别 男
    Age: string;  //年龄 N岁N月N天
    BirthDay: string;  //出生日期 YYYY-MM-DD
    Marry: string;  //婚姻 （已婚/未婚）
    Address: string;  //地址 海淀区中关村知春路45号
    Telephone: string;  //电话 13423455322
    CredentialNo: string;  //证件号 3.24242E+20
    CredentialType: string;  //证件类型
    NationCode: string;  //民族代码____1
    Nation: string;  //民族 ____汉族
    OccupationCode: string;  //职业代码____2
    Occupation: string;  //职业 ____建筑工人
    DocumentID: string;  //病案号____也称住院号，限住院病人
    InsuranceNo: string;  //医保号 ____
    AdmType: string;  //就诊类别____参见5.2
    AdmNo: string;  //就诊ID ____2344
    AdmSerialNum: string;  //就诊流水号 ____OP00000023
    FeeType: string;  //费别____（医保、自费）
    WardCode: string;  //病区代码____2453
    Ward: string;  //病区 ____神经内科病区
    RoomCode: string;  //房间代码____中西医一科11
    Room: string;  //房间号____中西医一科11
    BedNo: string;  //床号 ____1101床
    ClinicDiagnose: string;  //临床诊断 ____
    ClinicDisease: string;  //临床病史 ____
    OperationInfo: string;  //手术资料 ____
    OtherInfo: string;  //其他信息____（如月经等，主要是申请单上的其他内容）
    AdmDocRowID: string;  //就诊医生指针____
    AdmDocCode: string;  //就诊医生代码____
    AdmDoc: string;  //就诊医生____
    OrdRowID: string;  //医嘱号____234_13
    ArcimCode: string;  //医嘱项目代码____
    OrdName: string;  //医嘱名称 ____胸部透射
    OrdPrice: string;  //医嘱价格____234.23
    OrdBillStatus: string;  //收费状态____参见5.3
    OrdPriorityCode: string;  //医嘱类别代码____N
    OrdPriority: string;  //医嘱类别____即刻
    OrdHospital: string;  //开单医院 ____"本院"
    OrdHospitalCode: string;  //开单医院代码____
    OrdExeHospital: string;  //执行医院____
    OrdExeHospitalCode: string;  //执行医院代码____
    ARCItemCat: string;  //医嘱子类____
    ARCItemCatCode: string;  //医嘱子类代码____
    OECOrderCategory: string;  //医嘱大类____
    OECOrderCategoryCode: string;  //医嘱大类代码____
    OrdLocCode: string;  //开单科室代码____343
    OrdLoc: string;  //开单科室 ____产科
    OrdDoctorCode: string;  //开单医生代码____P3244
    OrdDoctor: string;  //开单医生 ____李医生
    OrdDate: string;  //开单日期 ____YYYY-MM-DD
    OrdTime: string;  //开单时间 ____HH:MM:SS
    OrdExeLocCode: string;  //执行科室代码____532
    OrdExeLoc: string;  //执行科室 ____超声科
    SampleCode: string;  //标本代码____R
    SampleName: string;  //标本名称 ____
    SendFlag: string;  //发送标志____NW—新增申请单____CA—取消申请单
    NoteInfo: string;  //备注____
    Position: string;  //部位____
    Purpose: string;  //检查目的____
    CurCase: string;  //当前情况____
    Destination: string;  //发送位置____
    AutoFlag: string;  //自动预约标志____
    BookDate: string;  //预约日期____
    BookTime: string;  //预约时间____
    PhyAddress: string;  //病人所在地址____
    SpecialMarket: string;  //特殊标志____
    SpecialPerson: string;  //期望执行医生____
    SpecialDate: string;  //期望执行日期____
    StopDocCode: string;  //停医嘱医生代码____
    StopDocDesc: string;  //停医嘱医生____
    Modality: string;  //设备名称____具体某一台设备的名称，比如CR-1
  end;

implementation

end.

