package service;

import java.util.List;

import dao.IReportDao;
import dao.ReportDaoImpl;
import vo.ReportVO;

public class ReportServiceImpl implements IReportService{

	private IReportDao reportDao;
	private static IReportService reportService;
	
	
	public ReportServiceImpl() {
		
		reportDao = ReportDaoImpl.getInstance();
		
	}
	
	
	public static IReportService getInstance() {
		if(reportService == null)
			reportService = new ReportServiceImpl();
		return reportService;
	}


	@Override
	public ReportVO getReportId(String reportId) {
		return reportDao.getReportId(reportId);
	}


	@Override
	public List<ReportVO> reportList() {
		return reportDao.reportList();
	}


	@Override
	public List<ReportVO> getReportsByQuestionId(String queId) {
		return (List<ReportVO>) reportDao.getReportId(queId);
	}


	@Override
	public int doReport(ReportVO reportVO) {
		return reportDao.doReport(reportVO);
	}

}
