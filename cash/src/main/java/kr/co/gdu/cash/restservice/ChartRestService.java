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
	public Map<String, Object> selectTotalOutAndInByYear(int year){
		return chartRestMapper.selectTotalOutAndInByYear(year);
	}
	
	public List<Cashbook> selectCashbookYear() {
		return chartRestMapper.selectCashbookYear();
	}
}
