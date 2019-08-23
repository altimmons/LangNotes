# Top Themes

## Links

[Theme Authoring Guide](https://code.visualstudio.com/api/extension-capabilities/theming)

[Theme Color Reference](https://code.visualstudio.com/api/references/theme-color)

[More on theme Colors](https://code.visualstudio.com/api/extension-guides/color-theme)

[theme capabilities](https://code.visualstudio.com/api/extension-capabilities/theming)

[color wheel](https://color.adobe.com/)

[Good Article](https://css-tricks.com/creating-a-vs-code-theme/)

## SynthWave '84
Id: robbowen.synthwave-vscode
Description: A Synthwave-inspired colour theme to satisfy your neon dreams
Version: 0.0.7
Publisher: Robb Owen
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=RobbOwen.synthwave-vscode

{
  "vscode_custom_css.imports": [
    "file:///Users/{your username}/synthwave84.css"
    ]
}
Windows might resemble:

```json
{
  "vscode_custom_css.imports": [
    "file:///C:/Users/{your username}/synthwave84.css"
    ]
}
```

```css
.mtk3 {
  color: #f92aad;
  text-shadow: 0 0 2px #100c0f, 0 0 5px #dc078e33, 0 0 10px #fff3;
}

.mtk4 {
  color: #6d77b3;
}

.mtk5 {
  color: #f97e72;
}

.mtk6 {
  color: #fdfdfd;
  text-shadow: 0 0 2px #001716, 0 0 3px #03edf975, 0 0 5px #03edf975, 0 0 8px #03edf975;
}

.mtk7 {
  color: #fff5f6;
  text-shadow: 0 0 2px #000, 0 0 10px #fc1f2c75, 0 0 5px #fc1f2c75, 0 0 25px #fc1f2c75;
}

.mtk8 {
  color: #72f1b8;
  text-shadow: 0 0 2px #100c0f, 0 0 10px #257c5575, 0 0 35px #21272475;
}

.mtk9 {
  color: #f4eee4;
  text-shadow: 0 0 2px #393a33, 0 0 8px #f39f0575, 0 0 2px #f39f0575;
}

.monaco-editor .margin, .monaco-editor-background, .monaco-editor .inputarea.ime-input {
  background: transparent;
}

/* Add the subtle gradient to the editor background */
.monaco-editor {
  background-color: transparent !important;
  background-image: linear-gradient(to bottom, #2a2139 75%, #34294f);
  background-size: auto 100vh;
  background-position: top;
  background-repeat: no-repeat;
}

/* Sweet sunset dots */
.monaco-workbench .activitybar>.content .monaco-action-bar .badge .badge-content {
  background: linear-gradient(to bottom, #fff951 25%, #fc28a8);
}

/* Active tab neon */
.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit.active {
  box-shadow: inset 0 -5px 25px #fc28a825;
  position: relative;
}

/* Active tab stripe */
.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit.active::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(to right, #fc28a8, #03edf9) !important;
  opacity: 1;
  z-index: 6;
}

.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  right: 0;
  height: 0px;
  transition: opacity 1s;
  opacity: 0;
  z-index: 6;
}

/* Active sidebar item */
.monaco-workbench .activitybar>.content .monaco-action-bar .action-item.checked {
  box-shadow: inset 0 -5px 25px #fc28a825;
  position: relative;
}

.monaco-workbench .activitybar>.content .monaco-action-bar .action-item.checked::after {
  content: '';
  position: absolute;
  bottom: 0px;
  top: 0px;
  left: 0px;
  width: 4px;
  background: linear-gradient(to bottom, #fc28a8, #03edf9) !important;
  opacity: 1;
}

.monaco-workbench .activitybar>.content .monaco-action-bar .action-item::after {
  content: '';
  position: absolute;
  bottom: 0px;
  top: 0px;
  left: 0px;
  width: 0px;
  transition: opacity 1s;
  opacity: 0;
}

/* update lightbuld to be neon */
.lightbulb-glyph {
  background:  url("data:image/svg+xml,%3Csvg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Crect fill='%23ffffff' x='5.68' y='6.93' width='2.1' height='6.1' rx='0.96' transform='translate(-1.94 1.63) rotate(-12.09)'/%3E%3Cpath fill='%2303edf9' d='M7.08,13.5a1.46,1.46,0,0,1-1.43-1.16L4.77,8.26A1.47,1.47,0,0,1,5.9,6.53l.17,0A1.46,1.46,0,0,1,7.81,7.61l.87,4.09a1.46,1.46,0,0,1-1.12,1.73l-.18,0Zm-.7-6h-.1l-.17,0a.45.45,0,0,0-.29.21.45.45,0,0,0-.07.34l.88,4.09a.46.46,0,0,0,.54.35l.18,0a.46.46,0,0,0,.29-.2.48.48,0,0,0,.07-.35L6.83,7.82A.46.46,0,0,0,6.38,7.46Z'/%3E%3Crect fill='%23ffffff' x='8.22' y='6.93' width='2.1' height='6.1' rx='0.96' transform='translate(16.25 21.68) rotate(-167.91)'/%3E%3Cpath fill='%2303edf9' d='M8.93,13.5a1.63,1.63,0,0,1-.31,0l-.18,0A1.46,1.46,0,0,1,7.32,11.7l.87-4.09A1.47,1.47,0,0,1,9.93,6.49l.18,0a1.45,1.45,0,0,1,.92.63,1.47,1.47,0,0,1,.2,1.1l-.88,4.08a1.45,1.45,0,0,1-.63.93A1.48,1.48,0,0,1,8.93,13.5Zm.69-6a.45.45,0,0,0-.25.07.5.5,0,0,0-.2.29L8.3,11.9a.43.43,0,0,0,.06.35.46.46,0,0,0,.29.2l.18,0a.47.47,0,0,0,.55-.35l.87-4.09a.45.45,0,0,0-.06-.34A.47.47,0,0,0,9.9,7.5l-.18,0Z'/%3E%3Cpath fill='%23ffffff' d='M11.77,9l-3.53.67a1,1,0,0,1-1.15-.88h0A1.09,1.09,0,0,1,7.9,7.48l3.53-.67a1,1,0,0,1,1.15.89h0A1.08,1.08,0,0,1,11.77,9Z'/%3E%3Cpath fill='%2303edf9' d='M8.07,10.18A1.54,1.54,0,0,1,6.6,8.83a1.74,1.74,0,0,1,.25-1.22,1.46,1.46,0,0,1,1-.66l3.52-.67A1.51,1.51,0,0,1,13.07,7.6a1.61,1.61,0,0,1-1.22,1.88l-3.52.67A1.15,1.15,0,0,1,8.07,10.18ZM11.6,7.34h-.09L8,8a.53.53,0,0,0-.4.62.5.5,0,0,0,.57.44l3.52-.67a.54.54,0,0,0,.41-.62A.53.53,0,0,0,11.6,7.34Z'/%3E%3Cpath fill='%23ffffff' d='M11.74,6.74,4.67,8.08A1,1,0,0,1,3.52,7.2h0A1.08,1.08,0,0,1,4.33,6l7.06-1.34a1,1,0,0,1,1.16.88h0A1.08,1.08,0,0,1,11.74,6.74Z'/%3E%3Cpath fill='%2303edf9' d='M4.5,8.64a1.44,1.44,0,0,1-.86-.29A1.64,1.64,0,0,1,3,7.29a1.72,1.72,0,0,1,.25-1.21,1.48,1.48,0,0,1,1-.67l7.07-1.34a1.39,1.39,0,0,1,1.11.27A1.65,1.65,0,0,1,13,5.4a1.72,1.72,0,0,1-.25,1.21,1.48,1.48,0,0,1-1,.67L4.76,8.62Zm7.07-3.5h-.09L4.42,6.49a.45.45,0,0,0-.32.22.56.56,0,0,0-.09.4.61.61,0,0,0,.21.35.47.47,0,0,0,.36.09L11.65,6.2A.47.47,0,0,0,12,6a.51.51,0,0,0,.08-.4.55.55,0,0,0-.2-.35A.47.47,0,0,0,11.57,5.14Z'/%3E%3Cpath fill='%23ffffff' d='M11.7,4.52,4.64,5.86A1,1,0,0,1,3.49,5h0A1.09,1.09,0,0,1,4.3,3.72l7.06-1.34a1,1,0,0,1,1.15.88h0A1.09,1.09,0,0,1,11.7,4.52Z'/%3E%3Cpath fill='%2303edf9' d='M4.46,6.42a1.36,1.36,0,0,1-.85-.3,1.58,1.58,0,0,1-.61-1A1.61,1.61,0,0,1,4.21,3.19l7.07-1.34a1.35,1.35,0,0,1,1.11.27,1.58,1.58,0,0,1,.61,1,1.74,1.74,0,0,1-.25,1.22,1.44,1.44,0,0,1-1,.66L4.72,6.39A1.09,1.09,0,0,1,4.46,6.42Zm7.07-3.51h-.08L4.38,4.26a.53.53,0,0,0-.4.62.5.5,0,0,0,.57.44L11.62,4a.47.47,0,0,0,.32-.22.62.62,0,0,0,.08-.4.56.56,0,0,0-.2-.35A.53.53,0,0,0,11.53,2.91Z'/%3E%3Cpath fill='%23ffffff' d='M8.34,2.89,4.57,3.6a1,1,0,0,1-1.15-.88h0a1.08,1.08,0,0,1,.81-1.25L8,.75a1,1,0,0,1,1.15.89h0A1.08,1.08,0,0,1,8.34,2.89Z'/%3E%3Cpath fill='%2303edf9' d='M4.4,4.16a1.44,1.44,0,0,1-.86-.29,1.69,1.69,0,0,1-.61-1.05A1.74,1.74,0,0,1,3.18,1.6a1.51,1.51,0,0,1,1-.67L7.91.22A1.38,1.38,0,0,1,9,.49a1.58,1.58,0,0,1,.61,1.05,1.74,1.74,0,0,1-.25,1.22,1.47,1.47,0,0,1-1,.66l-3.77.72A1.18,1.18,0,0,1,4.4,4.16ZM8.17,1.28H8.09L4.32,2A.45.45,0,0,0,4,2.23a.51.51,0,0,0-.08.4.55.55,0,0,0,.2.35.49.49,0,0,0,.37.09l3.77-.72a.47.47,0,0,0,.32-.22.62.62,0,0,0,.08-.4.56.56,0,0,0-.2-.35A.53.53,0,0,0,8.17,1.28Z'/%3E%3Cpolygon fill='%231e1e1e' points='5.5 11.1 5.5 11.1 5.5 14.4 7.1 16 9.1 16 10.6 14.4 10.6 11.1 5.5 11.1'/%3E%3Cpath fill='%23c5c5c5' d='M6.5,12h3v1h-3Zm1,3H8.6l.9-1h-3Z'/%3E%3C/svg%3E") 50% no-repeat !important;
  filter: drop-shadow(0 0 5px #03edf9);
}
```
```css
monaco-editor .margin, .monaco-editor-background, .monaco-editor .inputarea.ime-input {
  background: transparent;
}

/* Add the subtle gradient to the editor background */
.monaco-editor {
  background-color: transparent !important;
  background-image: linear-gradient(to bottom, #2a2139 75%, #34294f);
  background-size: auto 100vh;
  background-position: top;
  background-repeat: no-repeat;
}

/* Sweet sunset dots */
.monaco-workbench .activitybar>.content .monaco-action-bar .badge .badge-content {
  background: linear-gradient(to bottom, #fff951 25%, #fc28a8);
}

/* Active tab neon */
.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit.active {
  box-shadow: inset 0 -5px 25px #fc28a825;
  position: relative;
}

/* Active tab stripe */
.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit.active::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(to right, #fc28a8, #03edf9) !important;
  opacity: 1;
  z-index: 6;
}

.monaco-workbench .part.editor>.content .editor-group-container>.title .tabs-container>.tab.sizing-fit::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  right: 0;
  height: 0px;
  transition: opacity 1s;
  opacity: 0;
  z-index: 6;
}

/* Active sidebar item */
.monaco-workbench .activitybar>.content .monaco-action-bar .action-item.checked {
  box-shadow: inset 0 -5px 25px #fc28a825;
  position: relative;
}

.monaco-workbench .activitybar>.content .monaco-action-bar .action-item.checked::after {
  content: '';
  position: absolute;
  bottom: 0px;
  top: 0px;
  left: 0px;
  width: 4px;
  background: linear-gradient(to bottom, #fc28a8, #03edf9) !important;
  opacity: 1;
}

.monaco-workbench .activitybar>.content .monaco-action-bar .action-item::after {
  content: '';
  position: absolute;
  bottom: 0px;
  top: 0px;
  left: 0px;
  width: 0px;
  transition: opacity 1s;
  opacity: 0;
}

/* update lightbuld to be neon */
.lightbulb-glyph {
  background:  url("data:image/svg+xml,%3Csvg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Crect fill='%23ffffff' x='5.68' y='6.93' width='2.1' height='6.1' rx='0.96' transform='translate(-1.94 1.63) rotate(-12.09)'/%3E%3Cpath fill='%2303edf9' d='M7.08,13.5a1.46,1.46,0,0,1-1.43-1.16L4.77,8.26A1.47,1.47,0,0,1,5.9,6.53l.17,0A1.46,1.46,0,0,1,7.81,7.61l.87,4.09a1.46,1.46,0,0,1-1.12,1.73l-.18,0Zm-.7-6h-.1l-.17,0a.45.45,0,0,0-.29.21.45.45,0,0,0-.07.34l.88,4.09a.46.46,0,0,0,.54.35l.18,0a.46.46,0,0,0,.29-.2.48.48,0,0,0,.07-.35L6.83,7.82A.46.46,0,0,0,6.38,7.46Z'/%3E%3Crect fill='%23ffffff' x='8.22' y='6.93' width='2.1' height='6.1' rx='0.96' transform='translate(16.25 21.68) rotate(-167.91)'/%3E%3Cpath fill='%2303edf9' d='M8.93,13.5a1.63,1.63,0,0,1-.31,0l-.18,0A1.46,1.46,0,0,1,7.32,11.7l.87-4.09A1.47,1.47,0,0,1,9.93,6.49l.18,0a1.45,1.45,0,0,1,.92.63,1.47,1.47,0,0,1,.2,1.1l-.88,4.08a1.45,1.45,0,0,1-.63.93A1.48,1.48,0,0,1,8.93,13.5Zm.69-6a.45.45,0,0,0-.25.07.5.5,0,0,0-.2.29L8.3,11.9a.43.43,0,0,0,.06.35.46.46,0,0,0,.29.2l.18,0a.47.47,0,0,0,.55-.35l.87-4.09a.45.45,0,0,0-.06-.34A.47.47,0,0,0,9.9,7.5l-.18,0Z'/%3E%3Cpath fill='%23ffffff' d='M11.77,9l-3.53.67a1,1,0,0,1-1.15-.88h0A1.09,1.09,0,0,1,7.9,7.48l3.53-.67a1,1,0,0,1,1.15.89h0A1.08,1.08,0,0,1,11.77,9Z'/%3E%3Cpath fill='%2303edf9' d='M8.07,10.18A1.54,1.54,0,0,1,6.6,8.83a1.74,1.74,0,0,1,.25-1.22,1.46,1.46,0,0,1,1-.66l3.52-.67A1.51,1.51,0,0,1,13.07,7.6a1.61,1.61,0,0,1-1.22,1.88l-3.52.67A1.15,1.15,0,0,1,8.07,10.18ZM11.6,7.34h-.09L8,8a.53.53,0,0,0-.4.62.5.5,0,0,0,.57.44l3.52-.67a.54.54,0,0,0,.41-.62A.53.53,0,0,0,11.6,7.34Z'/%3E%3Cpath fill='%23ffffff' d='M11.74,6.74,4.67,8.08A1,1,0,0,1,3.52,7.2h0A1.08,1.08,0,0,1,4.33,6l7.06-1.34a1,1,0,0,1,1.16.88h0A1.08,1.08,0,0,1,11.74,6.74Z'/%3E%3Cpath fill='%2303edf9' d='M4.5,8.64a1.44,1.44,0,0,1-.86-.29A1.64,1.64,0,0,1,3,7.29a1.72,1.72,0,0,1,.25-1.21,1.48,1.48,0,0,1,1-.67l7.07-1.34a1.39,1.39,0,0,1,1.11.27A1.65,1.65,0,0,1,13,5.4a1.72,1.72,0,0,1-.25,1.21,1.48,1.48,0,0,1-1,.67L4.76,8.62Zm7.07-3.5h-.09L4.42,6.49a.45.45,0,0,0-.32.22.56.56,0,0,0-.09.4.61.61,0,0,0,.21.35.47.47,0,0,0,.36.09L11.65,6.2A.47.47,0,0,0,12,6a.51.51,0,0,0,.08-.4.55.55,0,0,0-.2-.35A.47.47,0,0,0,11.57,5.14Z'/%3E%3Cpath fill='%23ffffff' d='M11.7,4.52,4.64,5.86A1,1,0,0,1,3.49,5h0A1.09,1.09,0,0,1,4.3,3.72l7.06-1.34a1,1,0,0,1,1.15.88h0A1.09,1.09,0,0,1,11.7,4.52Z'/%3E%3Cpath fill='%2303edf9' d='M4.46,6.42a1.36,1.36,0,0,1-.85-.3,1.58,1.58,0,0,1-.61-1A1.61,1.61,0,0,1,4.21,3.19l7.07-1.34a1.35,1.35,0,0,1,1.11.27,1.58,1.58,0,0,1,.61,1,1.74,1.74,0,0,1-.25,1.22,1.44,1.44,0,0,1-1,.66L4.72,6.39A1.09,1.09,0,0,1,4.46,6.42Zm7.07-3.51h-.08L4.38,4.26a.53.53,0,0,0-.4.62.5.5,0,0,0,.57.44L11.62,4a.47.47,0,0,0,.32-.22.62.62,0,0,0,.08-.4.56.56,0,0,0-.2-.35A.53.53,0,0,0,11.53,2.91Z'/%3E%3Cpath fill='%23ffffff' d='M8.34,2.89,4.57,3.6a1,1,0,0,1-1.15-.88h0a1.08,1.08,0,0,1,.81-1.25L8,.75a1,1,0,0,1,1.15.89h0A1.08,1.08,0,0,1,8.34,2.89Z'/%3E%3Cpath fill='%2303edf9' d='M4.4,4.16a1.44,1.44,0,0,1-.86-.29,1.69,1.69,0,0,1-.61-1.05A1.74,1.74,0,0,1,3.18,1.6a1.51,1.51,0,0,1,1-.67L7.91.22A1.38,1.38,0,0,1,9,.49a1.58,1.58,0,0,1,.61,1.05,1.74,1.74,0,0,1-.25,1.22,1.47,1.47,0,0,1-1,.66l-3.77.72A1.18,1.18,0,0,1,4.4,4.16ZM8.17,1.28H8.09L4.32,2A.45.45,0,0,0,4,2.23a.51.51,0,0,0-.08.4.55.55,0,0,0,.2.35.49.49,0,0,0,.37.09l3.77-.72a.47.47,0,0,0,.32-.22.62.62,0,0,0,.08-.4.56.56,0,0,0-.2-.35A.53.53,0,0,0,8.17,1.28Z'/%3E%3Cpolygon fill='%231e1e1e' points='5.5 11.1 5.5 11.1 5.5 14.4 7.1 16 9.1 16 10.6 14.4 10.6 11.1 5.5 11.1'/%3E%3Cpath fill='%23c5c5c5' d='M6.5,12h3v1h-3Zm1,3H8.6l.9-1h-3Z'/%3E%3C/svg%3E") 50% no-repeat !important;
}
```

## Kary Pro Colors
Id: karyfoundation.theme-karyfoundation-themes
Description: The famous, carefully harmonized themes loved by thousands.
Version: 18.2.1
Publisher: Pouya Kary
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=karyfoundation.theme-karyfoundation-themes

## Name: Vue Theme
Id: mariorodeghiero.vue-theme
Description: Theme inspired by vue.js
Version: 1.1.2
Publisher: mariorodeghiero
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=mariorodeghiero.vue-theme


### Name: Eva Theme
Id: fisheva.eva-theme
Description: A colorful and semantic coloring code theme. Dark | Light. Regular | Bold
Version: 0.7.6
Publisher: fisheva
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=fisheva.eva-theme

The above screenshots' font is CamingoCode. If you like, download and add it into system font folder, then open VSCode → Preferences → Settings :

"editor.fontFamily": "CamingoCode",
After trying multiple icon themes, I think file-icons is the best match for Eva Theme.

For a better experience, I recommend an awesome plugin Bracket Pair Colorizer for you.

Here is my Bracket Pair Colorizer setting:

##### Match Eva Dark theme
```json
"bracketPairColorizer.showHorizontalScopeLine": false,
"bracketPairColorizer.showVerticalScopeLine": false,
"bracketPairColorizer.consecutivePairColors": [
        "()",
        "[]",
        "{}",
        [
        "#838FA7",
        "#A78CFA",
        "#56B7C3",
        "#FF9070"
        ],
        "#e51400"
    ]
    ```
##### Match Eva Light theme

```json
"bracketPairColorizer.showHorizontalScopeLine": false,
"bracketPairColorizer.showVerticalScopeLine": false,
"bracketPairColorizer.consecutivePairColors": [
        "()",
        "[]",
        "{}",
        [
        "#5D5D5FD8",
        "#7C4DFF",
        "#00BEC4",
        "#ff6500"
        ],
        "#e51400"
    ]
```
Name: Material Theme
Id: equinusocio.vsc-material-theme
Description: The most epic theme now for Visual Studio Code
Version: 2.8.2
Publisher: Mattia Astorino
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme

### Recommendations

Override theme colors
You can override the Material Theme UI and schemes colors by adding these theme-specific settings to your configuration. For advanced customisation please check the relative section on the VS Code documentation.

Color Scheme override
Basic example

```json
"editor.tokenColorCustomizations": {
    "[Material Theme]": {
        "comments": "#229977"
    }
},
Advanced example

"editor.tokenColorCustomizations": {
    "[Material Theme VARIANT]": {
        "sideBar.background": "#347890",
        "textMateRules": [
            {
                "scope": [
                    "punctuation.definition.comment",
                    "comment.block",
                    "comment.line",
                    "comment.block.documentation"
                ],
                "settings": {
                    "foreground": "#FF0000"
                }
            }
        ]
    },
},
Recommended settings for a better experience
{
    // Controls the font family.
    "editor.fontFamily": "Operator Mono",
    // Controls the line height. Use 0 to compute the lineHeight from the fontSize.
    "editor.lineHeight": 24,
    // Enables font ligatures
    "editor.fontLigatures": true,
    // Controls if file decorations should use badges.
    "explorer.decorations.badges": false
}
```

## Horizon Theme
Id: jolaleye.horizon-theme-vscode
Description: A beautifully warm dark theme for Visual Studio Code
Version: 1.8.1
Publisher: Jonathan Olaleye
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=jolaleye.horizon-theme-vscode

### Requires":

### Settings

"workbench.colorCustomizations": {
  "activityBar.background": "#1E2028",
  "activityBar.border": "#1E2028",
  "sideBar.background": "#1E2028",
  "sideBar.border": "#1C1E26"
}

removing italics:

```json
"editor.tokenColorCustomizations": {
  "textMateRules": [
    {
      "name": "No italics",
      "scope": ["comment", "variable.language", "variable.parameter"],
      "settings": {
        "fontStyle": ""
      }
    }
  ]
}
```

For gray rather than red brackets around HTML tags...
```
"editor.tokenColorCustomizations": {
  "textMateRules": [
    {
      "name": "HTML tag brackets",
      "scope": ["punctuation.definition.tag"],
      "settings": {
        "foreground": "#BBBBBB"
      }
    }
  ]
}
```

yntax Colors
Note: All syntax colors have 90% opacity so that they're easier on the eyes :)

Color	Usage
 #B877DB	Keywords, template literals & embedded punctuation (e.g. ${} or {} )
 #E95678	Variables, property names, tags, markup headings
 #25B0BC	Functions, escape characters, CSS #ids
 #F09483	Constants, regex, attributes, units, CSS .classes
 #FAB795	Strings, pseudo CSS, inherited classes, markup links
 #FAC29A	Special keywords, classes
Terminal Colors
Color	Normal	Bright
Blue	 #26BBD9	 #3FC4DE
Cyan	 #59E1E3	 #6BE4E6
Green	 #29D398	 #3FDAA4
Magenta	 #EE64AC	 #F075B5
Red	 #E95678	 #EC6A88
Yellow	 #FAB795	 #FBC3A7

UI Colors Color	Usage
 #1C1E26	Primary background
 #232530	Light background (popups & widgets)
 #2E303E	Selection, highlights, input field background
 #6C6F93	Accents (e.g. scrollbar, drag and drop highlights)
 #F43E5C	Errors, deletion highlights
 #E95378	Accents (e.g. active tab, badges)
 #FAB38E	Debugging status bar
 #FAC39A	Modified Git decoration (explorer)
 #21BFC2	Modified highlights (gutter & scrollbar ruler)
 #27D797	Warning highlights, untracked resources
 #09F7A0	Addition highlights

 Name: Panda Theme
Id: tinkertrain.theme-panda
Description: Panda Theme for Visual Studio Code.
Version: 1.3.0
Publisher: Panda Theme
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=tinkertrain.theme-panda

 Operator Mono.


 Name: Sublime Material Theme
Id: jprestidge.theme-material-theme
Description: Port of the Material Theme for Sublime Text.
Version: 1.0.1
Publisher: Jarvis Prestidge
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=jprestidge.theme-material-theme

Name: Nord
Id: arcticicestudio.nord-visual-studio-code
Description: An arctic, north-bluish clean and elegant Visual Studio Code theme.
Version: 0.8.0
Publisher: arcticicestudio
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code
Icons provided by Material Icon Theme.

### Recomendations
Font: Source Code Pro 20px

Name: Hopscotch (Official)
Id: idleberg.hopscotch
Description: Color scheme inspired by the Hopscotch learning platform for kids
Version: 0.2.2
Publisher: idleberg
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=idleberg.hopscotch

Name: Dark+ Material
Id: vangware.dark-plus-material
Description: The default Dark+ Theme, with material palette and always up to date
Version: 2.0.7
Publisher: vangware
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=vangware.dark-plus-material

### Recomendations

Material Icon Theme (by Philipp Kief): Beautiful icon theme that looks awesome with this theme.
FiraCode (by Nikita Prokopov): The best code ligature font I found, used in the screenshots.

Name: Noctis
Id: liviuschera.noctis
Description: Noctis is a collection of light & dark themes with a well balanced blend of warm and cold colors
Version: 8.3.0
Publisher: Liviu Schera
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis

The theme is designed to:

be easy on the eyes thus reducing the eye strain
give semantic meaning to theme's colors
Noctis comes in nine versions. Seven are dark and two are light.

Noctis, Noctis Sereno & Noctis Obscuro background is a very saturated very dark cold bluish cyan
Noctis Azureus' background is a very saturated very dark cold azure
Noctis Uva's background is a unsaturated dark cold blue. For those with more spartan taste
Noctis Minimus' background offers a version of the Azureus palette with much lower saturation. (Thank you Draevin for your contribution)
Noctis Viola's background is a saturated very dark cold violet
Noctis Lux' background is a very saturated very light warm orange
Noctis Hibernus' background is a very unsaturated very light cold bluish cyan

### Recomendations
The font in the screenshots are actually 2 fonts glued together with Custom CSS. For normal style I used Hasklig and for italics Cartograph Mono CF. I think there is a beautiful synergy between the two fonts and they intertwine naturally together.

The walkthrough is for Windows. I assume that for Unix and MacOS you would have to change only the path.

IMPORTANT: Run as administrator VS Code
install Custom CSS and JS Loader
download or copy the content of [customvscode.css](https://github.com/liviuschera/noctis/blob/master/vscodecustom.css)
copy customvscode.css in C:\Users\your-own-username. As an example this is what I have on my system: C:\Users\liviuschera\customvscode.css
in settings.json add:
  "editor.fontFamily": "Hasklig",
  "vscode_custom_css.imports":
    [
      "file://C:/Users/yourusername/vscodecustom.css"
    ],
press F1
select Enable Custom CSS and JS
reload VS Code (it doesn't have to be in administrator mode)

```json

 "editor.fontFamily": "Hasklig",
  "vscode_custom_css.imports":
    [
      "file://C:/Users/yourusername/vscodecustom.css"
    ],

```

```json


/* /// OPTIONAL ///
you can comment out this part if you don't want to change the default font for the UI
*/

.monaco-shell .windows {
   font-feature-settings: "ss01";
   font-family: "Cartograph Mono CF", monospace;
}

/* /// REQUIRED ///
classes for italics
*/
[class^="mtk"].mtki {
   font-feature-settings: "ss01";
   font-family: "Cartograph Mono CF";
}

```
#### Standard Colors
Color	Hex Code	Used for:
Eucalyptus	#49e9a6 #49e9a6	Strings
Mountain Meadow	#16b673 #16b673	Interpolated Strings
Horizon	#5b858b #5b858b	Comments for default theme
Smalt Blue	#507b95 #507b95	Comments for Azureus variant
Kimberly	#716c93 #716c93	Comments for Uva variant
Trendy Pink	#7f659a #7f659a	Comments for Viola variant
Eastern Blue	#16a3b6 #16a3b6	Function Calls
Turcoise	#49d6e9 #49d6e9	Method Calls
Picton Blue	#49ace9 #49ace9	Code that needs to stand out
Cornflower Blue	#7060eb #7060eb	Numbers & Booleans
Pale Violet Red	#df769b #df769b	Keywords & Operators
Cinnabar	#e66533 #e66533	Function & Variable Declaration, Tags & this
Japonica	#d67e5c #d67e5c	Object properties, ID selectors in CSS & Type annotations
Galliano	#d5971a #d5971a	Attributes, Constants
Gold Sand	#e4b781 #e4b781	Variables & Parameters

#### Minimus Colors
Color	Hex Code	Used for:
Silver Tree	#70c27f #70c27f	Strings
Viridian	#3f8d6c #3f8d6c	Interpolated Strings
Hoki	#5e7887 #5e7887	Comments
Ming	#3f848d #3f848d	Function Calls
Glacier	#72b7c0 #72b7c0	Method Calls
Fountain Blue	#5998c0 #5998c0	Code that needs to stand out
Chetwode Blue	#7068B1 #7068B1	Numbers & Booleans
Viola	#c88da2 #c88da2	Keywords & Operators
Antique Brass	#c37455 #c37455	Function & Variable Declaration, Tags & this
Contessa	#be856f #be856f	Object properties, ID selectors in CSS & Type annotations
Driftwood	#b0904f #b0904f	Attributes, Constants
Tan	#d3b692 #d3b692	Variables & Parameters

#### Light Themes Colors
Color	Hex Code	Used for:
Jade	#00b368 #00b368	Strings
Green Haze	#009456 #009456	Interpolated Strings
Cascade	#8ca6a6 #8ca6a6	Comments
Bondi Blue	#0095a8 #0095a8	Function Calls
Robin's Egg Blue	#00bdd6 #00bdd6	Method Calls
Azure Radiance	#0094f0 #0094f0	Code that needs to stand out
Electric Violet	#5842ff #5842ff	Numbers & Booleans
PBrink Pink	#ff5792 #ff5792	Keywords & Operators
Trinidad	#e64100 #e64100	Function & Variable Declaration, Tags & this
Santa Fe	#ba785e #ba785e	Object properties, ID selectors in CSS & Type annotations
Dark Goldenrod	#a88c00 #a88c00	Attributes, Constants
Yellow Sea	#f49725 #f49725	Variables & Parameters

#### Installation
Noctis can be installed by clicking on Ctrl + Shift + X on Windows or ⇧ + ⌘ + X on Mac and then searching for "Noctis".

How to contribute
Beginning with v7.21.0 the theme building process has been simplified. I started off with the idea used in Lucy theme and came up with this theme generator powered by Node.js. This will allow me or any contributor to easily add/suggest new theme variants or changes to the existing ones. In ./src/ folder you will find:

syntax.mjs → syntax tokens based on the language grammar installed
colors.mjs → the colors used for syntax highlighting
./src/workbench/ → all eight theme versions containing Workbench/UI colors
After you make a change in any of the above files you need to use npm run build command. The build output folder is ./themes/

Happy hacking!

Name: Palenight Theme
Id: whizkydee.material-palenight-theme
Description: An elegant and juicy material-like theme for Visual Studio Code.
Version: 1.9.5
Publisher: whizkydee
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=whizkydee.material-palenight-theme

Psst! If you have the Operator Mono font installed, find Palenight Operator in the theme list. Also, check out Palenight Italic for a less operator-mono-ish experience.

Name: Bracket Pair Colorizer
Id: coenraads.bracket-pair-colorizer
Description: A customizable extension for colorizing matching brackets
Version: 1.0.61
Publisher: CoenraadS
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer
Settings
"bracketPairColorizer.timeOut"
Configure how long the editor should be idle for before updating the document.
Set to 0 to disable.

"bracketPairColorizer.forceUniqueOpeningColor"
Disabled Enabled

"bracketPairColorizer.forceIterationColorCycle"
Enabled

"bracketPairColorizer.colorMode"
Consecutive brackets share a color pool for all bracket types
Independent brackets allow each bracket type to use its own color pool
Consecutive Independent

"bracketPairColorizer.highlightActiveScope"
Should the currently scoped brackets always be highlighted?

"bracketPairColorizer.activeScopeCSS"
Choose a border style to highlight the active scope. Use {color} to match the existing bracket color
It is recommended to disable the inbuilt editor.matchBrackets setting if using this feature
BorderStyle
Tip: Add the value "backgroundColor : {color}" to increase visibility
BorderBackground

"bracketPairColorizer.showBracketsInGutter"
Show active scope brackets in the gutter
Gutter

"bracketPairColorizer.showBracketsInRuler"
Show active scope brackets in the ruler

"bracketPairColorizer.rulerPosition"
Decoration position in the ruler

"bracketPairColorizer.showVerticalScopeLine"
Show a vertical line between the brackets? Enabled by default
Scope Line

"bracketPairColorizer.showHorizontalScopeLine"
Show a horizontal line between the brackets? Enabled by default
Scope Line

"bracketPairColorizer.scopeLineRelativePosition"
Disable this to show the vertical line in column 0
Scope Line

"bracketPairColorizer.scopeLineCSS"
Choose a border style to highlight the active scope. Use {color} to match the existing bracket color

"bracketPairColorizer.consecutivePairColors"
A new bracket pair can be configured by adding it to the array.
Note: Pair must be supported punctuation type by Prism.js

"bracketPairColorizer.independentPairColors"
A new bracket pair can be configured by adding it to the array.
Note: Pair must be supported punctuation type by Prism.js

"bracketPairColorizer.excludedLanguages"
Exclude languages from being parsed by this extension

Commands
These commands will expand/undo the cursor selection to the next scope

"bracket-pair-colorizer.expandBracketSelection"
"bracket-pair-colorizer.undoBracketSelection"

Quick-start:

    {
        "key": "shift+alt+right",
        "command": "bracket-pair-colorizer.expandBracketSelection",
        "when": "editorTextFocus"
    },
    {
        "key": "shift+alt+left",
        "command": "bracket-pair-colorizer.undoBracketSelection",
        "when": "editorTextFocus"
    }
HTML Configuration
An example configuration for HTML is:

    "bracketPairColorizer.consecutivePairColors": [
        ["<", "</"],
        ["<", "/>"],
        [
            "Gold",
            "Orchid",
            "LightSkyBlue"
        ],
        "Red"
    ]

  ##
  Name: Ayu
Id: teabyii.ayu
Description: A simple theme with bright colors and comes in three versions — dark, light and mirage for all day long comfortable work.
Version: 0.18.0
Publisher: teabyii
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=teabyii.ayu

##  Night Owl
Id: sdras.night-owl
Description: A VS Code theme for the night owls out there. Now introducing Light Owl theme for daytime usage. Decisions were based on meaningful contrast for reading comprehension and for optimal razzle dazzle. ✨
Version: 1.1.3
Publisher: sarah.drasner
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=sdras.night-owl

"workbench.colorCustomizations": {
  "[Night Owl]": {
    "activityBar.background": "#000C1D",
    "activityBar.border": "#102a44",
    "sideBar.background": "#001122",
    "sideBar.border": "#102a44",
    "sideBar.foreground": "#8BADC1"
  },
  "[Night Owl No Italics]": {
    "activityBar.background": "#000C1D",
    "activityBar.border": "#102a44",
    "sideBar.background": "#001122",
    "sideBar.border": "#102a44",
    "sideBar.foreground": "#8BADC1"
  }
},

The font in the preview image is Dank Mono, available here. Editor settings to activate font ligatures:

"editor.fontFamily": "Dank Mono",
"editor.fontLigatures": true,
The preview image is using Bracket Pair Colorizer, a really cool extension that highlights matching brackets. This can help reduce unwanted errors.

I use this setting:

"bracketPairColorizer.forceIterationColorCycle": true,
Bracket

Misc