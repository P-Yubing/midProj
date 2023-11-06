package vo;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class NoticeVO {
  
	private String notiId;
	private String notiTitle;
	private String notiContent;
	private String notiDate;
	private String userId;
	private String notiCount;
    private List<NoticeVO> noticeList;
    
    
    
	public NoticeVO() {}
	

	
	public NoticeVO(String notiId, String notiTitle, String notiContent, String notiDate, String userId,
			String notiCount) {
		super();
		this.notiId = notiId;
		this.notiTitle = notiTitle;
		this.notiContent = notiContent;
		this.notiDate = notiDate;
		this.userId = userId;
		this.notiCount = notiCount;
	}
	
	public NoticeVO(String notiId, String notiTitle, String notiContent, String userId) {
		super();
		this.notiId = notiId;
		this.notiTitle = notiTitle;
		this.notiContent = notiContent;
		this.userId = userId;
	}

	
	
	/**
	 * @return the notiCount
	 */
	public String getNotiCount() {
		return notiCount;
	}

	/**
	 * @param notiCount the notiCount to set
	 */
	public void setNotiCount(String notiCount) {
		this.notiCount = notiCount;
	}

	/**
	 * @return the notiId
	 */
	public String getNotiId() {
		return notiId;
	}
	/**
	 * @param notiId the notiId to set
	 */
	public void setNotiId(String notiId) {
		this.notiId = notiId;
	}
	/**
	 * @return the notiTitle
	 */
	public String getNotiTitle() {
		return notiTitle;
	}
	/**
	 * @param notiTitle the notiTitle to set
	 */
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	/**
	 * @return the notiContent
	 */
	public String getNotiContent() {
		return notiContent;
	}
	/**
	 * @param notiContent the notiContent to set
	 */
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	
	/**
	 * @return the notiDate
	 */
	public String getNotiDate() {
		return notiDate;
	}



	/**
	 * @param notiDate the notiDate to set
	 */
	public void setNotiDate(String notiDate) {
		this.notiDate = notiDate;
	}



	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notiId=" + notiId + ", notiTitle=" + notiTitle + ", notiContent=" + notiContent
				+ ", notiDate=" + notiDate + ", userId=" + userId + ", notiCount=" + notiCount + "]";
	}


	public void setNoticeList(List<NoticeVO> noticeList) {
        this.noticeList = noticeList;
    }

    public List<NoticeVO> getNoticeList() {
        return noticeList;
    }
	
}
