package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;
import kr.co.gdu.cash.vo.Cashbook;

@RestController
public class ChartRestController {
	@Autowired private ChartRestService chartRestService;
	
	@GetMapping("/totalOfMonthByYear/{year}")
	public Map<String, Object> totalOfMonthByYear(@PathVariable(name="year") int year){
		return chartRestService.getTotalOfMonthByYear(year); // @RestController 
	}
	
	@GetMapping("/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(
			@PathVariable(name="year") int year){
		System.out.println(year);
		return chartRestService.getTotalOutAndInByYear(year);
	}
	
	@GetMapping("/totalOfInOfMonthByYear/{year}")
	public Map<String, Object> totalOfInOfMonthByYear(@PathVariable(name="year") int year){
		return chartRestService.getTotalOfInOfMonthByYear(year); // @RestController 
	}
	
	@GetMapping("/totalOfCategoryByYear/{year}")
	public Map<String, Object> totalOfCategoryByYear(@PathVariable(name="year") int year){
		return chartRestService.getTotalOfCategoryByYear(year); // @RestController 
	}
	
	@GetMapping("/totalOfInCategoryByYear/{year}")
	public Map<String, Object> totalOfInCategoryByYear(@PathVariable(name="year") int year){
		return chartRestService.getTotalOfInCategoryByYear(year); // @RestController 
	}
	
	@GetMapping("/totalOfInOutByYear/{year}")
	public Map<String, Object> totalOfInOutByYear(@PathVariable(name="year") int year){
		return chartRestService.getTotalOfInOutByYear(year);
	}
}
