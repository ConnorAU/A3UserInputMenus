/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class ConnorAU_UserInputMenus {
    tag="CAU_uim";
	class Functions {
		#define FUNC(name) class name {file = cau\userinputmenus\systems\display##name##.sqf;};
		FUNC(guiMessage)
		FUNC(listBox)
		FUNC(slider)
		FUNC(text)
		#undef FUNC
	};
};

