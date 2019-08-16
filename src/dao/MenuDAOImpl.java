package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import addrToken.addrDivide;
import model.City;
import model.Comments;
import model.Menu;
import model.Restaurant;
import model.Town;
import model.UserOrderList;
import model.UserOrderListSub;
import sql.Sql;

public class MenuDAOImpl extends BaseDAO implements MenuDAO {

	@Override
	public List<Restaurant> selectByCategory(int category) {
		List<Restaurant> lists = new ArrayList<Restaurant>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_CATEGORY_SQL);
			preparedStatement.setInt(1, category);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getFloat("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));

				lists.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<City> selectAllCity() {
		List<City> lists = new ArrayList<City>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.CITY_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				City city = new City();

				city.setCitynum(resultSet.getInt("CITYNUM"));
				city.setCityname(resultSet.getString("CITYNAME"));

				lists.add(city);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Town> selectAllTown() {
		List<Town> lists = new ArrayList<Town>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.TOWN_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Town town = new Town();

				town.setCitynum(resultSet.getInt("CITYNUM"));
				town.setTownnum(resultSet.getInt("TOWNNUM"));
				town.setTownname(resultSet.getString("TOWNNAME"));

				lists.add(town);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Restaurant> selectByTownnum(String cityname, String townname) {
		List<Restaurant> lists = new ArrayList<Restaurant>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_TOWNNUM_SQL);
			preparedStatement.setString(1, cityname);
			preparedStatement.setString(2, townname);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getFloat("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));

				lists.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<Menu> selectAllMenu() {
		List<Menu> menus = new ArrayList<Menu>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_ALL_MENU_SQL);

			while (resultSet.next()) {
				Menu menu = new Menu();

				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));

				menus.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return menus;
	}

	@Override
	public Menu selectByMnum(int mNum) {
		Menu menu = new Menu();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_MNUM_SQL);
			preparedStatement.setInt(1, mNum);
			resultSet = preparedStatement.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return menu;
	}

	@Override
	public boolean insertMenu(Menu menu) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_INSERT_MENU_SQL);

			preparedStatement.setInt(1, menu.getrNum());
			preparedStatement.setString(2, menu.getmName());
			preparedStatement.setInt(3, menu.getmPrice());
			preparedStatement.setString(4, menu.getmFileName());

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

