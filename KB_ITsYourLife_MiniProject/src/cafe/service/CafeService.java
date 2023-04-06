package cafe.service;

import java.util.List;

import cafe.dto.CoffeeDto;
import cafe.dto.OrderDto;
import cafe.exception.DMLException;
import cafe.exception.SearchWrongException;

public interface CafeService {

	/**
	 * 모든 커피 메뉴 검색
	 */
	List<CoffeeDto> selectAll() throws SearchWrongException;
	
	/**
	 * 커피메뉴에 키워드 입력해서 상세정보 보기
	 * */
	List<CoffeeDto> coffeeSelectByKeyWord(String keyWord) throws SearchWrongException;
	
	
	/**
	 * 주문한 메뉴들 주문 테이블에 insert하기
	 * @작성자 : 곽승규
	 * */
	void coffeeOrder(OrderDto dto) throws DMLException;
	
	/**
	 * 주문완료한 것들 토탈 금액 산출하기
	 * @작성자 : 곽승규
	 * */
	void totalPriceUpdate(OrderDto dto) throws DMLException;
	
	
}
