package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface ChartRestMapper {
	public Map<String, Object> selectTotalOfMonthByYear(int year);
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	public Map<String, Object> selectTotalOfInOfMonthByYear(int year);
	public Map<String, Object> selectTotalOfCategoryByYear(int year);
}
