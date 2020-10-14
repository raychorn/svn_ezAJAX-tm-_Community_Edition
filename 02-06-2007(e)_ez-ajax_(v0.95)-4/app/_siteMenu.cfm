<cfparam name="dojo" type="string" default="0">
<cfparam name="mode" type="string" default="">
<cfparam name="plain" type="string" default="0">
<cfset const_info_symbol = "INFO">
<cfset const_JSON_symbol = "JSON">
<cfset const_web20_symbol = "WEB20">
<cfset const_install_symbol = "INSTALL">
<cfset const_samples_symbol = "SAMPLES">
<cfset const_downloads_symbol = "DOWNLOADS">
<cfset const_docs_symbol = "DOCS">
<cfset const_licenses_symbol = "LICENSES">
<cfset const_support_symbol = "SUPPORT">

<cfset _parent = "parent.">
<cfif (plain)>
	<cfset _parent = "">
</cfif>

<cfoutput>
	<cfset _htmlContent = "">
	<cfset _linksAR = ArrayNew(1)>
	
			<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(1); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/large-icons.gif" border="0" width="32"><br></cfif><NOBR>What's New</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
		
			<cfif (Len(mode) eq 0) OR (mode is const_JSON_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(2); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/network-2.gif" border="0" width="32"><br></cfif><NOBR>JSON Support</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
		
			<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(3); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/computer.gif" border="0" width="32"><br></cfif><NOBR>Product Info</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
			
			<cfif (Len(mode) eq 0) OR (mode is const_install_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(4); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/install-software.gif" border="0" width="32"><br></cfif><NOBR>Installation</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(5); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/test_MoxieThumb.gif" border="0" width="50"><br></cfif><NOBR>Sample Apps</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
			
			<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol) OR (mode is const_info_symbol) OR (mode is const_docs_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(17); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/run-software.gif" border="0" width="32"><br></cfif><NOBR>Product Details & Availability</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
			
			<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(7); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/200x200/wafers.gif" border="0" width="32"><br></cfif>Semiconductor Wafer Analysis Prototype</a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_JSON_symbol) OR (mode is const_web20_symbol)>
				<cfset _appNum = 8>
				<cfset _appDesc = "Yahoo Search Sample using JSON">
				<cfif (mode is const_web20_symbol)>
					<cfset _appNum = 16>
					<cfset _appDesc = "Yahoo Search - Web 2.0 API Sample">
				</cfif>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(#_appNum#); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/yahoo-logo.gif" border="0" height="30"><br></cfif><NOBR>#_appDesc#</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_downloads_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(9); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/help.gif" border="0" width="32"><br></cfif>Articles, Whitepapers &amp; Help</a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(10); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/notes.gif" border="0" width="32"><br></cfif><NOBR>Features Chart</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_downloads_symbol) OR (mode is const_docs_symbol)>
				<cfset _appNum = 11>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(#_appNum#); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="/app/images/icons/32x32/update-software.gif" border="0" width="32"><br></cfif><NOBR>ezAJAX Downloads</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
		
			<cfif (Len(mode) eq 0) OR (mode is const_downloads_symbol) OR (mode is const_docs_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(12); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/documents.gif" border="0" width="32"><br></cfif><NOBR>Documentation</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_licenses_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(13); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="#Request.ezAJAX_webRoot#/app/images/icons/32x32/access-2.gif" border="0" width="32"><br></cfif>Manage/Upgrade Runtime Licenses</a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
			<cfif (Len(mode) eq 0) OR (mode is const_support_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<a href="" onClick="try { #_parent#load_app(14); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="/app/images/icons/32x32/shared-folder.gif" border="0" width="32"><br></cfif><NOBR>Contact Us</NOBR></a>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
		
			<cfif (Len(mode) eq 0) OR (mode is const_support_symbol)>
				<cfsavecontent variable="_html">
					<cfoutput>
						<cfif 0>
						<a href="" onClick="try { #_parent#load_app(15); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); }; return false;"><cfif (plain)><img src="/app/images/icons/32x32/users.gif" border="0" width="32"><br></cfif><NOBR>Support Forum</NOBR></a>
						</cfif>
					</cfoutput>
				</cfsavecontent>
				<cfset _linksAR[ArrayLen(_linksAR) + 1] = _html>
			</cfif>
	
	<table width="100%" align="center">
		<tr>
			<cfscript>
				n = ArrayLen(_linksAR);
				for (i = 1; i lte n; i = i + 1) {
					st = '';
					if (i lt n) {
	//					st = ' style="border-right: solid thin black;"';
					}
					writeOutput('<td align="center"' & st & '><b>' & _linksAR[i] & '</b></td>');
				}
			</cfscript>
		</tr>
	</table>
</cfoutput>
