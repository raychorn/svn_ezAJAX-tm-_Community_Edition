<cfcomponent displayname="ezLicenserCode" output="No" extends="ezCompilerCode">

	<cffunction name="foldBlowFishStream" access="private" returntype="string">
		<cfargument name="inStr" required="Yes" type="string">
		<cfscript>
			var bc = Len(inStr);
			var bc2 = bc / 2;
			return Right(inStr, bc2) & Left(inStr, bc2);
		</cfscript>
	</cffunction>

	<cffunction name="asBlowfishEncryptedHex" access="private" returntype="string">
		<cfargument name="inStr" required="Yes" type="string">
		<cfscript>
			var aKey = GenerateSecretKey('BLOWFISH');
			var inStrEnc = Encrypt(inStr, aKey, 'BLOWFISH', 'Hex');
			var aKeyEnc = BinaryEncode(ToBinary(toBase64(aKey)), 'Hex');
			var aKeyLen = Len(aKeyEnc);
			var aKeyLenEnc = BinaryEncode(ToBinary(toBase64(Chr(aKeyLen))), 'Hex');
			var strPadding = 4 - Len(aKeyLenEnc);
			var strEncDataStream = '';
			if (Len(inStr) lte 65535) {
				if (strPadding gt 0) {
					strEncDataStream = strEncDataStream & RepeatString('0', strPadding);
				}
				strEncDataStream = strEncDataStream & aKeyLenEnc;
				strEncDataStream = strEncDataStream & aKeyEnc;
				strEncDataStream = strEncDataStream & inStrEnc;
			}
			if (isFoldable(strEncDataStream)) {
				return foldBlowFishStream(strEncDataStream);
			} else {
				return strEncDataStream;
			}
		</cfscript>
	</cffunction>

	<cfscript>
		function writeRuntimeLicenseForEndDate(aDate, aProductName, aServerName) {
			var aStruct = StructNew();
			var _wddxData = '';
			var _wddxDataStream = '';
			aStruct.runtimeLicenseExpirationDate = aDate;
			aStruct.RuntimeLicenseStatus = '';
			aStruct.computerID = Trim(getComputerID());
			aStruct.ProductName = aProductName;
			aStruct.ServerName = aServerName;
			aStruct.productVersion = this.productVersion;
			aStruct.ColdfusionID = server.coldfusion.productname & ' ' & ListFirst(server.coldfusion.productversion) & '.' & ListGetAt(server.coldfusion.productversion, 2);
			aStruct.isCommunityEdition = true;
			aStruct.copyrightNotice = '&copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.  Use of or duplication of this software or any software derived from its use is illegal unless specific written permission has been granted by Hierarchical Applications Limited or a duly appointed Officer of this corporation.';
			_wddxData = CFML2WDDX(aStruct);
			_wddxDataStream = asBlowfishEncryptedHex(_wddxData);

			cf_file_write(ExpandPath('runtimeLicense.dat'), _wddxDataStream);
		}
	</cfscript>
</cfcomponent>
