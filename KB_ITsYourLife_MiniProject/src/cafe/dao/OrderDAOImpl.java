package cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import cafe.common.DBManager;
import cafe.dto.CoffeeDto;
import cafe.dto.OrderDetailDto;
import cafe.dto.OrderDto;
import cafe.exception.DMLException;

public class OrderDAOImpl implements OrderDAO{

	private static OrderDAO instance = new OrderDAOImpl();

	/**
	 * 외부에서 객체 생성 막음 (싱글톤)
	 * */
	private OrderDAOImpl() {}
	public static OrderDAO getInstance() {
		return instance; 
	}


	/**
	 * 주문 insert 구현
	 * @작성자 : 곽승규
	 * */
	@Override
	public int orderInsert(OrderDto orderDto) throws DMLException {
		Connection con = null;
		PreparedStatement ps = null;

		String sql = "INSERT INTO tbl_order(order_num_seq, is_togo, order_date) VALUES(seq_order.NEXTVAL, ?, DEFAULT)";

		int result = 0;


		try {
			con = DBManager.getConnection();
			
			con.setAutoCommit(false); // 자동커밋 해지

			ps = con.prepareStatement(sql);

			ps.setInt(1, orderDto.getIsToGo());
			
			result = ps.executeUpdate();
			
			
			int re [] = this.orderDetails(con, orderDto);
			
			for(int i : re) {
				if ( i != 1) {
					con.rollback();
					throw new DMLException("주문상세 입력에 예외가 발생했습니다.");
				}
			}
			
			con.commit(); //커밋하기
			System.out.println(orderDto);
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			}catch (SQLException ex) {
				ex.printStackTrace();
			}
			throw new DMLException("주문 입력에 예외가 발생했습니다.");
		}finally {
			DBManager.releaseConnection(con, ps);
		}

		return result;

	}

	/**
	 * 주문테이블에 total_price 업데이트하기
	 * @작성자 : 곽승규
	 * */
	public int orderUpdate(OrderDto orderDto) throws DMLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update tbl_order set total_price = ? where order_num_seq = ?";
		
		int result = 0;
		
		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			
			int totalPrice = getTotalPrice(orderDto); // 값 나오는 것 확인	
			ps.setInt(1, orderDto.getTotalPrice()); // 총 금액 
			ps.setInt(2, orderDto.getOrderNumSeq()); //여기에서 문제가생긴듯 함.
			
			result = ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			throw new DMLException("토탈 금액 수정에 예외가 발생했습니다.");
		}
		finally {
			DBManager.releaseConnection(con, ps);
		}
		
		return result;
	}
	
	
	
	/**
	 * 주문상세 insert 구현
	 * @작성자 : 곽승규
	 * */
	@Override
	public int[] orderDetails(Connection con, OrderDto orderDto) throws SQLException {
		PreparedStatement ps = null;

		String sql = "insert into tbl_detail_order values(order_detail_seq.NEXTVAL, seq_order.CURRVAL, ?, ?, ?, ?)";

		int result [] = null;
		int count = 0;
		try {
			ps = con.prepareStatement(sql);

			List<OrderDetailDto> orderDetailList = orderDto.getOrderDetailList();
			result = new int[orderDetailList.size()];
			int totalPrice = 0; // 토탈 금액 저장할 변수
			
			for( OrderDetailDto orderDetail : orderDetailList) {
				
				// 각 튜플마다 가격 넣기 위한 코드
				CoffeeDAO coffeeDAO = CoffeeDAOImpl.getInstance();
				CoffeeDto beverage = coffeeDAO.coffeeSelectByName(orderDetail.getMenuName());
				
				ps.setString(1, orderDetail.getMenuName());
				ps.setInt(2, orderDetail.getKind());
				ps.setInt(3, orderDetail.getAmount());
				
				int price = 0; // 주문상세 당 각각의 가격 저장할 변수
				
				
				if (orderDetail.getKind() == 1) { // hot임
					price = beverage.getHotPrice() * orderDetail.getAmount();
				}else {//ice임
					price = beverage.getIcePrice() * orderDetail.getAmount();
				}
				orderDetail.setEachPrice(price);
				
				ps.setInt(4, price);
				
				totalPrice += price;

				result[count++] = ps.executeUpdate();

			}
<<<<<<< HEAD
			
			// 총 금액 저장하기
			orderDto.setTotalPrice(totalPrice);

		} finally {
			DBManager.releaseConnection(null,ps);
		}
		return result;
	}

	public int getTotalPrice(OrderDto orderDto) {
		List<OrderDetailDto> orderDetailList = orderDto.getOrderDetailList();
		
		int totalPrice = 0;
		for( OrderDetailDto orderDetail : orderDetailList) {
			int tmp = orderDetail.getEachPrice();
			totalPrice += tmp;
		}
		return totalPrice;
	}

}
