程序运行需引用  HisEntity HisManager两个文件，同时将HISDHC.dll放至运行程序同目录下
数据库需建立TB_AckAntCVResult表
  
接口说明：
MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;//保存危急值至HIS 类TSaveAntCVResult在HisEntity文件里面
SaveAntCVResultToDb(con:TADOConnection;data:TSaveAntCVResult):Boolean; //保存危急值到数据库

附
   1.每一个检查类型的数据库都需建一张保存危急值的表
   2.危急值命名  [检查类型首字大写]_[检查号]，如 WJ_20170001
   3.网站服务器数据库连接名 [DB]_[检查类型首字大写],如 DB_WJ
   4.HIS回调接口只有一个，DZT服务器将通过"检查类型首字大写"来区分信息存储的数据库