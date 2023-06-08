# CSS

## 

Absolute Lengths
The absolute length units are fixed and a length expressed in any of these will appear as exactly that size.

Absolute length units are not recommended for use on screen, because screen sizes vary so much. However, they can be used if the output medium is known, such as for print layout.

Unit	Description
- `cm`	centimeters
- `mm`	millimeters
- `in`	inches (1in = 96px = 2.54cm)
- `px` *	pixels (1px = 1/96th of 1in)
- `pt`	points (1pt = 1/72 of 1in)
- `pc`	picas (1pc = 12 pt)
* Pixels (px) are relative to the viewing device. For low-dpi devices, 1px is one device pixel (dot) of the display. For printers and high resolution screens 1px implies multiple device pixels.

Relative Lengths
Relative length units specify a length relative to another length property. Relative length units scale better between different rendering medium.

Unit	Description	
em	Relative to the font-size of the element (2em means 2 times the size of the current font)	
- `ex`	Relative to the x-height of the current font (rarely used)
- `ch`	Relative to the width of the "0" (zero)
- `rem`	Relative to font-size of the root element
- `vw`	Relative to 1% of the width of the viewport*
- `vh`	Relative to 1% of the height of the viewport*
- `vmin`	Relative to 1% of viewport's* smaller dimension
- `vmax`	Relative to 1% of viewport's* larger dimension
- `%`	Relative to the parent element


## CSS

[https://developer.mozilla.org/en-US/docs/Learn/CSS/First\_steps](https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps)

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks)

Format is 

      (selector) {
         (property):(value);
      }

### CSS Selectors

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks/Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors)

[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS\_Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)

any syntax error in a rule definition invalidates the entire rule. Invalid rules are ignored by the browser.

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks/Selectors/Type\_Class\_and\_ID\_Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Type_Class_and_ID_Selectors)



#### Element Selector

Just the element type:

      h1 {

      }
      div {

      }

Grouping classes

      h1, div, h2 {
         color: white;
      }

#### Class

HTML elements with class="center" will be red and center-aligned: 

      .center {
      text-align: center;
      color: red;
      }

Elements and class

      p.center {
         color: red;
      }

Now only p objects (paragraph) of class "center" are styled


      <p class="center"> </p>

We cqan also require more than one class be required

      .notebox.warning {
      border-color: orange;
      font-weight: bold;
      }

      .notebox.danger {
      border-color: red;
      font-weight: bold;
      }

Here an object has to have the `notebox` class AND the `warning` or `danger` class.  Like `<div class="notebox warning">text<\div>`


#### id selector

Uses the '#' syntax

      #name {
         color: black;
      }

      <div id="name"> </div>

We can also require element and id like

      h1#ourheading {
         background-color:blue;
      }


#### Universal Selector

The universal selector (*) selects all HTML elements on the page.

The CSS rule below will affect every HTML element on the page: 

      * {
      text-align: center;
      color: blue;
      }

#### Attribute selectors

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks/Selectors/Attribute\_selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Attribute_selectors)

prefaced with an `a`.  Looks at an attribute value

Just the prescence of an attribute

      a[title] {
      }

Or a specific attribute value

      a[href="https://example.com"]
      {
      }

#### Psuedoclass and Pseudoelements

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks/Selectors/Pseudo-classes\_and\_pseudo-elements](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements)

Pseudoclass- a class which is enabled with an action. e.g. when hovering the mouse and object gains the class `:hover` in its class list

Active during a mouse hover

      a:hover {
      }

and selecting sub-parts of an element:

      p::first-line {
      }

#### Combinators

[https://developer.mozilla.org/en-US/docs/Learn/CSS/Building\_blocks/Selectors/Combinators](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Combinators)

Decendent combinators are separated by a space ` `

      body article p {

      }

for :

      <div class="box"><p>Text in .box</p></div>
      <p>Text not in .box</p>

With:

      .box p {
         color: red;
      }  

The first text is matched but the second is not.

Using the child combinator `>` - only *direct* decendants are matched.

      article > p {
      }  


for example, selects paragraphs that are direct children of <article> elements using the child combinator (>):
