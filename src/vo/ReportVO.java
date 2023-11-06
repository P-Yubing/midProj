package vo;

public class ReportVO {

	private String reportId;
	private String reportDate;
	private String reportReason;
	private String queId;
	
	public ReportVO() {}
	
	public ReportVO(String reportId, String reportDate, String reportReason, String queId) {
		super();
		this.reportId = reportId;
		this.reportDate = reportDate;
		this.reportReason = reportReason;
		this.queId = queId;
	}

	/**
	 * @return the reportId
	 */
	public String getReportId() {
		return reportId;
	}

	/**
	 * @param reportId the reportId to set
	 */
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	/**
	 * @return the reportDate
	 */
	public String getReportDate() {
		return reportDate;
	}

	/**
	 * @param reportDate the reportDate to set
	 */
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	/**
	 * @return the reportReason
	 */
	public String getReportReason() {
		return reportReason;
	}

	/**
	 * @param reportReason the reportReason to set
	 */
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	/**
	 * @return the queId
	 */
	public String getQueId() {
		return queId;
	}

	/**
	 * @param queId the queId to set
	 */
	public void setQueId(String queId) {
		this.queId = queId;
	}

	@Override
	public String toString() {
		return "ReportVO [reportId=" + reportId + ", reportDate=" + reportDate + ", reportReason=" + reportReason
				+ ", queId=" + queId + "]";
	}
	
	
	
	
	
}
