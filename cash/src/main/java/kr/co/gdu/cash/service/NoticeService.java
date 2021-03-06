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

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private static String OS = System.getProperty("os.name").toLowerCase();
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private CommentMapper commentMapper;
	
	// issue : noticeList 호출 중복
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
	
	// 공지사항 목록 페이징
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		// int currentPage, int rowPerPage -> beginRow
		// noticeMapper 메서드를 호출
		int beginRow = (currentPage-1) * rowPerPage;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice> noticeListByPage = noticeMapper.selectNoticeListByPage(map);
		return noticeListByPage;
	}
	
	// 공지사항 입력
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		noticeMapper.addNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int point = mf.getOriginalFilename().lastIndexOf("."); // 확장자명
				String ext = mf.getOriginalFilename().substring(point);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				logger.debug("for문:"+nf);
				System.out.println("for문:"+nf);
				
				// 업로드 경로 or spring에서 쓰는 경로
				// 서버파일의 상대경로 선언
				String rootPath = "";
				
				String attachPath = "";
				
				if ( OS.indexOf("nux") >= 0) { // 서버파일 경로일 경우
		        	rootPath = "/var/lib/tomcat9/webapps/cash/";
		        	attachPath = "upload/";
		        } else { // spring 경로일 경우
		            File file = new File("");
		            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
		            attachPath = "upload\\";
		        }
				
				
				File f = new File(rootPath + attachPath + filename + ext);
				
				try {
					mf.transferTo(f);
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
	
	public Notice getNoticeOne(int noticeId){
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	
	// 공지사항 수정
	public void modifyNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		
		noticeMapper.modifyNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int point = mf.getOriginalFilename().lastIndexOf("."); // 확장자명
				String ext = mf.getOriginalFilename().substring(point);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				logger.debug("for문:"+nf);
				System.out.println("for문:"+nf);
				
				// 업로드 경로 or spring에서 쓰는 경로
				// 서버파일의 상대경로 선언
				String rootPath = "";
				
				String attachPath = "";
				
				if ( OS.indexOf("nux") >= 0) { // 서버파일 경로일 경우
		        	rootPath = "/var/lib/tomcat9/webapps/cash/";
		        	attachPath = "upload/";
		        } else { // spring 경로일 경우
		            File file = new File("");
		            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
		            attachPath = "upload\\";
		        }
				
				
				File f = new File(rootPath + attachPath + filename + ext);
				
				try {
					mf.transferTo(f);
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
	
	// 파일 삭제
	public void removeNoticefileOne(int noticefileId) {
		noticefileMapper.removeNoticefileOne(noticefileId);
	}
	
	// 공지사항 삭제
	public void removeNotice(int noticeId) {
		System.out.println(noticeId);
		List<String> noticefileNameList = noticefileMapper.selectNoticefileNameList(noticeId);
		System.out.println(noticeId);
		
		String rootPath = "";
		
		String attachPath = "";
		
		if ( OS.indexOf("nux") >= 0) {
        	rootPath = "/var/lib/tomcat9/webapps/cash/";
        	attachPath = "upload/";
        } else {
            File file = new File("");
            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
            attachPath = "upload\\";
        }
		
		for(String s : noticefileNameList) {
			File file = new File(rootPath+attachPath+s);
			if(file.exists()) {
				file.delete();
			}
		}
		
		commentMapper.deleteComment(noticeId);
		noticefileMapper.deleteNoticefile(noticeId);
		noticeMapper.removeNotice(noticeId);
	}
	
	public int getCountList() {
		return noticeMapper.selectCountList();
	}
}