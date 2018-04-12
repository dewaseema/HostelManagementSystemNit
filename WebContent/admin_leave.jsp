<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="adminHeader.jsp"%>
<%
	if (session.getAttribute("adminLoginCheck") == null
			|| (Boolean) session.getAttribute("adminLoginCheck") == false) {
		response.sendRedirect("admin_login.jsp");
	}
%>

<style>
.modal {
	padding-top: 8%;
}
</style>

<%
	AdminDao aDao = DaoFactory.getAdminDao();
	StudentDao studentDao = DaoFactory.getStudentDao();
	Student student = null;
	List<Leave> allLeaveRequest = aDao.getAllLeave();
%>
<%
	boolean deleted = false;
	boolean approved = false;
	if (session.getAttribute("deleted") != null) {
		deleted = (Boolean) session.getAttribute("deleted");
	}
	if (session.getAttribute("approved") != null) {
		approved = (Boolean) session.getAttribute("approved");
	}
%>

<%
	if (deleted == true) {
%>
<div class="alert alert-danger alert-dismissable fade in">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<h4>
		<strong>Deleted!</strong>
	</h4>
</div>
<%
	}
%>
<%
	if (approved == true) {
%>
<div class="alert alert-success alert-dismissable fade in">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<h4>
		<strong>Approved!</strong>
	</h4>
</div>
<%
	}

	session.removeAttribute("deleted");
	session.removeAttribute("approved");
%>

<!-- CONTAINER START -->
<div class="container container-sm border" style="">
	<button class=""
		style="margin-left: 20px; font-size: 30px; cursor: pointer"
		onclick="openNav()">&#9776;&nbsp;Menu</button>
	<%@include file="admin_side_menu.jsp"%>

	<!-- LEAVE -->
	<div class="container">
		<header class="container announcement-sm" style="text-align: center;">
			<h1 style="font-family: 'Open Sans', sans-serif;">LEAVE REQUESTS</h1>
		</header>
		<hr>
		<div class="panel-group" id="accordion">
			<div class="well">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<th class="col-md-1">LEAVE ID</th>
						<th class="col-md-1">HOSTEL ID</th>
						<th class="col-md-1">DATE</th>
						<th class="col-md-1">FROM DATE</th>
						<th class="col-md-1">TO DATE</th>
						<th class="col-md-4">REASON</th>
						<th class="col-md-1">APPROVE BY PARENT</th>
						<th class="col-md-1">APPROVE</th>
						<th class="col-md-1">DELETE</th>
					</thead>
					<tbody>
						<%
							for (Leave leave : allLeaveRequest) {
						%>
						<tr>
							<td><%=leave.getLeaveId()%></td>
							<td><%=leave.getHostelId()%></td>
							<td><%=leave.getEntryDate()%></td>
							<td><%=leave.getFromDate()%></td>
							<td><%=leave.getToDate()%></td>
							<td><%=leave.getReason()%>&nbsp; <!-- Trigger the modal with a button -->
								<button type="button" class="btn btn-default"
									data-toggle="modal" style="float: right;"
									data-target="#<%="A" + leave.getLeaveId()%>">VIEW</button></td>
							<td>
								<%
									if (leave.getApprovedByParent().equalsIgnoreCase("yes")) {
								%>
								<button type="button" class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-ok"></span> Ok
								</button> <%
 	} else if (leave.getApprovedByParent().equalsIgnoreCase("r")) {
 %>
								<button type="button" class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-remove"></span> Rejected
								</button> <%
 	} else {
 %>
								<button type="button" class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-remove"></span> NO
								</button> <%
 	}
 %>
							</td>
							<td>
								<%
									if (leave.getApprovedByAdmin().equalsIgnoreCase("yes")) {
								%>
								<button type="button" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-ok"></span> Ok
								</button> <%
 	} else {
 %>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#approve"
									onclick="approve(this.value)" value="<%=leave.getLeaveId()%>">APPROVE</button>
								<%
									}
								%> <input id="<%="leave" + leave.getLeaveId()%>" type="hidden"
								value="<%=leave.getLeaveId()%>" name="leaveId" /> <input
								id="<%="hostel" + leave.getLeaveId()%>" type="hidden"
								value="<%=leave.getHostelId()%>" name="hostelId" />
							</td>
							<td><a href="DeleteLeave?leaveId=<%=leave.getLeaveId()%>"><button
										type="button" class="btn btn-danger">DELETE</button></a></td>
							<%
								student = studentDao.get(leave.getHostelId());
							%>

							<!-- Modal -->
							<div id="<%="A" + leave.getLeaveId()%>" class="modal fade"
								role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">
												Student Name: &nbsp;&nbsp;<b><%=student.getName()%></b>
											</h4>
										</div>
										<div class="modal-body">
											<p><%=leave.getReason()%></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>


						</tr>
						<%
							}
						%>
					</tbody>


					<!-- modal start -->
					<div id="approve" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Approve Leave Request</h4>
								</div>
								<div class="modal-body">
									<p>
									<form class="form-signin" action="ApproveLeave" method="post">
										<div class="form-group">
											<label for="usr">Subject:</label>
											<%
												String subject = "Leave Request Approved";
											%>
											<input type="text" class="form-control" id="subject"
												name="username" required="" autofocus=""
												value="<%=subject%>" />
										</div>
										<div class="form-group">
											<label for="usr">Message:</label>
											<%
												String message = "Your leave request has been approved. Check your account!";
											%>
											<input type="text" class="form-control" id="message"
												name="message" required="" autofocus=""
												value="<%=message%>" />
										</div>
										<input type="hidden" name="leaveId" id="leaveId" value="" />
										<input type="hidden" name="hostelId" id="hostelId" value="" />
										<br>
										<button type="submit" class="btn btn-success">
											Approve &nbsp<span class="glyphicon glyphicon-ok"></span>
										</button>
									</form>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>

					<!-- modal end -->



				</table>
			</div>


		</div>
		<!-- LEAVE END-->

	</div>
</div>
<!-- CONTAINER END -->
<script src"js/main_javascript.js" type="text/javascript">
	function approve(n) {

		var hostelId = document.getElementById("leave" + n).value;
		var leaveId = document.getElementById("hostel" + n).value;
		document.getElementById("leaveId").value = leaveId;
		document.getElementById("hostelId").value = hostelId;
		console.log(n);
		console.log(hostelId);
		console.log(leaveId);
	}
</script>
<%@include file="footer.jsp"%>
