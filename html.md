# HTML


## Basics 

`'` and `"` are interchangable.

You can not quote an attribute w/value as long as its the only one.

All the HTML Tags on a page
[Source](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)


Basic Arrangement

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
    <p>This is my page</p>
  </body>
</html>
```

Doctypes used to look something like this:
`<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">`
More recently, the doctype is a historical artifact that needs to be included for everything else to work right. `<!DOCTYPE html>` is the shortest string of characters that counts as a valid doctype. 

!!!Note Whitespace:
        No matter how much whitespace you use inside HTML element content (which can include one or more space character, but also line breaks), the HTML parser reduces each sequence of whitespace to a single space when rendering the code. So why use so much whitespace? The answer is readability.

        Line breaks are the same, while they may exist in a block of text they are removed in html.

### Comments

`<!-- <p>I am!</p> -->`


### Header Tags

#### meta

has some specific attributes, and then anything else
<meta charset="utf-8">
<meta name="author" content="Chris Mills">
<meta name="description" content="The MDN Web Docs Learning Area aims to...">  -- description is used for SEO.  The `<title>` attribute and `<meta name="description" content="content"> is used in search engine results directly as the found page.

The sitelinks/ subheadings in google search results can be configured [here:](https://search.google.com/search-console/welcome?hl=en&utm_source=wmx&utm_medium=deprecation-pane&utm_content=home)

![](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML/mdn-search-result.png)
  
For example, [Open Graph Data](https://ogp.me/) is a metadata protocol that Facebook invented to provide richer metadata for websites. In the MDN Web Docs sourcecode, you'll find this:

For social media post fillers see [undefined](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML#other_types_of_metadata)

#### Favicon

A favicon can be added to your page by:

Saving it in the same directory as the site's index page, saved in .ico format (most browsers will support favicons in more common formats like .gif or .png, but using the ICO format will ensure it works as far back as Internet Explorer 6.)
Adding the following line into your HTML's `<head>` block to reference it:
`<link rel="icon" href="favicon.ico" type="image/x-icon">`

mozilla favicon example

```html
<!-- third-generation iPad with high-resolution Retina display: -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="https://developer.mozilla.org/static/img/favicon144.png">
<!-- iPhone with high-resolution Retina display: -->
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="https://developer.mozilla.org/static/img/favicon114.png">
<!-- first- and second-generation iPad: -->
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="https://developer.mozilla.org/static/img/favicon72.png">
<!-- non-Retina iPhone, iPod Touch, and Android 2.1+ devices: -->
<link rel="apple-touch-icon-precomposed" href="https://developer.mozilla.org/static/img/favicon57.png">
<!-- basic favicon -->
<link rel="icon" href="https://developer.mozilla.org/static/img/favicon32.png">

```

#### link and script

both of these belong in the header.

`<link rel="stylesheet" href="my-css-file.css">`
`<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TimelineMax.min.js" integrity="sha512-0xrMWUXzEAc+VY7k48pWd5YT6ig03p4KARKxs4Bqxb9atrcn2fV41fWs+YXTKb8lD2sbPAmZMjKENiyzM/Gagw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js" integrity="sha512-DkPsH9LzNzZaZjCszwKrooKwgjArJDiEjA5tTgr3YX4E6TYv93ICS8T41yFHJnnSmGpnf0Mvb5NhScYbwvhn2w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="./style.css">`



>The [`<script>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script) element 
> should also go into the head, and should include a `src` attribute containing the path to the 
> JavaScript you want to load, and `defer`, which basically instructs the browser to load the 
> JavaScript after the page has finished parsing the HTML. This is useful as it makes sure that 
> the HTML is all loaded before the JavaScript runs, so that you don't get errors resulting from 
> JavaScript trying to access an HTML element that doesn't exist on the page yet.

#### Lang

<html lang="en-US">



## Escapes and special Characters

Literal character	Character reference equivalent

These are the most important as they are reserved characters in HTML.

<	&lt;
>	&gt;
"	&quot;
'	&apos;
&	&amp;


[More Entities](https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references)

You can insert the char by either its name `&num;` preceeded by an amperstand and closed by a semicolon, or use its number `&#x0023;` to give the number in hexadecimal, or like `&#35;`

