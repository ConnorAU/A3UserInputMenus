/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

// The purpose of these defines is to allow one version of the UIs for use in the mission & mod, with the mission using CAU_ specific ctrls defined inside the mission (to allow inheriting, prevent conflicts and avoid using ctrlCreate) and the mod using base arma ctrls because they are the same in the end.

#define CAU_ctrlDefault ctrlDefault
#define CAU_ctrlDefaultText ctrlDefaultText
#define CAU_ctrlDefaultButton ctrlDefaultButton
#define CAU_ctrlStatic ctrlStatic
#define CAU_ctrlStaticBackground ctrlStaticBackground
#define CAU_ctrlStaticTitle ctrlStaticTitle
#define CAU_ctrlStaticFooter ctrlStaticFooter
#define CAU_ctrlStaticPictureTile ctrlStaticPictureTile
#define CAU_ctrlStaticBackgroundDisableTiles ctrlStaticBackgroundDisableTiles
#define CAU_ctrlButton ctrlButton
#define CAU_ctrlEdit ctrlEdit
#define CAU_ctrlEditMulti ctrlEditMulti
#define CAU_ctrlListbox ctrlListbox
#define CAU_ctrlStructuredText ctrlStructuredText
#define CAU_ctrlXSliderV ctrlXSliderV
#define CAU_ctrlXSliderH ctrlXSliderH

class ctrlDefault;
class ctrlDefaultText;
class ctrlDefaultButton;
class ctrlStatic;
class ctrlStaticBackground;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlStaticPictureTile;
class ctrlStaticBackgroundDisableTiles;
class ctrlButton;
class ctrlEdit;
class ctrlEditMulti;
class ctrlListbox;
class ctrlStructuredText;
class ctrlXSliderV;
class ctrlXSliderH;