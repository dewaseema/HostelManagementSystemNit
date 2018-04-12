<style>
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 9999 !important;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Admin_Mess_Menu_Controller?user=0&admin=1">MESS MENU</a>
  <a href="adminNotice.jsp">NOTICE</a>
  <a href="view_complain.jsp">COMPLAIN</a>
  <a href="admin_parent_query.jsp">PARENT QUERY</a>
  <a href="ShowStudentController">STUDENT DETAILS</a>
  <a href="student_attendance.jsp">ATTENDANCE</a>
  <a href="admin_leave.jsp">LEAVE REQUEST</a>
  <a href="view_student1.jsp">SELECTION PROCESS</a>
  <a href="view_Selected.jsp">SELECTED STUDENT</a>
  <a href="view_worker.jsp">WORKER DETAILS</a>
  <a href="WorkerAttendance.jsp">ATTENDANCE</a>
  <a href="Worker_form.jsp">WORKER FORM</a>
</div>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "28%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>