--[[--------------------------------------------------------------------------------
  FonTabulous
  Authors:  Devla (qtuimod@gmail.com), Pircio (ajpircio@gmail.com), & JAcKyL69 (jackyl69@hotmail.com)
  Website: http://qtui.12.forumer.com/viewforum.php?f=21
-----------------------------------------------------------------------------------]]
FTABDB = {}
FTAB_FONTS = {}

FTAB_FONTS[101] = "Default"
FTAB_FONTS[102] = "Antique Olive"
FTAB_FONTS[103] = "BitstreamVera"
FTAB_FONTS[104] = "Blackcastle"
FTAB_FONTS[105] = "Daville"
FTAB_FONTS[106] = "Devla"
FTAB_FONTS[107] = "Diablo"
FTAB_FONTS[108] = "Dream"
FTAB_FONTS[109] = "Dumbledor"
FTAB_FONTS[110] = "Enigmatic"
FTAB_FONTS[111] = "Fontin"
FTAB_FONTS[112] = "Frutiger"
FTAB_FONTS[113] = "Futura Bold"
FTAB_FONTS[114] = "Insomniax"
FTAB_FONTS[115] = "Myriad"
FTAB_FONTS[116] = "SF Archery"
FTAB_FONTS[117] = "Street Corner"
FTAB_FONTS[118] = "Univers"
FTAB_FONTS[119] = "Wacky"
FTAB_FONTS[120] = "X360"

--FTAB1 = CreateFrame("Frame", "FTAB");

function FTAB_Startup()
	FTAB_ID = GetRealmName() .. UnitName("player") .. "_"
	if (FTABDB[FTAB_ID .. "AutoLoad"] == nil) then
		FTABDB[FTAB_ID .. "AutoLoad"] = 0
	end
	if (FTABDB[FTAB_ID .. "Font"] == nil) then
		FTABDB[FTAB_ID .. "Font"] = 101
	end
	if (FTABDB[FTAB_ID .. "FontScale"] == nil) then
		FTABDB[FTAB_ID .. "FontScale"] = 1
	end

	--FTAB_FONTS[id] == FontName

	FTAB_FONT_DEFAULT = SystemFont:GetFont()
	FTAB_BOLD_DEFAULT = GameFontHighlightSmall:GetFont()
	FTAB_ITALIC_DEFAULT = QuestFont:GetFont()
	FTAB_BOLDITALIC_DEFAULT = ZoneTextFont:GetFont()
	FTAB_NUMBER_DEFAULT = NumberFontNormalYellow:GetFont()

	FTAB_ChangeFont(FTABDB[FTAB_ID .. "Font"])
	FTAB_ApplySystemFonts()
end

function FTAB_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("ADDON_ACTION_FORBIDDEN")
	SlashCmdList["FONTABULOUS"] = FTAB_Slash_Handler
	SLASH_FONTABULOUS1 = "/ftab"
	SLASH_FONTABULOUS2 = "/fontabulous"
end

function FTAB_OnEvent(event)
	if (event == "VARIABLES_LOADED") then
		FTAB_ChatMsg(FTAB_LOADED)
		FTAB_Startup()
	end
	if (event == "ADDON_ACTION_FORBIDDEN") then
		FTAB_ChatMsg(arg1 .. ": " .. arg2)
	end
end

function FTAB_Slash_Handler(msg)
	argv = {};
	for arg in string.gmatch(string.lower(msg), '[%a%d%-%.]+') do
		table.insert(argv, arg);
	end

	FTAB_Config:Show()
end

