<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.iberry.login.bean.contactBook" %>
<%@page import="com.iberrylogin.dao.ContactBookDAO" %>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>PhoneBook | Form</title>
<link href="<%=baseURL%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=baseURL%>css/animate.css" rel="stylesheet">
<link href="<%=baseURL%>css/style.css" rel="stylesheet">
<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<%
boolean searchdata = true;
boolean logout= true;
boolean newData = true;
ContactBookDAO rs = new ContactBookDAO();
int id1 = 0;
contactBook pdetails=new contactBook();

%>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg"
			style="min-height: 418px; margin-left: auto;">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Phone Book</h5>

						</div>
						<div class="ibox-content">
							<form class="form-horizontal" method="POST"
								action="<%=baseURL%>create_update_personaldetail">
								
								<div class="form-group">
									<label class="col-lg-2 control-label">Name</label> <input
										type="hidden" name="newData" value="<%=newData%>"> <input
										type="hidden" name="editId" value="<%=id1%>">
									<div class="col-lg-4">
										<input type="text" placeholder="Name" name="name"
											value="<%=!newData ? pdetails.getName() : ""%>"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Tel No</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" name="telno"
											value="<%=!newData ? pdetails.getTelno() : ""%>"
											data-mask="9999999999" placeholder=""> <span
											class="help-block">9999999999</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">DOB</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" data-mask="99/99/9999"
											value="<%=!newData ? pdetails.getDob() : ""%>" name="dob"
											placeholder=""> <span class="help-block">dd/mm/yyyy</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Address</label>

									<div class="col-lg-6">
										<input type="text" placeholder="Address" name="address"
											value="<%=!newData ? pdetails.getAddress() : ""%>"
											class="form-control">
									</div>
								</div>
							
									<div class="form-group">
										<label class="col-lg-2 control-label">Website</label>

										<div class="col-lg-4">
											<input type="text" placeholder="Url"
												value="<%=!newData ? pdetails.getWebsite() : ""%>"
												name="website" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Company Name</label>

										<div class="col-lg-4">
											<input type="text" placeholder="company name"
												value="<%=!newData ? pdetails.getCompanyName() : ""%>"
												name="companyname" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Landline No</label>

										<div class="col-lg-4">
											<input type="text" placeholder="landlineno"
												value="<%=!newData ? pdetails.getLandlineno() : ""%>"
												name="landlineno" class="form-control">
										</div>
									</div>
								</div>

									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-sm btn-white" type="submit">Add</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
						
 
		<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>List Display</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>			
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
								<tbody>
<%List<contactBook> data =(List<contactBook>)request.getAttribute("Newdata");
 if (data!=null){
			for (contactBook pd : data) {
               %>						
										<tr class="gradeX">
											<td><%=pd.getName()%></td>
											<td><%=pd.getTelno()%></td>
											<td><%=pd.getDob()%></td>
											<td class="center"><%=pd.getAddress()%></td>
											
											<td class="center"><%=pd.getWebsite() != "null" ? pd.getWebsite() : "-"%></td>
											<td class="center"><%=pd.getCompanyName() != "null" ? pd.getCompanyName() : "-"%></td>
			                                <td class="center"><%=pd.getLandlineno() + "" != "0" ? pd.getLandlineno() : "-"%></td>
											<th><a
												href="<%=baseURL%>edit_contact.jsp?editId=<%=pd.getId()%>"
												id1="<%=pd.getId()%>" class="btn btn-primary btn-xs">Edit</a></th>
											<th><a
												href="<%=baseURL%>create_update_personaldetail?deleteId=<%=pd.getId()%>&delData=true"
												id="<%=pd.getId()%>" class="btn btn-primary btn-xs">Delete</a></th>
										</tr>
										

										<%
											}
 }
										%>
										
									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Phone Book</h5>
						</div>
						<div class="ibox-content">
							<form class="form-horizontal" method="POST"
								action="<%=baseURL%>create_update_personaldetail">
								<input
										type="hidden" name="searchdata" value="<%=searchdata%>">
								<p>Search.</p>
								<div class="form-group">
									<label class="col-lg-2 control-label">Name</label>
									<div class="col-lg-4">
										<input type="text" placeholder="Name" name="name" value=""
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Tel No</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" name="telno" value=""
											data-mask="9999999999" placeholder=""> <span
											class="help-block">9999999999</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
									
										<button class="btn btn-sm btn-white" type="submit"  >Search</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


			<%
			List<contactBook> searchpdetails = new ArrayList();
			searchpdetails = (List<contactBook>)request.getAttribute("searchDetails");
			if(searchpdetails!=null)
			{ 
			
			%>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Search</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>
											
										
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>

										</tr>
									</thead>
									<tbody>
										<% for(contactBook pd :searchpdetails){ %>
										<tr class="gradeX">
											<td><%=pd.getName()%></td>
											<td><%=pd.getTelno()%></td>
											<td><%=pd.getDob()%></td>
											<td class="center"><%=pd.getAddress()%></td>
											
											<td class="center"><%=pd.getWebsite() != "null" ? pd.getWebsite() : "-"%></td>
											<td class="center"><%=pd.getCompanyName() != "null" ? pd.getCompanyName() : "-"%></td>
											<td class="center"><%=pd.getLandlineno() + "" != "0" ? pd.getLandlineno() : "-"%></td>

										</tr>
										<%
										}
										} 
										%>

									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>
		<form class="form-horizontal" method="POST"
								action="<%=baseURL%>Logout">
		<div class="col-lg-offset-2 col-lg-10">
									
										<button class="btn btn-sm btn-white" type="submit" >Logout</button>
									</div>	
</form>
		

	<!-- Mainly scripts -->

	<!-- Custom and plugin javascript -->
	

	<!-- MENU -->
	

	<!-- Input Mask-->
	

	<script src="js/plugins/dataTables/datatables.min.js"></script>


	<script>
		$(document)
				.ready(
						function() {

							$(':radio')
									.change(
											function(event) {

												if ($("#set_visible").css(
														"display") === 'none') {

													$("#set_visible").css(
															"display", "block");
												} else {
													$("#set_visible").css(
															"display", "none");
												}

											});

							$('.dataTables-example')
									.DataTable(
											{
												pageLength : 25,
												responsive : true,
												dom : '<"html5buttons"B>lTfgitp',
												buttons : [
														{
															extend : 'copy'
														},
														{
															extend : 'csv'
														},
														{
															extend : 'excel',
															title : 'ExampleFile'
														},
														{
															extend : 'pdf',
															title : 'ExampleFile'
														},

														{
															extend : 'print',
															customize : function(
																	win) {
																$(
																		win.document.body)
																		.addClass(
																				'white-bg');
																$(
																		win.document.body)
																		.css(
																				'font-size',
																				'10px');

																$(
																		win.document.body)
																		.find(
																				'table')
																		.addClass(
																				'compact')
																		.css(
																				'font-size',
																				'inherit');
															}
														} ]

											});

						});
	</script>
</body>
</html>