There are hundreds of character, the whole char map, see the link above.  XML has a smaller set.

!!!Note Symbols
        You don't need to use entity references for any other symbols, as modern browsers will handle the actual symbols just fine as long as your HTML's character encoding is set to UTF-8.

## All tags

-   [Main root](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#main_root)
-   [Document metadata](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#document_metadata)
-   [Sectioning root](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#sectioning_root)
-   [Content sectioning](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#content_sectioning)
-   [Text content](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#text_content)
-   [Inline text semantics](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#inline_text_semantics)
-   [Image and multimedia](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#image_and_multimedia)
-   [Embedded content](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#embedded_content)
-   [SVG and MathML](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#svg_and_mathml)
-   [Scripting](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#scripting)
-   [Demarcating edits](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#demarcating_edits)
-   [Table content](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#table_content)
-   [Forms](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#forms)
-   [Interactive elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#interactive_elements)
-   [Web Components](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#web_components)
-   [Obsolete and deprecated elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element#obsolete_and_deprecated_elements)

## Attributes:

e.g. class

an element with more than one attribute, the attributes should be separated by spaces. Format is attribute name, followed by an equal sign then an attribute value, wrapped with opening and closing quote marks.

`<p class="class-name id="paragraph1"> </p>`

`<a href="address" title="popup-hint-text" target="_blank">text to display follows </a>`

href, title and target are attributes for a (anchor)

!!!Note Title Attribute:
         A link title is only revealed on mouse hover, which means that people relying on keyboard controls or touchscreens to navigate web pages will have difficulty accessing title information. If a title's information is truly important to the usability of the page, then you should present it in a manner that will be accessible to all users, for example by putting it in the regular text.

## Tag specifics

### a (anchor)


`<a href="address" title="popup-hint-text" target="_blank">text to display follows </a>`

href, title and target are attributes for a (anchor)

!!!Note Title Attribute:
         A link title is only revealed on mouse hover, which means that people relying on keyboard controls or touchscreens to navigate web pages will have difficulty accessing title information. If a title's information is truly important to the usability of the page, then you should present it in a manner that will be accessible to all users, for example by putting it in the regular text.

Making an image a link.


```html
<a href="https://www.mozilla.org/en-US/">
  <img src="mozilla-image.png" alt="mozilla logo that links to the mozilla homepage">
</a>
```

### span

span is just used to wrap a block of text to refer to it in css, it has no function

or omit the 
Attributes: 

### Lists 

Declare with `<ul>`or `<ol>` and then put each list item in a `<li>` tag-  Unordered, Ordered, and List item respectively.

```html
<ol>
  <li>Remove the skin from the garlic, and chop coarsely.</li>
  <li>Remove all the seeds and stalk from the pepper, and chop coarsely.</li>
  <li>Add all the ingredients into a food processor.</li>
  <li>Process all the ingredients into a paste.
    <ul>
      <li>If you want a coarse "chunky" hummus, process it for a short time.</li>
      <li>If you want a smooth hummus, process it for a longer time.</li>
    </ul>
  </li>
</ol>
```

### strong, em, bold, italics and undelines

`<i>` is used to convey a meaning traditionally conveyed by italic: foreign words, taxonomic designation, technical terms, a thought...
`<b>` is used to convey a meaning traditionally conveyed by bold: key words, product names, lead sentence...
`<u>` is used to convey a meaning traditionally conveyed by underline: proper name, misspelling...


*disabled* - greys out the form obj,   <input type="text" disabled>

-   [button](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/button)
-   [checkbox](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/checkbox)
-   [color](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/color)
-   [date](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date)
-   [datetime-local](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime-local)
-   [datetime](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime)
-   [email](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/email)
-   [file](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file)
-   [hidden](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/hidden)
-   [image](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/image)
-   [month](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/month)
-   [number](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number)
-   [password](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/password)
-   [radio](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio)
-   [range](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range)
-   [reset](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/reset)
-   [search](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/search)
-   [submit](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/submit)
-   [tel](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/tel)
-   [text](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/text)
-   [time](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/time)
-   [url](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/url)
-   [week](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/week)