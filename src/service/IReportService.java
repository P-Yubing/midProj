package service;

import java.util.List;

import vo.ReportVO;

public interface IReportService {

	public ReportVO getReportId(String reportId);


	public List<ReportVO> reportList();


	public List<ReportVO> getReportsByQuestionId(String queId);
	
	//신고하기-신고 테이블에 저장
	public int doReport(ReportVO reportVO);

}
