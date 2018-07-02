数据类型
  文档注册
   TRegisterDocument 文档主体信息
   TDiagnoseRowInfo 文档诊断项信息
   TArrayTDiagnoseRowInfo 文档诊断项信息数组
   主体信息和诊断项信息为一对多的关系

  单点登录参数
     SourceSystem	消息来源，区分各个系统（可以自己定义，不过要和信息科说明）
     Ptickets	服务器票据 （第三方返回的或exe传入参数）
     Pcode	pcode       （第三方返回的或exe传入参数）

  
接口说明：
THisManager.MRegisterDocument(ASaveAntCVResult: TSaveAntCVResult): Boolean;//文档注册

THisManager.MValidateTicket(con:TADOConnection;data:TSaveAntCVResult):Boolean; //单点登录


