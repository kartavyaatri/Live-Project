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

td {padding-left:20px;
padding-bottom:20px;
	vertical-align: middle;
	text-align: middle;
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

	<c:set scope="page"
		value="${participantDao.getAwardedListByEventID(param.eventID)}"
		var="list"></c:set>
	<c:set scope="page" value="${participantDao.getAllParticipant()}"
		var="allParticipants"></c:set>

	<div class="container content">
		<div class="row">
			<div class="col-md-3 transbox">
				<h3>Logged in as: Faculty(${facID})</h3>
				<h3>View Participants</h3>
				<table>
					<tr>
						<td>Participant ID</td>
						<td>Participant Name</td>
						<td>Participant Institution</td>
						<td>Rank</td>
						<td>isDownloadable</td>
					</tr>
					<c:forEach var="awarded" items="${list}">
						<tr>
							<td><c:out value="${awarded.studentId}"></c:out></td>
							<c:forEach var="participant" items="${allParticipants}">
								<c:if test="${awarded.studentId eq participant.participantId}">
									<td><c:out value="${participant.name}"></c:out></td>
									<td><c:out value="${participant.institution}"></c:out></td>
								</c:if>
							</c:forEach>
							<td><c:if test="${empty awarded.rank}">
									<c:out value="Not Mentioned"></c:out>
								</c:if>
								<c:if test="${not empty awarded.rank}">
									<c:out value="${awarded.rank}"></c:out>	
								</c:if>
								
							</td>
							<td><c:out value="${awarded.downloadable}"></c:out></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>