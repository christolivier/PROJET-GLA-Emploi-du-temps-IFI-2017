<%@page import="com.devops.reglage.EmploiSetting"%>
<%@page import="com.dhtmlx.planner.controls.DHXLocalization"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXRule"%>
<%@page import="com.dhtmlx.planner.controls.DHXFilter"%>
<%@page import="com.dhtmlx.planner.controls.DHXTimelineView"%>
<%@page import="com.dhtmlx.planner.data.DHXDataLoader.DHXDynLoadingMode"%>
<%@page import="com.dhtmlx.planner.controls.DHXAgendaView"%>
<%@page import="com.dhtmlx.planner.api.DHXEventBox"%>

<%@page import="com.dhtmlx.planner.controls.DHXMiniCalendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxMultiselect"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxRadio"%>
<%@page import="com.dhtmlx.planner.controls.DHXMapView"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxRecurringBlock"%>


<%@page import="com.dhtmlx.planner.controls.DHXLightboxCheckbox"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxSelectOption"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxSelect"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxTime"%>

<%@page import="com.dhtmlx.planner.controls.DHXLightboxMiniCalendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxText"%>
<%@page import="com.dhtmlx.planner.extensions.DHXExtension"%>
<%@page import="javax.servlet.http.HttpSession"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div style="
	/* width:95%; */
	max-width:1000px;
	min-height:100px;
	overflow:auto;
	margin:0 auto;
	/* clear:both; */
">

			<div class="planner" id="planner"><%=getPlanner(request)%></div>
			<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*"%>
			<%!String getPlanner(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		int uid = (Integer) session.getAttribute("ssuid");
		EmploiSetting cs = new EmploiSetting();
		DHXPlanner s;

		s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);

		//change calendar skins
		/* String ch3 = cs.skinChange(uid);

		if (ch3.equals("sk1")) {
			s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
			
		} else if (ch3.equals("sk2")) {

			s = new DHXPlanner("./codebase/", DHXSkin.CLASSIC);
		
		} else if (ch3.equals("sk3")) {

			s = new DHXPlanner("./codebase/", DHXSkin.GLOSSY);
		
		} else if (ch3.equals("sk4")) {

		} */
		s.setWidth(1000);
		
		s.setInitialDate(2018, 00, 01);
		s.lightbox.clear();

		//change the language

		String LNG = cs.changeLanguage(uid);

		/* if (LNG.equals("Arabic")) {
			s.localizations.set(DHXLocalization.Arabic);

		} else if (LNG.equals("English")) {
			s.localizations.set(DHXLocalization.English);

		} else if (LNG.equals("French")) {
			s.localizations.set(DHXLocalization.French);

		} else if (LNG.equals("German")) {
			s.localizations.set(DHXLocalization.German);

		} else if (LNG.equals("Greek")) {
			s.localizations.set(DHXLocalization.Greek);

		} else if (LNG.equals("Italian")) {
			s.localizations.set(DHXLocalization.Italian);

		} else if (LNG.equals("Japanese")) {
			s.localizations.set(DHXLocalization.Japanese);

		} else if (LNG.equals("Russian")) {
			s.localizations.set(DHXLocalization.Russian);

		} else if (LNG.equals("Spanish")) {
			s.localizations.set(DHXLocalization.Spanish);

		}
 */
		//add tooltips for events
		s.extensions.add(DHXExtension.TOOLTIP);

		// add event details field
		DHXLightboxText notes = new DHXLightboxText("text", "COURS:");
		notes.setHeight(40);
		s.lightbox.add(notes);

		//set Mini calendar giving time period in the lightbox
		s.lightbox.add(new DHXLightboxMiniCalendar("name", "PERIODE:"));
		//set recurring events in lightbox
		/* s.lightbox.add(new DHXLightboxRecurringBlock("event_length",
				"Recurring")); */
		//set event length in lightbox 
		/* s.lightbox.add(new DHXLightboxTime("time", "Event Length")); */

		//set event colors
		DHXLightboxSelect select = new DHXLightboxSelect("color", "COULEUR:");
		select.addOption(new DHXLightboxSelectOption("", ""));
		select.addOption(new DHXLightboxSelectOption("#FF6699", "ROSE"));
		select.addOption(new DHXLightboxSelectOption("#E6B800", "JAUNE"));
		select.addOption(new DHXLightboxSelectOption("#FF7F00", "ORANGE"));
		select.addOption(new DHXLightboxSelectOption("#FF0000", "ROUGE"));
		select.addOption(new DHXLightboxSelectOption("#76b007", "VERT"));
		select.addOption(new DHXLightboxSelectOption("#1796b0", "BLEU"));
		s.lightbox.add(select);

		//Highlight important emploi
		/* DHXLightboxCheckbox check = new DHXLightboxCheckbox("highlighting","Important Event");
		check.setMapTo("textColor");
		check.setCheckedValue("black");
		s.lightbox.add(check); */

		//Enables autoresizing for the scheduler container

		s.extensions.add(DHXExtension.CONTAINER_AUTORESIZE);

		//Enables the keyboard navigation.

		s.extensions.add(DHXExtension.KEYBOARD_NAVIGATION);

		//export to PDF

		String ch1 = cs.activepdf(uid);
		if (ch1.equals("pdfA")) {

			s.extensions.add(DHXExtension.PDF);
			s.toPDF();
		} else {
			s.extensions.clear();
		}

		String ch2 = cs.activeminc(uid);

		if (ch2.equals("mcA")) {

			s.calendars.attachMiniCalendar();
		} else {
			s.calendars.clear();
		}

		//export to ical 

		String ical = cs.activeIcal(uid);

		if (ical.equals("icA")) {
			s.extensions.add(DHXExtension.ICAL);
			s.toICal("ical.jsp");
		}

		//connect to map

		DHXMapView view = new DHXMapView();
		String map = cs.activeMap(uid);

		if (map.equals("mapA")) {
			s.views.add(view);
		}

		//Agenda

		String agn = cs.activeAgenda(uid);
		if (agn.equals("agA")) {

			s.views.add(new DHXAgendaView());
		}

		//s.templates.map_text = function(start,end,ev){
		// return ev.text;
		//};

		//Limiting the number of events per cell in the Month view
		s.config.setMaxMonthEvents(3);
		s.load("events.jsp", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("events.jsp");

		return s.render();

	}%>
		</div>

