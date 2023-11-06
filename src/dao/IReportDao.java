package dao;

import java.util.List;

import vo.ReportVO;

public interface IReportDao {

	public ReportVO getReportId(String reportId);

	public List<ReportVO> reportList();

	public int doReport(ReportVO reportVO);
	
}
