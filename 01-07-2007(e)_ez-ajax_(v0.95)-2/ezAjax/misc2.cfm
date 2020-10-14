<cffunction name="foldBlowFishStream" access="private" returntype="string">
	<cfargument name="inStr" required="Yes" type="string">
	<cfscript>
		var bc = Len(inStr);
		var bc2 = bc / 2;
		return Right(inStr, bc2) & Left(inStr, bc2);
	</cfscript>
</cffunction>

<cffunction name="_asBlowfishEncryptedHex" access="private" returntype="string">
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
		return strEncDataStream;
	</cfscript>
</cffunction>

<cffunction name="asBlowfishEncryptedHex" access="private" returntype="string">
	<cfargument name="inStr" required="Yes" type="string">
	<cfscript>
		var strEncDataStream = _asBlowfishEncryptedHex(inStr);
		if (isFoldable(strEncDataStream)) {
			return foldBlowFishStream(strEncDataStream);
		} else {
			return strEncDataStream;
		}
	</cfscript>
</cffunction>
