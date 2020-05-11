/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

// The purpose of these defines is to allow one version of the UIs for use in the mission & mod, with the mission using CAU_ specific ctrls defined inside the mission (to allow inheriting, prevent conflicts and avoid using ctrlCreate) and the mod using base arma ctrls because they are the same in the end.

#define CAU_UserInputMenus_ctrlDefault ctrlDefault
#define CAU_UserInputMenus_ctrlDefaultText ctrlDefaultText
#define CAU_UserInputMenus_ctrlDefaultButton ctrlDefaultButton
#define CAU_UserInputMenus_ctrlStatic ctrlStatic
#define CAU_UserInputMenus_ctrlStaticPicture ctrlStaticPicture
#define CAU_UserInputMenus_ctrlStaticBackground ctrlStaticBackground
#define CAU_UserInputMenus_ctrlStaticOverlay ctrlStaticOverlay
#define CAU_UserInputMenus_ctrlStaticTitle ctrlStaticTitle
#define CAU_UserInputMenus_ctrlStaticFooter ctrlStaticFooter
#define CAU_UserInputMenus_ctrlStaticPictureTile ctrlStaticPictureTile
#define CAU_UserInputMenus_ctrlStaticFrame ctrlStaticFrame
#define CAU_UserInputMenus_ctrlStaticBackgroundDisableTiles ctrlStaticBackgroundDisableTiles
#define CAU_UserInputMenus_ctrlButton ctrlButton
#define CAU_UserInputMenus_ctrlButtonPicture ctrlButtonPicture
#define CAU_UserInputMenus_ctrlEdit ctrlEdit
#define CAU_UserInputMenus_ctrlEditMulti ctrlEditMulti
#define CAU_UserInputMenus_ctrlListbox ctrlListbox
#define CAU_UserInputMenus_ctrlToolbox ctrlToolbox
#define CAU_UserInputMenus_ctrlControlsGroup ctrlControlsGroup
#define CAU_UserInputMenus_ctrlControlsGroupNoScrollbars ctrlControlsGroupNoScrollbars
#define CAU_UserInputMenus_ctrlStructuredText ctrlStructuredText
#define CAU_UserInputMenus_ctrlXSliderV ctrlXSliderV
#define CAU_UserInputMenus_ctrlXSliderH ctrlXSliderH

class ctrlDefault;
class ctrlDefaultText;
class ctrlDefaultButton;
class ctrlStatic;
class ctrlStaticPicture;
class ctrlStaticBackground;
class ctrlStaticOverlay;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlStaticPictureTile;
class ctrlStaticFrame;
class ctrlStaticBackgroundDisableTiles;
class ctrlButton;
class ctrlButtonPicture;
class ctrlEdit;
class ctrlEditMulti;
class ctrlListbox;
class ctrlToolbox;
class ctrlControlsGroup;
class ctrlControlsGroupNoScrollbars;
class ctrlStructuredText;
class ctrlXSliderV;
class ctrlXSliderH;