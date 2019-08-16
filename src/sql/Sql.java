package sql;

public class Sql {
	public static final String YBBS_INSERT_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,SEQ_QA_NO.CURRVAL,0)";
	public static final String YBBS_INSERT_REPLY_SQL = "INSERT INTO YBBS_QA VALUES "
			+ "(SEQ_QA_NO.NEXTVAL,?,?,SYSDATE,0,?,?,1)";
	public static final String YBBS_INSERT_EVENT_SQL = "INSERT INTO YBBS_EVENT VALUES "
			+ "(SEQ_EVENT_NO.NEXTVAL,?,?,SYSDATE,0,?)";
    public static final String YBBS_SELECTALL_SQL = "SELECT QANUMBER,QASUBJECT,QADATE,QAVISITED,USERID,QAGROUP,QALEVEL FROM YBBS_QA ORDER BY QAGROUP DESC,QALEVEL ASC,QADATE DESC";
    public static final String YBBS_SELECT_ALL_EVENT_SQL ="SELECT * FROM YBBS_EVENT ORDER BY EVDATE DESC";
    public static final String YBBS_SELECTBYNO_SQL = "SELECT QANUMBER,USERID,QASUBJECT,QACOMMENT FROM YBBS_QA WHERE QANUMBER = ?";
    public static final String YBBS_SELECTBY_EVNUM_SQL = "SELECT * FROM YBBS_EVENT WHERE EVNUMBER = ?";
    public static final String YBBS_SELECTBY_ID_SQL = "SELECT * FROM YBBS_QA WHERE USERID = ?";
    public static final String YBBS_UPDATE_SQL = "UPDATE YBBS_QA SET QASUBJECT = ? , QACOMMENT = ? WHERE QANUMBER = ?";
    public static final String YBBS_UPDATE_EVENT_SQL = "UPDATE YBBS_EVENT SET EVSUBJECT = ? , EVCOMMENT = ? WHERE EVNUMBER = ?";
    public static final String YBBS_DELETE_SQL = "DELETE FROM YBBS_QA WHERE QANUMBER = ?";
    public static final String YBBS_DELETE_EVENT_SQL = "DELETE FROM YBBS_EVENT WHERE EVNUMBER = ?";
    public static final String YBBS_DELETE_BY_GROUP_SQL = "DELETE FROM YBBS_QA WHERE QAGROUP = ?";
    public static final String YBBS_UPDATE_VISITED = "UPDATE YBBS_QA SET QAVISITED = QAVISITED+1 WHERE QANUMBER = ?";
    public static final String YBBS_UPDATE_EVENT_VISITED = "UPDATE YBBS_EVENT SET EVVISITED = EVVISITED+1 WHERE EVNUMBER = ?";
    public static final String YBBS_PAGE_SQL = "SELECT * from (SELECT ROWNUM RN,ybbss.* FROM (SELECT * FROM YBBS_QA ORDER BY QAGROUP DESC,QALEVEL ASC,QADATE DESC) ybbss) WHERE RN BETWEEN ? AND ?";
    public static final String YBBS_PAGE_EVENT_SQL = "SELECT * from (SELECT ROWNUM RN,ybbss.* FROM (SELECT * FROM YBBS_EVENT ORDER BY EVDATE DESC) ybbss) WHERE RN BETWEEN ? AND ?";
    public static final String YBBS_SELECT_ALL_COUNT ="SELECT COUNT(*) AS cnt FROM YBBS_QA";
    public static final String YBBS_SELECT_ALL_EVENT_COUNT ="SELECT COUNT(*) AS cnt FROM YBBS_EVENT";
    public static final String YBBS_CHK_VALID="SELECT USERID " + 
																    	   "FROM YBBS_QA " + 
																    	   "WHERE QAGROUP = ( SELECT QAGROUP " + 
																    	   									"FROM YBBS_QA " + 
																    	   									"WHERE QANUMBER = ?)";	
    
    
	
	//==========================박성혁 Sql=======================================
	public static final String RESTAURANT_SELECT_BY_CATEGORY_SQL = "SELECT * FROM RESTAURANT WHERE CNUM = ?";
	public static final String CITY_SELECT_ALL_SQL = "SELECT * FROM CITY";
	public static final String TOWN_SELECT_ALL_SQL = "SELECT * FROM TOWN";
	public static final String RESTAURANT_SELECT_BY_TOWNNUM_AND_CATEGORY_SQL = 	
			"SELECT * " + 
			"FROM RESTAURANT " + 
			"WHERE TOWNNUM = (SELECT TOWNNUM " + 
							"FROM TOWN " + 
							"WHERE CITYNUM = (SELECT CITYNUM " + 
											"FROM CITY " + 
											"WHERE CITYNAME = ? ) AND TOWNNAME = ? ) AND CNUM = ?";
	public static final String RESTAURANT_SELECT_BY_TOWNNUM_SQL = 	
			"SELECT * " + 
			"FROM RESTAURANT " + 
			"WHERE TOWNNUM = (SELECT TOWNNUM " + 
							"FROM TOWN " + 
							"WHERE CITYNUM = (SELECT CITYNUM " + 
											"FROM CITY " + 
											"WHERE CITYNAME = ? ) AND TOWNNAME = ? )";
	public static final String MENU_SELECT_BY_RNUM_SQL = "SELECT * FROM menu WHERE RNUM = ? ";
	public static final String INSERT_USERORDER_SQL	 = "INSERT INTO USERORDER VALUES(SEQ_USERORDER.NEXTVAL, ?, SYSDATE, ?, 0, 'dd')";
	public static final String INSERT_ORDERMENU_SQL	 = "INSERT INTO ORDERMENU VALUES(?, ?, ?)";
	public static final String NOW_ORDER_ONUM_SQL = 
			"SELECT ONUM " + 
			"FROM    (SELECT ONUM, ROWNUM " + 
					"FROM USERORDER " + 
					"ORDER BY ONUM DESC) " + 
			"WHERE ROWNUM = 1";
	public static final String INSERT_COMMENT_SQL = "INSERT INTO COMMENTS VALUES(SEQ_COMMENT.NEXTVAL, ?, ?, ?, ?, SYSDATE,?)";
	public static final String COMMENTS_SELECT_BY_RNUM_SQL = "SELECT * FROM COMMENTS WHERE RNUM = ? ORDER BY COMMADDR";
	public static final String COMMENTS_GET_CURRVAL_SQL = "SELECT SEQ_COMMENT.CURRVAL AS COMMNUM FROM DUAL";
	public static final String COMMENTS_SELECT_BY_COMMNUM_SQL = "SELECT * FROM COMMENTS WHERE COMMNUM = ?";
	public static final String DELETE_COMMENT_SQL = "DELETE FROM COMMENTS WHERE COMMNUM = ?";
	public static final String USER_GET_ADDR_BY_USERID_SQL = "SELECT UADDR FROM USERS WHERE USERID = ?";
	public static final String USERORDER_SELECT_BY_USERID_SQL = "SELECT * FROM USERORDER WHERE USERID = ? ORDER BY ODATE DESC";
	public static final String ORDERINFO_SELECT_BY_ONUM_SQL = "SELECT RNUM, RNAME, MNAME, COUNT, MPRICE FROM ORDERMENU NATURAL JOIN MENU NATURAL JOIN RESTAURANT WHERE ONUM = ?";
	public static final String ORDERCOMMENT_CHK_SQL = "UPDATE USERORDER SET COMMENT_CHK = 1 WHERE ONUM = ?";
	public static final String RESTAURANT_STAR_SUM_GET_SQL = "SELECT SUM(STAR) AS SUM FROM COMMENTS WHERE RNUM = ?";
	public static final String RESTAURANT_COMMENT_CNT_GET_SQL = "SELECT MAX(ROWNUM) AS COMMENT_CNT FROM COMMENTS WHERE RNUM = ?";
	public static final String RESTAURANT_STAR_AGV_UPDATE_SQL = "UPDATE RESTAURANT SET STARAVG = ? WHERE RNUM = ?";
	
	//==========================황호영 Sql↓=======================================
	public static final String RESTAURANT_SELECT_ALL_SQL = "SELECT * FROM restaurant";
	public static final String RESTAURANT_SELECT_BY_NAME_SQL = "SELECT * FROM restaurant WHERE rName like ?";
	public static final String RESTAURANT_SELECT_BY_RNUM_SQL = "SELECT * FROM restaurant WHERE rNum = ?";
	public static final String RESTAURANT_INSERT_RESTAURANT_SQL = "INSERT INTO restaurant values(seq_restaurant.nextval, ?,?,?,?,?,?)";
	public static final String RESTAURANT_UPDATE_RESTAURANT_SQL = "UPDATE restaurant SET rName=?, rPhoneNum=?, cNum=?, townNum=?, rAddr=? WHERE rNum=?";
	public static final String RESTAURANT_DELETE_RESTAURANT_SQL = "DELETE FROM restaurant WHERE rNum=?";
	
	public static final String MENU_SELECT_ALL_MENU_SQL = "SELECT * FROM menu";
	public static final String MENU_SELECT_BY_MNUM_SQL = "SELECT * FROM menu WHERE mnum = ?";
	public static final String MENU_DETAIL_SELECT_BY_RNUM_SQL = "SELECT * FROM menu WHERE rnum = ?";
	public static final String MENU_INSERT_MENU_SQL = "INSERT INTO menu values(seq_menu.nextval, ?, ?, ?, 0)";
	public static final String MENU_UPDATE_MENU_SQL = "UPDATE menu SET rNum=?, mName=?, mPrice=?, mSales=? WHERE  mNum=?";
	public static final String MENU_DELETE_MENU_SQL = "DELETE FROM menu WHERE mNum=?";
	
	//==========================천다연 Sql↓=======================================
	private static final String USERS_INSERT_SQL = "INSERT INTO users VALUES(?, ?, ?, ?, ?, ?)";
	private static final String USERS_SELECT_BY_USERID_PWD_SQL = "SELECT userId, uPwd, uName, uAddr, uPhonenum, authority FROM users WHERE userId = ? AND uPwd = ?";
	private static final String USERS_SELECT_BY_UNAME_UPHONE_SQL = "SELECT * FROM users WHERE uName = ? AND uPhonenum = ?";
	private static final String USERS_SELECT_BY_USERID_UNAME_UPHONE_SQL_SQL = "SELECT * FROM users WHERE userId= ? AND uName= ? AND uPhonenum = ?";
	private static final String USERS_UPDATE_PWD_SQL = "UPDATE users SET uPwd = ? WHERE userId = ?";
	private static final String USERS_SELECT_ALL_SQL = "SELECT * FROM users WHERE userId = ?";
	private static final String USERS_SELECT_BY_USERID_SQL = "SELECT userId FROM users";
	private static final String USERS_DELETE_SQL = "DELETE FROM users WHERE userId = ?";
}