function FTAB_ChatMsg(msg)
	if(DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage("|cffffffff" .. msg);
	end
end

function FTAB_ChangeFont(FTAB_Choice)
		FTAB_BASE = "Interface\\AddOns\\!!FonTabulous\\Fonts\\";
		FTAB_Choice = tonumber(FTAB_Choice)
	--Default Game Font
	if (FTAB_Choice == 101) then
		FTAB_FONT = FTAB_FONT_DEFAULT;
		FTAB_BOLD = FTAB_BOLD_DEFAULT;
		FTAB_ITALIC = FTAB_ITALIC_DEFAULT;
		FTAB_BOLDITALIC = FTAB_BOLDITALIC_DEFAULT;
		FTAB_NUMBER = FTAB_NUMBER_DEFAULT;
	--Antique Olive
	elseif (FTAB_Choice == 102) then
		FTAB_FONT = FTAB_BASE .. "LANTIQOB.TTF";
		FTAB_BOLD = FTAB_BASE .. "Antique_Olive_Bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "LANTIQOT.TTF";
		FTAB_BOLDITALIC = FTAB_BASE .. "LANTIQOT.TTF";
		FTAB_NUMBER = FTAB_BASE .. "LANTIQOB.TTF";
	--BitstreamVera
	elseif (FTAB_Choice == 103) then
		FTAB_FONT = FTAB_BASE .. "VeraSe.ttf";
		FTAB_BOLD = FTAB_BASE .. "VeraSeBd.ttf";
		FTAB_ITALIC = FTAB_BASE .. "VeraMoIt.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "VeraMoBd.ttf";
		FTAB_NUMBER = FTAB_BASE .. "VeraMono.ttf";
	--Blackcastle
	elseif (FTAB_Choice == 104) then
		FTAB_FONT = FTAB_BASE .. "BlackCastleMF.ttf";
		FTAB_BOLD = FTAB_BASE .. "BlackCastleMF.ttf";
		FTAB_ITALIC = FTAB_BASE .. "BlackCastleMF.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "BlackCastleMF.ttf";
		FTAB_NUMBER = FTAB_BASE .. "BlackCastleMF.ttf";
	--Daville
	elseif (FTAB_Choice == 105) then
		FTAB_FONT = FTAB_BASE .. "Daville.ttf";
		FTAB_BOLD = FTAB_BASE .. "Daville.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Daville Slanted.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Daville Slanted.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Daville.ttf";
	--Devla
	elseif (FTAB_Choice == 106) then
		FTAB_FONT = FTAB_BASE .. "myriad_web_bold.ttf";
		FTAB_BOLD = FTAB_BASE .. "FTUBL___.TTF";
		FTAB_ITALIC = FTAB_BASE .. "myriadi.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Adventure.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Univers_Condensed_Bold.ttf";
	--Diablo
	elseif (FTAB_Choice == 107) then
		FTAB_FONT = FTAB_BASE .. "Avalon Quest.ttf";
		FTAB_BOLD = FTAB_BASE .. "Avalon Quest Bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Avalon Quest Italic.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Avalon Quest Medium.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Avalon Quest Medium.ttf";
	--Dream
	elseif (FTAB_Choice == 108) then
		FTAB_FONT = FTAB_BASE .. "dreamorp.ttf";
		FTAB_BOLD = FTAB_BASE .. "dreamorb.ttf";
		FTAB_ITALIC = FTAB_BASE .. "dreamori.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "dreamobx.ttf";
		FTAB_NUMBER = FTAB_BASE .. "dreamorb.ttf";
	--Dumbledor
	elseif (FTAB_Choice == 109) then
		FTAB_FONT = FTAB_BASE .. "dum1.ttf";
		FTAB_BOLD = FTAB_BASE .. "dum1wide.ttf";
		FTAB_ITALIC = FTAB_BASE .. "dum1ital.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "dum1wide.ttf";
		FTAB_NUMBER = FTAB_BASE .. "dum1thin.ttf";
	--Enigmatic
	elseif (FTAB_Choice == 110) then
		FTAB_FONT = FTAB_BASE .. "Enigma__2.TTF";
		FTAB_BOLD = FTAB_BASE .. "Enigma__2.TTF";
		FTAB_ITALIC = FTAB_BASE .. "Enigma_2i.TTF";
		FTAB_BOLDITALIC = FTAB_BASE .. "Enigma_2i.TTF";
		FTAB_NUMBER = FTAB_BASE .. "Enigma__2.TTF";
	--Fontin
	elseif (FTAB_Choice == 111) then
		FTAB_FONT = FTAB_BASE .. "Fontin-Regular.ttf";
		FTAB_BOLD = FTAB_BASE .. "Fontin-Bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Fontin-Italic.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Fontin-SmallCaps.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Fontin-SmallCaps.ttf";
	--Frutiger
	elseif (FTAB_Choice == 112) then
		FTAB_FONT = FTAB_BASE .. "FTB_____.TTF";
		FTAB_BOLD = FTAB_BASE .. "FTBL____.TTF";
		FTAB_ITALIC = FTAB_BASE .. "FTBI____.TTF";
		FTAB_BOLDITALIC = FTAB_BASE .. "FTUBL___.TTF";
		FTAB_NUMBER = FTAB_BASE .. "FrutigerCnd_Bold.ttf";
	--Futura Bold
	elseif (FTAB_Choice == 113) then
		FTAB_FONT = FTAB_BASE .. "Futura-CondensedExtraBold-Th.ttf";
		FTAB_BOLD = FTAB_BASE .. "Futura Bold BT.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Futura-CondensedExtraBold-Italic.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Futura Bold Italic BT.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Futura-Condensed-Thin.ttf";
	--Insomniax
	elseif (FTAB_Choice == 114) then
		FTAB_FONT = FTAB_BASE .. "Tw_Cen_MT.ttf";
		FTAB_BOLD = FTAB_BASE .. "Tw_Cen_MT_Bold.TTF";
		FTAB_ITALIC = FTAB_BASE .. "Tw_Cen_MT_Bold_Italic.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Tw_Cen_MT_Bold_Italic.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Tw_Cen_MT.ttf";
	--Myriad
	elseif (FTAB_Choice == 115) then
		FTAB_FONT = FTAB_BASE .. "myriad.ttf";
		FTAB_BOLD = FTAB_BASE .. "myriad_web_bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "myriadi.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "myriad_web_fett.ttf";
		FTAB_NUMBER = FTAB_BASE .. "myriapsc.ttf";
	--SF Archery
	elseif (FTAB_Choice == 116) then
		FTAB_FONT = FTAB_BASE .. "SF Archery Black.ttf";
		FTAB_BOLD = FTAB_BASE .. "SF Archery Black.ttf";
		FTAB_ITALIC = FTAB_BASE .. "SF Archery Black Oblique.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "SF Archery Black SC.ttf";
		FTAB_NUMBER = FTAB_BASE .. "SF Archery Black Oblique.ttf";
	--Street Corner
	elseif (FTAB_Choice == 117) then
		FTAB_FONT = FTAB_BASE .. "Street Corner SemiBold.ttf";
		FTAB_BOLD = FTAB_BASE .. "Street Corner Bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Street Corner Oblique.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Street Corner Extend.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Street Corner Thin.ttf";
	--Univers
	elseif (FTAB_Choice == 118) then
		FTAB_FONT = FTAB_BASE .. "Univers_Bold.ttf";
		FTAB_BOLD = FTAB_BASE .. "Univers_Bold.ttf";
		FTAB_ITALIC = FTAB_BASE .. "Univers_Bold_Italic.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "Univers_Bold_Italic.ttf";
		FTAB_NUMBER = FTAB_BASE .. "Univers_Condensed_Bold.ttf";
	--Wacky
	elseif (FTAB_Choice == 119) then
		FTAB_FONT = FTAB_BASE .. "Avatar.ttf";
		FTAB_BOLD = FTAB_BASE .. "CU______.TTF";
		FTAB_ITALIC = FTAB_BASE .. "Avatar.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "MAILRAYS.TTF";
		FTAB_NUMBER = FTAB_BASE .. "Avatar.ttf";
	--X360
	elseif (FTAB_Choice == 120) then
		FTAB_FONT = FTAB_BASE .. "X360.ttf";
		FTAB_BOLD = FTAB_BASE .. "X360.ttf";
		FTAB_ITALIC = FTAB_BASE .. "X360.ttf";
		FTAB_BOLDITALIC = FTAB_BASE .. "X360.ttf";
		FTAB_NUMBER = FTAB_BASE .. "X360.ttf";		
	else
		FTAB_ChatMsg(INVALID_FONT)
	end
end

function FTAB_ApplySystemFonts()

		 UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
		 CHAT_FONT_HEIGHTS = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}
	
		UNIT_NAME_FONT     = FTAB_FONT		
		NAMEPLATE_FONT     = FTAB_BOLD
		DAMAGE_TEXT_FONT   = FTAB_NUMBER
		STANDARD_TEXT_FONT = FTAB_FONT
	
	if (FTABDB[FTAB_ID .. "FontScale"]) then
		FSCALE = FTABDB[FTAB_ID .. "FontScale"]
	else
		FSCALE = 1
	end
	
	SystemFont:SetFont(FTAB_FONT, 15 * FSCALE)
	SystemFont:SetTextColor(1.0, 1.0, 0)
	GameFontNormal:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontHighlight:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontGreen:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontGreen:SetTextColor(0.1, 1.0, 0.1)
	GameFontRed:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontRed:SetTextColor(1.0, 0.1, 0.1)
	GameFontBlack:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontBlack:SetTextColor(0, 0, 0)
	GameFontWhite:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontWhite:SetTextColor(1.0, 1.0, 1.0)
	GameFontDisableSmall:SetTextColor(0.6, 0.6, 0.6)
	GameFontDisable:SetFont(FTAB_FONT, 13 * FSCALE)
	GameFontDisable:SetTextColor(0.5, 0.5, 0.5)
	ChatFrameEditBoxHeader:SetFont(FTAB_FONT, 16 * FSCALE)
	ChatFrameEditBox:SetFont(FTAB_FONT, 16 * FSCALE)
	
	GameFontNormalSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontNormalSmall:SetTextColor(1.0, 0.82, 0)
	GameFontHighlightSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontHighlightSmall:SetTextColor(1.0, 1.0, 1.0)
	GameFontDisableSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontDisableSmall:SetTextColor(0.5, 0.5, 0.5)
	GameFontDarkGraySmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontDarkGraySmall:SetTextColor(0.35, 0.35, 0.35)
	GameFontGreenSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontGreenSmall:SetTextColor(0.1, 1.0, 0.1)
	GameFontRedSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameFontRedSmall:SetTextColor(1.0, 0.1, 0.1)
	GameFontHighlightSmallOutline:SetFont(FTAB_BOLD, 12 * FSCALE, "THINOUTLINE")
	GameFontNormalLarge:SetFont(FTAB_FONT, 16 * FSCALE)
	GameFontNormalLarge:SetTextColor(1.0, 0.82, 0)
	GameFontHighlightLarge:SetFont(FTAB_FONT, 16 * FSCALE)
	GameFontRedSmall:SetTextColor(1.0, 1.0, 1.0)
	GameFontDisableLarge:SetFont(FTAB_FONT, 16 * FSCALE)
	GameFontDisableLarge:SetTextColor(0.5, 0.5, 0.5)
	GameFontGreenLarge:SetFont(FTAB_FONT, 16 * FSCALE)
	GameFontGreenLarge:SetTextColor(0.1, 1.0, 0.1)
	GameFontRedLarge:SetFont(FTAB_FONT, 16 * FSCALE)
	GameFontRedLarge:SetTextColor(1.0, 0.1, 0.1)
	
	NumberFontNormal:SetFont(FTAB_NUMBER, 16 * FSCALE, "OUTLINE")
	NumberFontNormal:SetTextColor(1.0, 1.0, 1.0)
	NumberFontNormalYellow:SetFont(FTAB_NUMBER, 16 * FSCALE, "OUTLINE")
	NumberFontNormalYellow:SetTextColor(1.0, 0.82, 0)
	NumberFontNormalSmall:SetFont(FTAB_NUMBER, 14 * FSCALE, "THINOUTLINE")
	NumberFontNormalSmall:SetTextColor(1.0, 1.0, 1.0)
	NumberFontNormalSmallGray:SetFont(FTAB_NUMBER, 13 * FSCALE, "THINOUTLINE")
	NumberFontNormalSmallGray:SetTextColor(0.75, 0.75, 0.75)
	NumberFontNormalLarge:SetFont(FTAB_NUMBER, 17 * FSCALE, "OUTLINE")
	NumberFontNormalLarge:SetTextColor(1.0, 1.0, 1.0)
	NumberFontNormalHuge:SetFont(FTAB_NUMBER, 32 * FSCALE, "THICKOUTLINE")
	NumberFontNormalHuge:SetTextColor(1.0, 1.0, 1.0)
	
	ChatFontNormal:SetFont(FTAB_ITALIC, 14 * FSCALE)
	ChatFontNormal:SetTextColor(1.0, 1.0, 1.0)
	
	QuestTitleFont:SetFont(FTAB_BOLD, 19 * FSCALE)
	QuestTitleFont:SetShadowOffset(1, -1)
	QuestFont:SetFont(FTAB_ITALIC, 15 * FSCALE)
	QuestFontNormalSmall:SetFont(FTAB_BOLD, 13 * FSCALE)
	QuestFontHighlight:SetFont(FTAB_FONT, 22 * FSCALE)
	QuestFontHighlight:SetShadowOffset(1, -1)
	ItemTextFontNormal:SetFont(FTAB_FONT, 15 * FSCALE)
	ItemTextFontNormal:SetTextColor(0.18, 0.12, 0.06)
	SubSpellFont:SetFont(FTAB_BOLD, 13 * FSCALE)
	SubSpellFont:SetTextColor(0.35, 0.2, 0)
	DialogButtonNormalText:SetFont(FTAB_FONT, 16 * FSCALE)
	DialogButtonNormalText:SetTextColor(1.0, 0.82, 0)
	DialogButtonHighlightText:SetFont(FTAB_FONT, 16 * FSCALE)
	DialogButtonHighlightText:SetTextColor(1.0, 1.0, 1.0)
	
	ZoneTextFont:SetFont(FTAB_BOLDITALIC, 106 * FSCALE, "THICKOUTLINE")
	ZoneTextFont:SetTextColor(1.0, 0.9294, 0.7607)
	ZoneTextFont:SetShadowColor(0, 0, 0)
	ZoneTextFont:SetShadowOffset(1, -1)
	SubZoneTextFont:SetFont(FTAB_BOLDITALIC, 28 * FSCALE, "THICKOUTLINE")
	ErrorFont:SetFont(FTAB_FONT, 16)
	TextStatusBarText:SetFont(FTAB_NUMBER, 16 * FSCALE, "OUTLINE")
	TextStatusBarTextSmall:SetFont(FTAB_FONT, 14 * FSCALE, "OUTLINE")
	TextStatusBarTextSmall:SetTextColor(1.0, 1.0, 1.0)
	CombatLogFont:SetFont(FTAB_FONT, 13 * FSCALE)
	GameTooltipText:SetFont(FTAB_FONT, 13 * FSCALE)
	GameTooltipText:SetTextColor(1.0, 1.0, 1.0)
	GameTooltipTextSmall:SetFont(FTAB_BOLD, 12 * FSCALE)
	GameTooltipTextSmall:SetTextColor(1.0, 1.0, 1.0)
	GameTooltipHeaderText:SetFont(FTAB_BOLD, 15 * FSCALE)
	GameTooltipHeaderText:SetTextColor(1.0, 1.0, 1.0)
	WorldMapTextFont:SetFont(FTAB_BOLDITALIC, 106 * FSCALE, "THICKOUTLINE")
	WorldMapTextFont:SetTextColor(1.0, 0.9294, 0.7607)
	WorldMapTextFont:SetShadowColor(0, 0, 0)
	WorldMapTextFont:SetShadowOffset(1, -1)
	MailTextFontNormal:SetFont(FTAB_ITALIC, 16 * FSCALE)
	MailTextFontNormal:SetTextColor(0.18, 0.12, 0.06)
	InvoiceTextFontNormal:SetFont(FTAB_ITALIC, 14 * FSCALE)
	InvoiceTextFontNormal:SetTextColor(0.18, 0.12, 0.06)
	InvoiceTextFontSmall:SetFont(FTAB_ITALIC, 12 * FSCALE)
	InvoiceTextFontSmall:SetTextColor(0.18, 0.12, 0.06)

	for i=1,7 do
		local f = getglobal("ChatFrame"..i)
		local font, size = f:GetFont()
		f:SetFont(FTAB_FONT, 13 * FSCALE)
	end
	
	FTAB_FONT_CHECK = FTAB_FONT
