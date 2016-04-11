<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<link type="text/css" rel="stylesheet" href="Presidents.css" />-->

<link type="text/css" rel="stylesheet" href="reset.css" />
<link type="text/css" rel="stylesheet" href="stylesheet.css" />


<link href='https://fonts.googleapis.com/css?family=PT+Serif+Caption'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>

<title>Presidents</title>
</head>
<body>
	<header>
	<h1>Presidents Web App</h1>
	<h4>Utilizes Java, JSTL, Servlet</h4>

	</header>

	<div class="wrapper">
		<!-- first 1/3 -->
		<div class="third">
			<h2>Pick President by Term</h2>
			<div class="inner-box">




				<div class="content-holder">
					<h5>Enter a Term Number</h5>
						<form action="Presidents" method="GET">
							<input class="input-feild" type="text" name="term"
								placeholder="term" /> <input type="submit" value="Go!" />
						</form>
						<h1>Your search history:</h1><br>
					<c:forEach var="president" items="${presidents}">
						<c:if test="${! empty(president)}">
<span class="pres">President # ${president.termNumber}:&nbsp;${president.firstName}&nbsp;${president.lastName}</span>
							<br>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- second 1/3 -->

		</div><div class="third">

			<h2>President Image</h2>
			<div class="inner-box">


				<div class="content-holder">
					<form action="Presidents" method="GET">
						<button class="change-pres-buttons" type="submit"
							name="changePresident" value="Previous">Previous</button>
						<button class="change-pres-buttons" type="submit"
							name="changePresident" value="next">Next</button>
					</form>
	
					<c:choose><c:when test="${empty(presidents) }">
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Seal_of_the_President_of_the_United_States.svg/200px-Seal_of_the_President_of_the_United_States.svg.png">
					</c:when>
					<c:otherwise>
						<img src="${imageURL}" />
					</c:otherwise>
					</c:choose>
					<h3>${presidentForSlideshow.firstName}
						${presidentForSlideshow.lastName }
						<h3>
				</div>
			</div>

			<!-- third 1/3 -->
		</div><div class="third">
			<h2>List Presidents by Party</h2>
			<div class="inner-box">
				<div class="content-holder">
					<form action="Presidents" method="GET">

						<h5>Display all past presidents in a party</h5>

						<h5>Select A Party</h5>
						<select class="input-feild" name="party">
							<option></option>
							<option value="Democrat">Democrat</option>
							<option value="Republican">Republican</option>
							<option value="Whig">Whig</option>
							<option value="Independent">Independent</option>
							<option value="Federalist">Federalist</option>
							<option value="Democratic-Republican">Democratic-Republican</option>
							<input type="submit" value="GO!" />

						</select> <br>

					</form>

					<c:if test="${!empty(partyToDisplay)}">
The presidents in the ${partyToDisplay} party:
        </c:if>
					<br>
					<c:forEach var="presByParty" items="${fullPresidentList}">
						<c:if
							test="${! empty(presByParty) && partyToDisplay.equals(presByParty.party)}">

President # ${presByParty.termNumber}: ${presByParty.firstName} ${presByParty.lastName}<br>
						</c:if>
					</c:forEach>


				</div>

			</div>

		</div>


	</div>

</body>


<footer>
<p>By Kaylee McHugh, Alex Peterson, and Chris
	Rioux</p>
</footer>

</body>
</html>
