<%-- 
    Document   : AddStudent
    Created on : Aug 17, 2013, 8:36:20 PM
    Author     : SeiJee
--%>
<%@include file="_initSession.jsp" %>
<%@page import="java.util.Locale"%>
<%@page import="objectClasses.people.Person"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="objectClasses.people.Student"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_head.jsp" %>
		<script>
			function addField(){
				$st = document.getElementById("studentTable");
				var start = parseInt(document.getElementById("start").value);
				var last = parseInt(document.getElementById("total").value)+start;
				$clgid = document.getElementById("collegeId").value;
				$branch = document.getElementById("branch").value;
				$prefix = document.getElementById("prefix").value;
				for ($i=start; $i<=last; $i++){
					$count = $st.rows.length;
					$row = $st.insertRow($count);
					
					if ($i<10){$enrol = "00"+$i;}
					else if ($i<100){$enrol = "0"+$i;}
					else if ($i<1000){$enrol = ""+$i;}
					$enrol = $clgid+$branch+$prefix+$enrol;
					$x=0;
					$check = $row.insertCell($x++);
					$check.innerHTML = "<input type='checkbox' value='OFF' />";
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="student_ids" value="'+$enrol+'" size="25" readonly="readonly" /></td>'
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="fnames" size="30" placeholder="First Name"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="lnames" size="30" placeholder="Last Name"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="mobile" size="10" placeholder="Mobile Number"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="email" value="" size="60" placeholder="email"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="father" value="dad" size="40" placeholder="father"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="mother" value="mom" size="40" placeholder="mother"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="category" value="general" size="40" placeholder="category"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="batch" value="2014" size="40" placeholder="batch"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="semester" value="6" size="40" placeholder="semester"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="branch" value="CS" size="40" placeholder="branch"/></td>';
				}
			}
			
			function deleteRows(){
				$st = document.getElementById("studentTable");
				try {
            var table = document.getElementById("studentTable");
            var rowCount = table.rows.length;
 
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
 
 
            }
            }catch(e) {
                alert(e);
            }
				
			}
		</script>
    </head>
	
    <body>
	<% List<Student> s = (List<Student>)request.getAttribute("newStudents");%>
<%if (s!=null){%>
		
	<div class="container-fluid">
		<form action="StudentBatch.New" method="POST">
			<table id="studentTable" border="0">
			
<% 
Collections.sort(s,Student.c);
for (Student st : s) { %>
<tr>
<td><b><%= st.getId() %></b><input type="text" name="id"	value="<%= st.getId() %>" class="hide"		readonly="readonly"/></td>
<td><input type="text" name="name"			value="<%= st.getName() %>"		size="35" placeholder="Name"/></td>
<td><input type="text" name="father_name"		value="<%= (st.getFather_name()!=null)? st.getFather_name():"" %>"	size="35"  placeholder="father"/></td>
<td><input type="text" name="mother_name"		value="<%= (st.getMother_name()!=null)? st.getMother_name():"" %>"	size="35"  placeholder="mother"/></td>
<td><input type="text" name="gender"		value="<%= (st.getGender()!=null)? st.getGender():"" %>"		size="35"	placeholder="Gender"/></td>
<td><input type="text" name="dob"			
	value="<%= st.getDOB().get(Calendar.YEAR)%>-<%= st.getDOB().getDisplayName(Calendar.MONTH,Calendar.SHORT,Locale.ENGLISH)%>-<%= st.getDOB().get(Calendar.DAY_OF_MONTH)%>"size="10" placeholder="DOB"/></td>
<td><input type="text" name="bloodgroup"		value="<%= (st.getBloodgroup()!=null)? st.getBloodgroup():"NA" %>"	size="35" placeholder="branch"/></td>
<td><input type="text" name="email"		value="<%= (st.getEmail()!=null)? st.getEmail():"" %>"	size="35" placeholder="email"/></td>
<td><input type="text" name="mobile"		value="<%= (st.getMobile())!=null? st.getMobile():"" %>"		size="35"	 placeholder="Mobile Number"/></td>
<td><textarea type="text" name="p_address" cols="22" rows="4"	placeholder="Address"/><%= (st.getP_address()!=null)? st.getP_address():"" %></textarea></td>
<td><textarea type="text" name="r_address" cols="22" rows="4"	placeholder="Residential Address"/><%= (st.getR_address()!=null)? st.getR_address():"" %></textarea></td>
<td><input type="text" name="category"	value="<%= (st.getCategory()!=null)? st.getCategory():"" %>"	size="35" placeholder="category"/></td>
<td><input type="text" name="batch"		value="<%= (st.getBatch()!=null)? st.getBatch():"" %>"	size="35" placeholder="batch"/></td>
<td><input type="text" name="semester"	value="<%= (st.getSemester()!=0)?st.getSemester():"0" %>" size="35" placeholder="semester"/></td>
<td><input type="text" name="branch"		value="<%= (st.getBranch()!=null)? st.getBranch():"" %>"	size="35" placeholder="branch"/></td>
</tr>
<% } %>
			</table>
			<input type="submit" value="addStudents" name="submit" />
		</form>
	</div>
<%}%>
    </body>
</html>