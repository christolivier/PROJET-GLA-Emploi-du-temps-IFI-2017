<%@ page contentType="application/json"%>
<%=getEvents(request)%>
<%@ page import="com.dhtmlx.planner.*,com.devops.emploi.*"%>

<%!String getEvents(HttpServletRequest request) throws Exception {
		EmploiManager evs = new EmploiManager(request);
		return evs.run();
	}%>