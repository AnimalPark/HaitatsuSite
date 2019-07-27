package sql;

public class Sql {
	public static final String YBBS_INSERT_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,SEQ_QA_NO.CURRVAL,0)";
	public static final String YBBS_INSERT_REPLY_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,?,1)";
	public static final String YBBS_SELECTALL_SQL = "SELECT NO,SUBJECT,ID,WDATE,GRP,LVL,VISITED "
			+ "FROM YBBS "
			+ "ORDER BY GRP DESC,LVL ASC,WDATE DESC";
	public static final String YBBS_SELECTBYNO_SQL = "SELECT NO,ID,SUBJECT,CONTENT FROM YBBS WHERE NO = ?";
	public static final String YBBS_UPDATE_SQL = "UPDATE YBBS SET SUBJECT = ? , CONTENT = ? WHERE NO = ?";
	public static final String YBBS_DELETE_SQL = "DELETE FROM YBBS WHERE NO = ?";
	public static final String YBBS_UPDATE_VISITED = "UPDATE ybbs SET visited = visited+1 where no = ?";
	public static final String YBBS_PAGE_SQL = "SELECT * from (SELECT ROWNUM RN,ybbss.* FROM (SELECT * FROM YBBS ORDER BY GRP DESC,LVL ASC,WDATE DESC) ybbss) WHERE RN BETWEEN ? AND ?";
    public static final String YBBS_SELECT_ALL_COUNT ="SELECT COUNT(*) AS cnt FROM YBBS";
	
	//==========================¹Ú¼ºÇõ Sql=======================================
	public static final String RESTAURANT_SELECT_BY_CATEGORY_SQL = "SELECT NAME FROM RESTAURANT WHERE CNUM = ?";
}
