package dao;

import java.util.ArrayList;
import java.util.List;

import model.City;
import model.Comments;
import model.Menu;
import model.Restaurant;
import model.Town;
import model.UserOrderList;
import model.UserOrderListSub;

public interface MenuDAO {
	List<Restaurant> selectByCategory(int category);
	List<Restaurant> selectByTownnumAndCnum(int cnum, String cityname, String townname);	
	List<Restaurant> selectByTownnum(String cityname, String townname);	
	Restaurant selectByRnum(int rnum);	
	List<City> selectAllCity();
	List<Town> selectAllTown();
	List<String> useridToAddr(String userid);
	boolean settingRestaurantStaragv(int rnum);
	public Restaurant selectByrNum(int rNum);
	
	public boolean menuSalesUpdate(int msales, int mnum);
	public int getMsales(int mnum);
	
	boolean orderCommentChk(int onum);
	
	Menu menuSelectByMnum(int mnum);
	List<Menu> menuDetailSelectByRnum(int rNum);
	List<Menu> menuSelectByRnum(int rnum);
	List<Menu> selectAllMenu();
	Menu selectByMnum(int mNum);
	
	public String MnumToMname(int mnum);
	public int priceOfMenu(int mnum);
	
	boolean insertMenu(Menu menu);
	boolean updateMenu(Menu menu);
	boolean deleteMenu(int mNum);
	
	boolean insertUserOrder(String userid, int delichk);
	boolean insertOrderMenu(int mnum, int onum, int count);
	
	int nowOrderOnum();
	public Comments insert(Comments comments);
	Comments selectByNum(int commnum);
	public boolean delete(int commnum);
	List<Comments> selectByRnumComments(int rno);
	
	List<UserOrderList> userOrderList(String userid);
	List<UserOrderListSub> orderInfoSub(int onum);
	
}
