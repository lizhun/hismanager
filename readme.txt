程序运行需引用  HisEntity HisManager两个文件，同时将HISDHC.dll放至运行程序同目录下
数据库需建立TB_AckAntCVResult表
  
接口说明：
MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;//保存危急值至HIS 类TSaveAntCVResult在HisEntity文件里面
SaveAntCVResultToDb(con:TADOConnection;data:TSaveAntCVResult):Boolean; //保存危急值到数据库