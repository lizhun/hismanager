��������������  HisEntity HisManager�����ļ���ͬʱ��HISDHC.dll�������г���ͬĿ¼��
���ݿ��轨��TB_AckAntCVResult��
  
�ӿ�˵����
MSaveAntCVResult(ASaveAntCVResult: TSaveAntCVResult): Boolean;//����Σ��ֵ��HIS ��TSaveAntCVResult��HisEntity�ļ�����
SaveAntCVResultToDb(con:TADOConnection;data:TSaveAntCVResult):Boolean; //����Σ��ֵ�����ݿ�

��
   1.ÿһ��������͵����ݿⶼ�轨һ�ű���Σ��ֵ�ı�
   2.Σ��ֵ����  [����������ִ�д]_[����]���� WJ_20170001
   3.��վ���������ݿ������� [DB]_[����������ִ�д],�� DB_WJ
   4.HIS�ص��ӿ�ֻ��һ����DZT��������ͨ��"����������ִ�д"��������Ϣ�洢�����ݿ