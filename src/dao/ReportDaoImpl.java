package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import common.MyBatisDao;
import config.MyBatisUtil;
import service.IReportService;
import vo.QuestionVO;
import vo.ReportVO;

public class ReportDaoImpl extends MyBatisDao implements IReportDao{

	private static IReportDao reportDao;

	public ReportDaoImpl() {
	}

	public static IReportDao getInstance() {
		if (reportDao == null) {
			reportDao = new ReportDaoImpl();
		}
		return reportDao;
	}


	@Override
	public ReportVO getReportId(String reportId) {
		
		ReportVO reportVO = selectOne("report.insertReport", reportId);
	       
		return reportVO;
	}




	@Override
	public List<ReportVO> reportList() {
		
	List<ReportVO> reportList = new ArrayList<ReportVO>();
        
	reportList = selectList("report.listReport");
	         
	       return reportList;
	}




	@Override
	public int doReport(ReportVO reportVO) {
		
		int cnt = insert("report.insertReport", reportVO);
		
		return cnt;
		}
	
	}


