package kr.co.gdu.cash.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.ChartRestMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class ChartRestService {
	@Autowired private ChartRestMapper chartRestMapper;
	public Map<String, Object> getTotalOfMonthByYear(int year){
		return chartRestMapper.selectTotalOfMonthByYear(year);
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year){
		return chartRestMapper.selectTotalOutAndInByYear(year);
	}
	
	public Map<String, Object> getTotalOfInOfMonthByYear(int year){
		return chartRestMapper.selectTotalOfInOfMonthByYear(year);
	}
	
	public Map<String, Object> getTotalOfCategoryByYear(int year){
		return chartRestMapper.selectTotalOfCategoryByYear(year);
	}
}
