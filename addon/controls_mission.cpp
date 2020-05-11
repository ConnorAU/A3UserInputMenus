class CAU_UserInputMenus_ctrlDefault
{
	access=0;
	idc=-1;
	style=0;
	default=0;
	show=1;
	fade=0;
	blinkingPeriod=0;
	deletable=0;
	x=0;
	y=0;
	w=0;
	h=0;
	tooltip="";
	tooltipMaxWidth=0.5;
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={0,0,0,0};
	class ScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.059999999;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
};
class CAU_UserInputMenus_ctrlDefaultText: CAU_UserInputMenus_ctrlDefault
{
	sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font="RobotoCondensedLight";
	shadow=1;
};
class CAU_UserInputMenus_ctrlDefaultButton: CAU_UserInputMenus_ctrlDefaultText
{
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
};
class CAU_UserInputMenus_ctrlStatic: CAU_UserInputMenus_ctrlDefaultText
{
	type=0;
	colorBackground[]={0,0,0,0};
	text="";
	lineSpacing=1;
	fixedWidth=0;
	colorText[]={1,1,1,1};
	colorShadow[]={0,0,0,1};
	moving=0;
	autoplay=0;
	loops=0;
	tileW=1;
	tileH=1;
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onVideoStopped="";
};
class CAU_UserInputMenus_ctrlStaticPicture: CAU_UserInputMenus_ctrlStatic
{
	style=48;
};
class CAU_UserInputMenus_ctrlStaticBackground: CAU_UserInputMenus_ctrlStatic
{
	colorBackground[]={0.2,0.2,0.2,1};
};
class CAU_UserInputMenus_ctrlStaticOverlay: CAU_UserInputMenus_ctrlStatic
{
	colorBackground[]={0,0,0,0.5};
};
class CAU_UserInputMenus_ctrlStaticTitle: CAU_UserInputMenus_ctrlStatic
{
	moving=1;
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
};
class CAU_UserInputMenus_ctrlStaticFooter: CAU_UserInputMenus_ctrlStatic
{
	colorBackground[]={0,0,0,0.30000001};
};
class CAU_UserInputMenus_ctrlStaticPictureTile: CAU_UserInputMenus_ctrlStatic
{
	style=144;
};

class CAU_UserInputMenus_ctrlStaticFrame: CAU_UserInputMenus_ctrlStatic
{
	style=64;
};
class CAU_UserInputMenus_ctrlStaticBackgroundDisableTiles: CAU_UserInputMenus_ctrlStaticPictureTile
{
	x=-4;
	y=-2;
	w=8;
	h=4;
	text="\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW="8 / (32 * pixelW)";
	tileH="4 / (32 * pixelH)";
	colorText[]={1,1,1,0.050000001};
};
class CAU_UserInputMenus_ctrlButton: CAU_UserInputMenus_ctrlDefaultButton
{
	type=1;
	style="0x02 + 0xC0";
	colorBackground[]={0,0,0,1};
	colorBackgroundDisabled[]={0,0,0,0.5};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorFocused[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	font="PuristaLight";
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	borderSize=0;
	colorBorder[]={0,0,0,0};
	colorShadow[]={0,0,0,0};
	offsetX=0;
	offsetY=0;
	offsetPressedX="pixelW";
	offsetPressedY="pixelH";
	period=0;
	periodFocus=2;
	periodOver=0.5;
	class KeyHints
	{
		class A
		{
			key="0x00050000 + 0";
			hint="KEY_XBOX_A";
		};
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class CAU_UserInputMenus_ctrlButtonPicture: CAU_UserInputMenus_ctrlButton
{
	style="0x02 + 0x30";
};
class CAU_UserInputMenus_ctrlEdit: CAU_UserInputMenus_ctrlDefaultText
{
	type=2;
	colorBackground[]={0,0,0,0.5};
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelection[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	canModify=1;
	autocomplete="";
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class CAU_UserInputMenus_ctrlEditMulti: CAU_UserInputMenus_ctrlEdit
{
	style=16;
};
class CAU_UserInputMenus_ctrlListbox: CAU_UserInputMenus_ctrlDefaultText
{
	type=5;
	style="0x00 + 0x10";
	colorBackground[]={0,0,0,0.5};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorShadow[]={0,0,0,0.5};
	colorDisabled[]={1,1,1,0.25};
	colorText[]={1,1,1,1};
	colorSelect[]={1,1,1,1};
	colorSelect2[]={1,1,1,1};
	colorTextRight[]={1,1,1,1};
	colorSelectRight[]={1,1,1,1};
	colorSelect2Right[]={1,1,1,1};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	period=1;
	rowHeight="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	itemSpacing=0;
	maxHistoryDelay=1;
	canDrag=0;
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
	onLBDrag="";
	onLBDragging="";
	onLBDrop="";
};
class CAU_UserInputMenus_ctrlToolbox: CAU_UserInputMenus_ctrlDefaultText
{
	type=6;
	style=2;
	colorBackground[]={0,0,0,0.5};
	colorText[]={1,1,1,1};
	colorTextSelect[]={1,1,1,1};
	rows=1;
	columns=1;
	strings[]={};
	values[]={};
	color[]={1,0,1,1};
	colorSelect[]={0,0,0,0};
	colorTextDisable[]={0,0,0,0};
	colorDisable[]={0,0,0,0};
	colorSelectedBg[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onToolBoxSelChanged="";
};
class CAU_UserInputMenus_ctrlControlsGroup: CAU_UserInputMenus_ctrlDefault
{
	type=15;
	style=16;
	x=0;
	y=0;
	w=1;
	h=1;
	class VScrollBar: ScrollBar
	{
		width="2 * (pixelW * pixelGrid * 	0.50)";
		height=0;
		autoScrollEnabled=0;
		autoScrollDelay=1;
		autoScrollRewind=1;
		autoScrollSpeed=1;
	};
	class HScrollBar: ScrollBar
	{
		width=0;
		height="2 * (pixelH * pixelGrid * 	0.50)";
	};
	onCanDestroy="";
	onDestroy="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class CAU_UserInputMenus_ctrlControlsGroupNoScrollbars: CAU_UserInputMenus_ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width=0;
	};
	class HScrollbar: HScrollBar
	{
		height=0;
	};
};
class CAU_UserInputMenus_ctrlStructuredText: CAU_UserInputMenus_ctrlDefaultText
{
	type=13;
	colorBackground[]={0,0,0,0};
	size="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	text="";
	class Attributes
	{
		align="left";
		color="#ffffff";
		colorLink="";
		size=1;
		font="RobotoCondensedLight";
	};
	onCanDestroy="";
	onDestroy="";
};
class CAU_UserInputMenus_ctrlXSliderV: CAU_UserInputMenus_ctrlDefault
{
	type=43;
	style=0;
	color[]={1,1,1,0.60000002};
	colorActive[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	sliderRange[]={0,1};
	sliderPosition=1;
	lineSize=0.1;
	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb="\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc=-1;
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc=-1;
		format="%.f";
		type="SPTPlain";
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onSliderPosChanged="";
};
class CAU_UserInputMenus_ctrlXSliderH: CAU_UserInputMenus_ctrlXSliderV
{
	style=1024;
};
