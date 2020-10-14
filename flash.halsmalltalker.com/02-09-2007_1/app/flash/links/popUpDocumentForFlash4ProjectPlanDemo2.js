function popUpDocumentForFlash4ProjectPlanDemo2() {
	var aURL = '/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-PlanA.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#';
	try {popUpWindowForURL(aURL, 'IssueTrackProjectPlan2'); } catch(e) { ezAlertError(ezErrorExplainer(e)); };
}

