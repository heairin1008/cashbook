package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashbookMapper.selectCashbookListByDay(map);
	}
	
	public int getselectSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		int sum = cashbookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
	
	public List<Map<String,Object>> getCashListByMonth(int currentYear, int currentMonth){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		return cashbookMapper.selectCashbookListByMonth(map);
	}
	
	public Cashbook getCashbookById(int cashbookId) {
		return cashbookMapper.selectCashbookById(cashbookId);
	}
	
	public int updateCashbook(Cashbook cashbook) {
		return cashbookMapper.updateCashbook(cashbook);
	}
	
	public int deleteCashbook(int cashbookId) {
		return cashbookMapper.deleteCashbook(cashbookId);
	}
}
