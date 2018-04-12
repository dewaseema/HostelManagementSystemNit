package sis.com.bo;

import java.util.Date;

public class Leave {
	private long leaveId;
	private long hostelId;
	private Date fromDate;
	private Date toDate;
	private String subject;
	private String reason;
	private Date entryDate;
	
	private String seenByStudent;
	private String seenByAdmin;
	private String seenByParent;
	
	private String approvedByAdmin;//YES NO REJECTED	
	private String approvedByParent;
	
	private String deletedByAdmin;
	private String deletedByParent;
	private String deletedByStudent;
	
	private String sendToStudentEmail;//YES OR NO STATUS  new 
	private Date sendToStudentEmailTime;//email send time  new 
	
	
	public long getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(long leaveId) {
		this.leaveId = leaveId;
	}
	public long getHostelId() {
		return hostelId;
	}
	public void setHostelId(long hostelId) {
		this.hostelId = hostelId;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public String getSeenByStudent() {
		return seenByStudent;
	}
	public void setSeenByStudent(String seenByStudent) {
		this.seenByStudent = seenByStudent;
	}
	public String getSeenByAdmin() {
		return seenByAdmin;
	}
	public void setSeenByAdmin(String seenByAdmin) {
		this.seenByAdmin = seenByAdmin;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSeenByParent() {
		return seenByParent;
	}
	public void setSeenByParent(String seenByParent) {
		this.seenByParent = seenByParent;
	}
	public String getDeletedByAdmin() {
		return deletedByAdmin;
	}
	public void setDeletedByAdmin(String deletedByAdmin) {
		this.deletedByAdmin = deletedByAdmin;
	}
	public String getDeletedByParent() {
		return deletedByParent;
	}
	public void setDeletedByParent(String deletedByParent) {
		this.deletedByParent = deletedByParent;
	}
	public String getApprovedByAdmin() {
		return approvedByAdmin;
	}
	public void setApprovedByAdmin(String approvedByAdmin) {
		this.approvedByAdmin = approvedByAdmin;
	}
	public String getApprovedByParent() {
		return approvedByParent;
	}
	public void setApprovedByParent(String approvedByParent) {
		this.approvedByParent = approvedByParent;
	}
	public String getDeletedByStudent() {
		return deletedByStudent;
	}
	public void setDeletedByStudent(String deletedByStudent) {
		this.deletedByStudent = deletedByStudent;
	}
	public String getSendToStudentEmail() {
		return sendToStudentEmail;
	}
	public void setSendToStudentEmail(String sendToStudentEmail) {
		this.sendToStudentEmail = sendToStudentEmail;
	}
	public Date getSendToStudentEmailTime() {
		return sendToStudentEmailTime;
	}
	public void setSendToStudentEmailTime(Date sendToStudentEmailTime) {
		this.sendToStudentEmailTime = sendToStudentEmailTime;
	}
	
	
	
}//class

