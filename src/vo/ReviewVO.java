package vo;

public class ReviewVO {
    private String payId;
    private String reviewContent;
    private String reviewDate;
    private String reviewStar;

    // 기본 생성자
    public ReviewVO() {
    }

	public ReviewVO(String payId, String reviewContent, String reviewStar) {
		super();
		this.payId = payId;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
	}

	
	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	@Override
	public String toString() {
		return "ReviewVO [payId=" + payId + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", reviewStar=" + reviewStar + "]";
	}

    
}
