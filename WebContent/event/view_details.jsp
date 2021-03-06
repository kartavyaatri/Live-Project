<%@page import="com.certification.model.CertificateData"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/style/bootstrap.css">
<link rel="stylesheet" href="../resources/style/font-lato.css">
<link rel="stylesheet" href="../resources/style/font-montserrat.css">
<style>
body {
	background-color: #fcfcfc;
}

td {
	vertical-align: middle;
	font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
	font-size: 15px;
	font-style: normal;
	font-variant: normal;
	font-weight: bold;
	line-height: 23px;
}

th {
	text-align: center;
	vertical-align: middle;
	font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
	font-size: 17px;
	font-style: italic;
	font-variant: normal;
	font-weight: bold;
	line-height: 23px;
}

h3 {
	font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
	font-size: 20px;
	font-style: normal;
	font-variant: normal;
	font-weight: bolder;
	line-height: 23px;
}

table {
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
}

a {
	font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
	font-size: 17px;
	font-style: normal;
	font-variant: normal;
	font-weight: bold;
	line-height: 23px;
}

.container {
	width: 100%;
}

li.borderless {
	border-bottom: 0 none;
	border-top: none;
}

ul {
	list-style: none;
}

.content:before {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
	display: block;
	background-image: url('../resources/images/DSCN7348.jpg');
	-webkit-filter: brightness(0.8);
	filter: brightness(0.8);
	background-size: cover;
	width: 100%;
	height: 100%;
	-webkit-filter: blur(10px);
	-moz-filter: blur(10px);
	-o-filter: blur(10px);
	-ms-filter: blur(10px);
	filter: blur(10px);
}

.content {
	overflow: visible;
	position: relative;
}

div.transbox {
	margin: 30px;
	background-color: #ffffff;
	border: 0px solid;
	background-color: rgba(255, 255, 255, 0.6);
	width: auto;
	/* For IE8 and earlier */
}

.content p {
	margin: 15px;
	background: rgba(255, 255, 255, 0.3);
	padding: 5px;
	box-shadow: 0 0 5px gray;
}
</style>
</head>
<body>


	<jsp:useBean id="eventDao" class="com.certification.impl.EventIMPL"></jsp:useBean>
	<jsp:useBean id="participantDao"
		class="com.certification.impl.ParticipantIMPL"></jsp:useBean>
	<jsp:useBean id="layoutDao"
		class="com.certification.impl.CertificateIMPL" scope="page"></jsp:useBean>

	<c:set scope="page" var="facID" value="F0001"></c:set>
	<c:set scope="page" var="data"
		value="${layoutDao.getCertificateDataByEventID(param.eventID)}"></c:set>



	<div class="container content">
		<div class="row">

			<div class="col-md-3 transbox">
				<h3>Logged in as: Faculty(${facID})</h3>
				<h3>View Details</h3>

				<table class="table">
					<tr>
						<th>Event Name</th>
						<td>${data.eventName}</td>
					</tr>
					<tr>
						<th>Event In-charge</th>
						<td>${data.facultyIncharge}</td>
					</tr>
					<tr>
						<th>Event Started On</th>
						<td>${data.dateStarted}</td>
					</tr>
					<tr>

						<th>Event Duration<br>(no of days)
						</th>
						<td>${data.noDays}</td>
					</tr>
					<tr>
						<th>Event Ended on</th>
						<td><c:if test="${empty data.dateEnded}">Not ended yet</c:if>
							<c:if test="${not empty data.dateEnded}">${data.event.dateEnded}</c:if>
						</td>
					</tr>
					<tr>
						<th>Event Scrap</th>
						<td><c:if test="${data.scrap}">Yes</c:if> <c:if
								test="${not data.scrap}">No</c:if></td>
					</tr>
					<tr>
						<th>Certificate Image Name</th>
						<td>${data.certificateImageLocation}</td>
					</tr>
					<tr>
						<th>Property 1 Coordinates:</th>
						<td>(${data.property1abscissa}, ${data.property1ordinate})</td>
					</tr>
					<tr>
						<td>
							<button class="btn btn-default" onclick="goBack()">&laquo;
								Go Back</button>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="col-md-9">
				<img style="width: 1280px; height: 905px;"
					src="${pageContext.request.contextPath}/images/${data.certificateImageLocation}"
					alt="Image">

			</div>
		</div>
	</div>

	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>