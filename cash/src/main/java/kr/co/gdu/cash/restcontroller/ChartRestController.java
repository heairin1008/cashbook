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
	
	@GetMapping("/totalOutAndInByYear")
	public Map<String, Object> totalOutAndInByYear(@PathVariable(name="year") int year){
		return chartRestService.selectTotalOutAndInByYear(year);
	}
	
	@GetMapping("/year")
	public List<Cashbook> cashbookYear() {
		List<Cashbook> year = chartRestService.selectCashbookYear();
		return year;
	}
}
