function popUpDocumentForFlash4ProjectPlanDemo(rNum) {
	var aURL = '/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-Plan.html?nocache=' + ((rNum == null) ? '' : rNum);
	try {popUpWindowForURL(aURL, 'IssueTrackProjectPlan'); } catch(e) { ezAlertError(ezErrorExplainer(e)); };
}
