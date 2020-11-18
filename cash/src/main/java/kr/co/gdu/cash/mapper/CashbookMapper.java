package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

//@Controller, @Service, @Mapper, @Repository : 스테레오 타입

@Mapper
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook);
	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String,Object>> selectCashbookListByMonth(Map<String,Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String,Object> map);
	Cashbook selectCashbookById(int cashbookId);
	int updateCashbook(Cashbook cashbook);
	int deleteCashbook(int cashbookId);
	// 인수(Map) : beginRow, rowPerPage
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	// 전체 cashbookList -> 엑셀파일
	List<Cashbook> selectCashbookListAll();
	
	// cashbookList 전체 갯수
	int selectCountList();
}