		return result;
	}

	@Override
	public boolean updateMenu(Menu menu) {

		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_UPDATE_MENU_SQL);

			preparedStatement.setInt(1, menu.getrNum());
			preparedStatement.setString(2, menu.getmName());
			preparedStatement.setInt(3, menu.getmPrice());
			preparedStatement.setInt(4, menu.getmSales());
			preparedStatement.setInt(5, menu.getmNum());

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

		return result;
	}

	@Override
	public boolean deleteMenu(int mNum) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_DELETE_MENU_SQL);
			preparedStatement.setInt(1, mNum);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	public Restaurant selectByRnum(int rnum) {
		Restaurant restaurant = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getFloat("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));
				restaurant.setrAddr(resultSet.getString("RADDR"));
				restaurant.setrPhoneNum(resultSet.getString("RPHONENUM"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return restaurant;
	}

	@Override
	public List<Menu> menuSelectByRnum(int rnum) {
		List<Menu> lists = new ArrayList<Menu>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Menu menu = new Menu();

				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));

				lists.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public Menu menuSelectByMnum(int mnum) {
		Menu menu = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_MNUM_SQL);
			preparedStatement.setInt(1, mnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				menu = new Menu();

				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));
				menu.setmFileName(resultSet.getString("mfilename"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return menu;
	}

	public String MnumToMname(int mnum) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String name = "";
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_MNUM_SQL);
			preparedStatement.setInt(1, mnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				name = resultSet.getString("MNAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return name;
	}

	public int priceOfMenu(int mnum) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int price = 0;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_SELECT_BY_MNUM_SQL);
			preparedStatement.setInt(1, mnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				price = resultSet.getInt("MPRICE");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return price;
	}

	@Override
	public List<Menu> menuDetailSelectByRnum(int rNum) {

		List<Menu> menuList = new ArrayList<Menu>();
		Menu menu = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.MENU_DETAIL_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rNum);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				menu = new Menu();

				menu.setmNum(resultSet.getInt("mNum"));
				menu.setrNum(resultSet.getInt("rNum"));
				menu.setmName(resultSet.getString("mName"));
				menu.setmPrice(resultSet.getInt("mPrice"));
				menu.setmSales(resultSet.getInt("mSales"));

				menuList.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return menuList;
	}

	@Override
	public boolean insertUserOrder(String userid, int delichk) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.INSERT_USERORDER_SQL);

			preparedStatement.setString(1, userid);
			preparedStatement.setInt(2, delichk);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean insertOrderMenu(int mnum, int onum, int count) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.INSERT_ORDERMENU_SQL);

			preparedStatement.setInt(1, mnum);
			preparedStatement.setInt(2, onum);
			preparedStatement.setInt(3, count);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public int nowOrderOnum() {
		int onum = -1;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.NOW_ORDER_ONUM_SQL);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				onum = resultSet.getInt("oNum");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return onum;
	}

	@Override
	public List<Comments> selectByRnumComments(int rno) {
		List<Comments> lists = new ArrayList<Comments>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.COMMENTS_SELECT_BY_RNUM_SQL);
			preparedStatement.setInt(1, rno);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Comments Comment = new Comments();

				Comment.setCommnum(resultSet.getInt("COMMNUM"));
				Comment.setRnum(resultSet.getInt("RNUM"));
				Comment.setUserid(resultSet.getString("USERID"));
				Comment.setCommcontents(resultSet.getString("COMMCONTENTS"));
				Comment.setStar(resultSet.getInt("STAR"));
				Comment.setCommaddr(resultSet.getString("COMMADDR"));
				Comment.setOrder_str(resultSet.getString("ORDER_STR"));

				lists.add(Comment);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return lists;
	}

	@Override
	public Comments insert(Comments comments) {
		Comments selectByComment = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.INSERT_COMMENT_SQL);
			preparedStatement.setInt(1, comments.getRnum());
			preparedStatement.setString(2, comments.getUserid());
			preparedStatement.setString(3, comments.getCommcontents());
			preparedStatement.setInt(4, comments.getStar());
			preparedStatement.setString(5, comments.getOrder_str());

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				statement = connection.createStatement();

				resultSet = statement.executeQuery(Sql.COMMENTS_GET_CURRVAL_SQL);
				if (resultSet.next()) {
					selectByComment = selectByNum(resultSet.getInt("COMMNUM"));
					System.out.println("++"+selectByComment.toString()+"++");
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, statement, null);
			closeDBObjects(null, preparedStatement, connection);
		}
		return selectByComment;
	}

	@Override
	public Comments selectByNum(int commnum) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Comments comment = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.COMMENTS_SELECT_BY_COMMNUM_SQL);
			preparedStatement.setInt(1, commnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				comment = new Comments();
				comment.setCommnum(resultSet.getInt("COMMNUM"));
				comment.setRnum(resultSet.getInt("RNUM"));
				comment.setUserid(resultSet.getString("USERID"));
				comment.setCommcontents(resultSet.getString("COMMCONTENTS"));
				comment.setStar(resultSet.getInt("STAR"));
				comment.setCommaddr(resultSet.getString("COMMADDR"));
				comment.setOrder_str(resultSet.getString("ORDER_STR"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return comment;
	}

	@Override
	public boolean delete(int commnum) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean result = false;

		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.DELETE_COMMENT_SQL);
			preparedStatement.setInt(1, commnum);
			int chk = preparedStatement.executeUpdate();
			if (chk != 0)
				result = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public List<String> useridToAddr(String userid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String addr = null;
		List<String> addrTokens = new ArrayList<String>();
		addrDivide div = new addrDivide();
		System.out.println("+"+userid);
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USER_GET_ADDR_BY_USERID_SQL);
			preparedStatement.setString(1, userid);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				addr = resultSet.getString("UADDR");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		addrTokens = div.addrTokensGet(addr);
		
		return addrTokens;
	}

	@Override
	public List<Restaurant> selectByTownnumAndCnum(int cnum, String cityname, String townname) {
		List<Restaurant> lists = new ArrayList<Restaurant>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_SELECT_BY_TOWNNUM_AND_CATEGORY_SQL);
			preparedStatement.setInt(3, cnum);
			preparedStatement.setString(1, cityname);
			preparedStatement.setString(2, townname);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Restaurant restaurant = new Restaurant();

				restaurant.setrNum(resultSet.getInt("RNUM"));
				restaurant.setrName(resultSet.getString("RNAME"));
				restaurant.setcNum(resultSet.getInt("CNUM"));
				restaurant.setStarAvg(resultSet.getFloat("STARAVG"));
				restaurant.setTownNum(resultSet.getInt("TOWNNUM"));

				lists.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<UserOrderList> userOrderList(String userid) {
		List<UserOrderList> lists = new ArrayList<UserOrderList>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.USERORDER_SELECT_BY_USERID_SQL);
			preparedStatement.setString(1, userid);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				UserOrderList list = new UserOrderList();

				list.setoNum(resultSet.getInt("ONUM"));
				list.setUserId(resultSet.getString("USERID"));
				list.setoDate(resultSet.getString("ODATE"));
				list.setDeliChk(resultSet.getInt("DELICHK"));
				list.setComment_chk(resultSet.getInt("COMMENT_CHK"));

				lists.add(list);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public List<UserOrderListSub> orderInfoSub(int onum) {
		List<UserOrderListSub> lists = new ArrayList<UserOrderListSub>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.ORDERINFO_SELECT_BY_ONUM_SQL);
			preparedStatement.setInt(1, onum);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				UserOrderListSub list = new UserOrderListSub();
				list.setrNum(resultSet.getInt("RNUM"));
				list.setrName(resultSet.getString("RNAME"));
				list.setmName(resultSet.getString("MNAME"));
				list.setCount(resultSet.getInt("COUNT"));
				list.setmPrice(resultSet.getInt("MPRICE"));

				lists.add(list);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return lists;
	}

	@Override
	public boolean orderCommentChk(int onum) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.ORDERCOMMENT_CHK_SQL);

			preparedStatement.setInt(1,onum);


			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}

		return result;
	}

	@Override
	public boolean settingRestaurantStaragv(int rnum) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		int sum = 0;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_STAR_SUM_GET_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				sum = resultSet.getInt("SUM");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		int comment_cnt = 0;
		float avg = 0;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_COMMENT_CNT_GET_SQL);
			preparedStatement.setInt(1, rnum);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				comment_cnt = resultSet.getInt("COMMENT_CNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		try{
			avg = (float) sum / (float) comment_cnt;
			System.out.println(sum+"/"+comment_cnt+"="+avg);
		}
		catch(Exception e){
			;
		}
		
		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(Sql.RESTAURANT_STAR_AGV_UPDATE_SQL);
			preparedStatement.setFloat(1, avg);
			preparedStatement.setFloat(2, rnum);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;	
	}
}
