package sql;

public class Sql {
	public static final String YBBS_INSERT_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,SEQ_QA_NO.CURRVAL,0)";
	public static final String YBBS_INSERT_REPLY_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,?,1)";

    public static final String YBBS_SELECTALL_SQL = "SELECT QANUMBER,QASUBJECT,QADATE,QAVISITED,USERID,QAGROUP,QALEVEL FROM YBBS_QA ORDER BY QAGROUP DESC,QALEVEL ASC,QADATE DESC";
    public static final String YBBS_SELECTBYNO_SQL = "SELECT QANUMBER,USERID,QASUBJECT,QACOMMENT FROM YBBS_QA WHERE QANUMBER = ?";
    public static final String YBBS_UPDATE_SQL = "UPDATE YBBS_QA SET QASUBJECT = ? , QACOMMENT = ? WHERE QANUMBER = ?";
    public static final String YBBS_DELETE_SQL = "DELETE FROM YBBS_QA WHERE QANUMBER = ?";
    public static final String YBBS_UPDATE_VISITED = "UPDATE YBBS_QA SET QAVISITED = QAVISITED+1 WHERE QANUMBER = ?";
    public static final String YBBS_PAGE_SQL = "SELECT * from (SELECT ROWNUM RN,ybbss.* FROM (SELECT * FROM YBBS_QA ORDER BY QAGROUP DESC,QALEVEL ASC,QADATE DESC) ybbss) WHERE RN BETWEEN ? AND ?";
    public static final String YBBS_SELECT_ALL_COUNT ="SELECT COUNT(*) AS cnt FROM YBBS";
	
	//==========================박성혁 Sql=======================================
	public static final String RESTAURANT_SELECT_BY_CATEGORY_SQL = "SELECT * FROM RESTAURANT WHERE CNUM = ?";
	public static final String CITY_SELECT_ALL_SQL = "SELECT * FROM CITY";
	public static final String TOWN_SELECT_ALL_SQL = "SELECT * FROM TOWN";
	
	//==========================황호영 Sql↓=======================================
	
	
	//==========================천다연 Sql↓=======================================


}