end

function FTAB_CheckFont()
	if (FTAB_FONT_CHECK) then
		fontName, fontHeight, fontFlags = GameFontNormal:GetFont()
		if (FTAB_FONT_CHECK ~= fontName) then
			FTAB_ApplySystemFonts()
		end
	end
end

--------------------------------[ OPTIONS ]------------------------------------

function FTAB_LoadButton(id)
	if (FTAB_FONTS[id]) then
		getglobal(this:GetName() .. "_Text"):SetText(FTAB_FONTS[id])
	else
		getglobal(this:GetName() .. "_Text"):SetText(BUTTON .. id)
	end
end

function FTAB_LoadMainDropButton()
	FTAB_Config_FontList_Text:SetText(FTAB_FONTS[FTABDB[FTAB_ID .. "Font"]])
	FTAB_Config_FontList:SetID(FTABDB[FTAB_ID .. "Font"])
end

function FTAB_ButtonClick(id)
	if (id > 100) and (id < 121) then
		FTAB_UpdatePreview()
	end
end

function FTAB_UpdatePreview()
	id = FTAB_Config_FontList:GetID()
	if (id == 0) then
		id = FTABDB[FTAB_ID .. "Font"]
	end
	FTAB_ChangeFont(id)

	FSCALE = FTAB_Config_FontHeight:GetValue() / 100

	--FTAB_ChatMsg(FTAB_FONT)

	FTAB_Config_PreviewFrame_1:SetFont(FTAB_FONT, 14 * FSCALE)
	FTAB_Config_PreviewFrame_2:SetFont(FTAB_NUMBER, 14 * FSCALE)
	FTAB_Config_PreviewFrame_3:SetFont(FTAB_BOLD, 12 * FSCALE)
	FTAB_Config_PreviewFrame_4:SetFont(FTAB_ITALIC, 14 * FSCALE)
	FTAB_Config_PreviewFrame_5:SetFont(FTAB_BOLDITALIC, 24 * FSCALE)

