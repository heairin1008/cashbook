package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.NewNoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NewNoticeService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String PATH = "D:\\sts-work\\cashbook\\maven.1606195928233\\cash\\src\\main\\webapp\\upload";
	@Autowired
	private NewNoticeMapper newNoticeMapper;
	private NoticefileMapper noticefileMapper;
	
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		// int currentPage, int rowPerPage -> beginRow
		// noticeMapper 메서드를 호출
		int beginRow = (currentPage-1) * rowPerPage;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice> noticeListByPage = newNoticeMapper.selectNoticeListByPage(map);
		return noticeListByPage;
	}
	
	public int getCountList() {
		return newNoticeMapper.selectCountList();
	}
	
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		newNoticeMapper.addNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefileList() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int point = mf.getOriginalFilename().lastIndexOf("."); // 확장자명
				String ext = mf.getOriginalFilename().substring(point);
				nf.setNoticefileName(PATH+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				logger.debug("for문:"+nf);
				
				try {
					mf.transferTo(new File(PATH+filename));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile !=null) {
			for(Noticefile nf: noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}	
		}
	}
	
	
}
