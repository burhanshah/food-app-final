package com.foodapp.dao.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.foodapp.model2.FoodItem;
import com.foodapp.model2.Menu;
import com.foodapp.model2.Order;
import com.foodapp.model2.Owner;
import com.foodapp.model2.Restaurant;
import com.foodapp.model2.User;

public class DBManager {

	private static final String CONN_STR = "jdbc:mysql://localhost:3306/food_db?allowPublicKeyRetrieval=true&useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_USER_PASSWORD = "root";

	static {
		try {
			// load Driver class
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private static void addRestaurants() {
		Restaurant rt = new Restaurant("Habib", "Park Street");
		rt.setRating(4.4f);
		Restaurant rt2 = new Restaurant("Kabab House", "Oval square");
		rt2.setRating(4.0f);
		Restaurant rt3 = new Restaurant("Barbeque Nation", "Midtown");
		rt3.setRating(3.8f);

		addRestaurant(rt);
		addRestaurant(rt2);
		addRestaurant(rt3);
	}

	public static void addRestaurant(Restaurant rt) {
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "INSERT into `food_db`.`restaurant` (`name`, `rating`, `address`) " + "VALUES (?, ?, ?)";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, rt.getName());
			pstmt.setFloat(2, rt.getRating());
			pstmt.setString(3, rt.getAddress());

			pstmt.execute();

			System.out.println("Restaurant added");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void addOwners() {

	}

	public static User getUser(String userName, String password) {
		User user = null;

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`user` WHERE `username`=? AND `password`=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int id = result.getInt("iduser");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String address = result.getString("address");
				user = new User(id, userName, password, firstName, lastName, lastName, address);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
	
	public static User getUser(String userName) {
		User user = null;

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`user` WHERE `username`=? LIMIT 1";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userName);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int id = result.getInt("iduser");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String address = result.getString("address");
				user = new User(id, userName, null, firstName, lastName, lastName, address);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public static Owner getOwner(String userName, String password) {
		Owner user = null;

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`owner` WHERE `username`=? AND `password`=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int id = result.getInt("idowner");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String address = result.getString("address");
				int restaurantId = result.getInt("restaurant_idrestaurant");
				user = new Owner(id, userName, password, firstName, lastName, lastName, address);
				System.out.println(user);
				Restaurant restaurant = getRestaurantById(restaurantId);
				if (restaurant != null) {
					user.setRestaurant(restaurant);
				} else {
					user.setRestaurantId(restaurantId);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	private static Restaurant getRestaurantById(int restaurantId) {
		Restaurant restaurant = null;
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`restaurant` WHERE `idrestaurant`=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, restaurantId);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				restaurant = new Restaurant();
				restaurant.setName(result.getString("name"));
				restaurant.setRating(result.getFloat("rating"));
				restaurant.setAddress(result.getString("address"));
				restaurant.setId(result.getInt("idrestaurant"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return restaurant;
	}

	private static void addUsers() {
		User user1 = new User("user2", "pwduser2", "Jonh", "Doe", "user2@email.com", "TT Enclaves");
		User user2 = new User("user3", "pwduser3", "Albert", "Dave", "user3@email.com", "JK Heights");
		User user3 = new User("user4", "pwduser4", "David", "Moloney", "user4@email.com", "PR Sight");
		addUser(user1);
		addUser(user2);
		addUser(user3);
	}

	public static void addUser(User user) {

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {

			String sql = "INSERT INTO `food_db`.`user` (`username`, `email`, `password`, `first_name`, `last_name`, `address`)"
					+ " values (?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getFirstName());
			pstmt.setString(5, user.getLastName());
			pstmt.setString(6, user.getAddress());

			pstmt.execute();

			System.out.println("User added");

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
	}

	public static Restaurant getRestaurantByName(String resname) {
		Restaurant restaurant = null;

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "select * " + "	from `food_db`.`restaurant` as rest inner join `food_db`.`menu` as menu "
					+ "	on rest.idrestaurant = menu.restaurant_idrestaurant "
					+ "    inner join `food_db`.`food_item` as food " + "    on food.idfood = menu.food_item_idfood "
					+ "    where rest.name = ? order by food.idfood;";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, resname);

			ResultSet result = pstmt.executeQuery();
			int count = 0;
			while (result.next()) {
				if (count == 0) {
					restaurant = new Restaurant();
					restaurant.setName(result.getString("name"));
					restaurant.setRating(result.getFloat("rating"));
					restaurant.setAddress(result.getString("address"));
				}
				String category = result.getString("food_category").toUpperCase();
				FoodItem item = new FoodItem(result.getInt("idfood"), result.getString("item_name"),
						result.getFloat("price"), 0);
				restaurant.addItem(category, item);
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return restaurant;
	}

	public static void addOrder(Order order) {

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			// Add to order
			int offerId = getOfferId(order, connection);
			// Insert into order table
			String sql = "INSERT INTO `food_db`.`order` (`user_iduser`, `delivery_address`, `order_time`, "
					+ "`restaurant_idrestaurant`, `offers_idoffers`) VALUES " + "(?, ? , ?, ?, ?)";
			PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, order.getUserId());
			pstmt.setString(2, order.getAddress());
			pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
			pstmt.setInt(4, order.getRestaurantId());
			pstmt.setInt(5, offerId);

			// Insert order
			pstmt.execute();

			// get the order which was inserted above
			int orderId = getLastOrderIdOfUser(order, connection);
			// update order id from DB to object
			order.setOrderId(orderId);
			if (orderId == Integer.MIN_VALUE) {
				System.out.println("Something went wrong, cannot fetch order for user " + order.getUser());
				return;
			}

			addOrderItems(order, connection);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static void addOrderItems(Order order, Connection connection) throws SQLException {
		Menu orderItems = order.getOrderItems();
		addOrderItem(order, orderItems.getVeg(), "VEG", connection);
		addOrderItem(order, orderItems.getNonveg(), "NON-VEG", connection);
		addOrderItem(order, orderItems.getBread(), "BREAD", connection);
		addOrderItem(order, orderItems.getBeverage(), "BEVARAGE", connection);
	}

	private static void addOrderItem(Order order, List<FoodItem> items, String category, Connection connection)
			throws SQLException {
		int orderId = order.getOrderId();
		int userId = order.getUserId();
		int restaurantId = order.getRestaurantId();
		for (FoodItem item : items) {
			String sql = "INSERT INTO `food_db`.`order_items` (`item_name`, `item_price`, `item_category`, `item_qty` "
					+ "`order_idorder`, `order_user_iduser`, `order_restaurant_idrestaurant`) "
					+ "values (?, ?, ?, ?, ?, ?)";
			try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
				pstmt.setString(1, item.getName());
				pstmt.setFloat(2, item.getPrice());
				pstmt.setString(3, category);
				pstmt.setInt(4, item.getQty());
				pstmt.setInt(5, orderId);
				pstmt.setInt(6, userId);
				pstmt.setInt(7, restaurantId);
				pstmt.execute();
			}
		}
	}

	private static int getLastOrderIdOfUser(Order order, Connection connection) throws SQLException {
		String sql = "SELECT `idorder` from `food_db`.`order` where `restaurant_idrestaurant`=? and `user_iduser`=? ";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, order.getRestaurantId());
		pstmt.setInt(2, order.getUserId());
		ResultSet result = pstmt.executeQuery();
		int lastOrderId = Integer.MIN_VALUE;
		while (result.next()) {
			lastOrderId = Math.max(lastOrderId, result.getInt("idorder"));
		}
		return lastOrderId;
	}

	private static int getOfferId(Order order, Connection connection) throws SQLException {
		String sql = "SELECT `idoffers` from `food_db`.`offers` where `restaurant_idrestaurant`=? and `code`=? LIMIT 1";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, order.getRestaurantId());
		pstmt.setString(2, order.getOfferCode());
		ResultSet result = pstmt.executeQuery();
		while (result.next()) {
			int offerId = result.getInt("idoffers");
			return offerId;
		}
		return -1;
	}

	public static void main(String[] args) throws ClassNotFoundException {
		Order order = new Order();
		order.setAddress("address1");
		order.setComments("comment1");
		order.setContact("6384384");
		Restaurant res = getRestaurantById(1);
		order.setRestaurantId(res.getId());
		order.setResName(res.getName());
		order.setUser("user1");
		order.setUserId(1);
		Menu menu = new Menu();
		menu.getVeg().add(new FoodItem("Dal Fry", 80, 1));
		menu.getVeg().add(new FoodItem("Rice", 100, 1));
		menu.getNonveg().add(new FoodItem("Chicken Biryani", 200, 1));
		order.setOrderItems(menu);

		addOrder(order);

	}

	public static List<Order> getAllOrderForAdmin(String user) {
		List<Order> orders = new ArrayList<>();
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			Owner owner = getOwnerByUserName(user);
			Map<Integer, Order> allOrdersForRestaurant = getAllOrdersForRestaurant(owner.getRestaurant().getId());
			allOrdersForRestaurant.forEach((k, v) -> orders.add(v));
			orders.forEach(x -> {
				x.setTotalPrice(getTotalPrice(x));
				x.setResName(getRestaurantById(x.getRestaurantId()).getName());
			});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	private static Float getTotalPrice(Order order) {
		Float total = 0f;
		for(FoodItem item : order.getOrderItems().getVeg()) {
			total += item.getPrice();
		}
		for(FoodItem item : order.getOrderItems().getNonveg()) {
			total += item.getPrice();
		}
		for(FoodItem item : order.getOrderItems().getBread()) {
			total += item.getPrice();
		}
		for(FoodItem item : order.getOrderItems().getBread()) {
			total += item.getPrice();
		}
		return total;
	}

	private static Map<Integer, Order> getAllOrdersForRestaurant(int id) {
		Map<Integer, Order> orders = new HashMap<>();
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * from `food_db`.`order_items` AS item where "
					+ "item.order_restaurant_idrestaurant = ? ";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int orderId = result.getInt("order_idorder");
				
				// Create order object for unique orders
				if (!orders.containsKey(orderId)) {
					Order order = getOrderById(orderId);
					Menu menu = new Menu();
					order.setOrderItems(menu);
					orders.put(orderId, order);
				}
				
				FoodItem item = new FoodItem();
				item.setName(result.getString("item_name"));
				item.setPrice(result.getFloat("item_price"));
				item.setQuantity(result.getInt("item_qty"));
				String category = result.getString("item_category");
				if (category.equalsIgnoreCase("VEG")) {
					orders.get(orderId).getOrderItems().getVeg().add(item);
				} else if (category.equalsIgnoreCase("NON-VEG")) {
					orders.get(orderId).getOrderItems().getNonveg().add(item);
				} else if (category.equalsIgnoreCase("BREAD")) {
					orders.get(orderId).getOrderItems().getBread().add(item);
				} else if (category.equals("BEVERAGE")) {
					orders.get(orderId).getOrderItems().getBeverage().add(item);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	
	private static Map<Integer, Order> getAllOrdersForUser(int id) {
		Map<Integer, Order> orders = new HashMap<>();
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * from `food_db`.`order_items` AS item where "
					+ "item.order_user_iduser = ? ";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int orderId = result.getInt("order_idorder");
				
				// Create order object for unique orders
				if (!orders.containsKey(orderId)) {
					Order order = getOrderById(orderId);
					Menu menu = new Menu();
					order.setOrderItems(menu);
					orders.put(orderId, order);
				}
				
				FoodItem item = new FoodItem();
				item.setName(result.getString("item_name"));
				item.setPrice(result.getFloat("item_price"));
				item.setQuantity(result.getInt("item_qty"));
				String category = result.getString("item_category");
				if (category.equalsIgnoreCase("VEG")) {
					orders.get(orderId).getOrderItems().getVeg().add(item);
				} else if (category.equalsIgnoreCase("NON-VEG")) {
					orders.get(orderId).getOrderItems().getNonveg().add(item);
				} else if (category.equalsIgnoreCase("BREAD")) {
					orders.get(orderId).getOrderItems().getBread().add(item);
				} else if (category.equals("BEVERAGE")) {
					orders.get(orderId).getOrderItems().getBeverage().add(item);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	private static Order getOrderById(int orderId) {
		Order order = null;
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`order` WHERE idorder=? ";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, orderId);
			
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				order = new Order();
				order.setAddress(result.getString("delivery_address"));
				order.setRestaurantId(result.getInt("restaurant_idrestaurant"));
				order.setUserId(result.getInt("user_iduser"));
				order.setOrderId(orderId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}

	private static Owner getOwnerByUserName(String userName) {
		Owner user = null;

		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			String sql = "SELECT * FROM `food_db`.`owner` WHERE `username`=? ";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userName);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int id = result.getInt("idowner");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String address = result.getString("address");
				int restaurantId = result.getInt("restaurant_idrestaurant");
				user = new Owner(id, userName, null, firstName, lastName, lastName, address);
				System.out.println(user);
				Restaurant restaurant = getRestaurantById(restaurantId);
				if (restaurant != null) {
					user.setRestaurant(restaurant);
				} else {
					user.setRestaurantId(restaurantId);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public static List<Order> getAllOrderOfUser(String userName) {
		User user = getUser(userName);
		List<Order> orders = new ArrayList<>();
		try (Connection connection = DriverManager.getConnection(CONN_STR, DB_USER, DB_USER_PASSWORD)) {
			Map<Integer, Order> allOrdersForRestaurant = getAllOrdersForUser(user.getUserId());
			allOrdersForRestaurant.forEach((k, v) -> orders.add(v));
			orders.forEach(x -> {
				x.setTotalPrice(getTotalPrice(x));
				x.setResName(getRestaurantById(x.getRestaurantId()).getName());
			});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

}