end

function FTAB_AutoReload(mframe)
	if (mframe:GetChecked()) then
		FTABDB[FTAB_ID .. "AutoLoad"] = 1
	else
		FTABDB[FTAB_ID .. "AutoLoad"] = 0
	end
end

function FTAB_LoadAuto(mframe)
	mframe:SetChecked(FTABDB[FTAB_ID .. "AutoLoad"])
end

function FTAB_LoadConfig()
	FTAB_UpdateCurrentProfile()
	FTAB_Config_FontHeight:SetValue(FTABDB[FTAB_ID .. "FontScale"] * 100)
end

function FTAB_UpdateCurrentProfile()
	currentFont = FTABDB[FTAB_ID .. "Font"]
	FTAB_Config_CurrentFont:SetText(CURRENT_FONT .. FTAB_FONTS[currentFont])
end

function FTAB_FontSelect(id)
	if (id ~= 0) then
		FTABDB[FTAB_ID .. "FontScale"] = FTAB_Config_FontHeight:GetValue() / 100
		FTABDB[FTAB_ID .. "Font"] = tonumber(id)
		FTAB_ChangeFont(id)
		if (FTABDB[FTAB_ID .. "AutoLoad"] == 0) then
			FTAB_ConfirmReload:Show()
		else
			ReloadUI()
		end
	end
end

function FTAB_Confirm(mframe,confirm)
	mframe:GetParent():Hide()
	if (confirm == "yes" and mframe:GetParent():GetName() == "FTAB_ConfirmReload") then
		ReloadUI()
	else
		FTAB_ApplySystemFonts()
		currentFont = FTABDB[FTAB_ID .. "Font"]
		FTAB_Config_CurrentFont:SetText(CURRENT_FONT .. FTAB_FONTS[currentFont])
	end
end
