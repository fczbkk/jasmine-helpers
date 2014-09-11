# Jasmine Helpers

Collection of small JavaScript helpers. These are intended to be used with JavaScript testing framework [Jasmine](https://github.com/pivotal/jasmine).

## How to use

The easiest way to add these helpers to your project is to use [Bower](http://bower.io/):

```shell
bower install jasmine-helpers
```

Then point to these helpers in your Jasmine runner. For example:

```html
<script src="bower_components/jasmine-helpers/helpers/simulate-event.js"></script>
```

If you are using [Grunt](http://gruntjs.com/) to run your Jasmine tests automatically (I highly recommend it), add the path to helpers in the configuration, like this:

```javascript
grunt.initConfig({
  jasmine: {
    pivotal: {
      src: '...',
      options: {
        specs: '...',
        helpers: 'bower_components/jasmine-helpers/helpers/*.js'
      }
    }
  }
});
```

## Documentation

- CSS
  - [getCssProperty](#getcssproperty)
- Elements
  - [isVisible](#isvisible)
  - [createPositionedElement](#createpositionedelement)
  - [insertPositionedElement](#insertpositionedelement)
  - [Note regarding positioned elements](#note-regarding-positioned-elements)
- Events
  - [simulateEvent](#simulateevent)
  - [simulateMouseEvent](#simulatemouseevent)


### getCssProperty

```javascript
getCssProperty(elment, property_name);
```

Returns computed value of CSS property for given element. Event the default values for undefined properties (e.g. `block` for `display` property in DIV).

The results are normalised. So asking for any size properties (e.g. `width`) will always return value in pixels, colors will be returned in `rgb(...)` format, etc. See examples below.

#### Parameters

**element**  
Reference to the element from which you'd like to retrieve value of CSS property.

**property_name**  
Name of the CSS property.

#### Examples

```html
<div id="myElement" style="width: 100px; background: red;"></div>
```

Get value of undefined property:

```javascript
getCssProperty(my_element, 'display');  // block
```

Get value of defined property:

```javascript
getCssProperty(my_element, 'width');  // 100px
```

Get value of normalized property:

```javascript
getCssProperty(my_element, 'background-color');  // rgb(255, 0, 0)
```


### isVisible

```javascript
isVisible(element);
```

Checks if element is present in the document and is visible. It will return `false` if:

- Element does not exist.
- Element exists, but is not inserted in the document.
- Element is hidden via CSS by either `display: none` or `visibility: hidden`.

#### Parameters

**element**  
Element which you'd like to check for visibility.

#### Examples

```javascript
isVisible(my_element);  // true
my_element.style.display = 'none';
isVisible(my_element);  // false
```



### createPositionedElement

```javascript
createPositionedElement(left, top, css_attributes);
```

Creates absolutely positioned DIV element and returns it. It does not insert it to the document (that's what `insertPositionedElement()` is for).

By default the size of the element is 100*100px. You can change this (and any other CSS attribute) via the third parameter.

#### Parameters

**left** (default `100`)  
**top** (default `100`)
Left and top position of the element.

**css_attributes**
Object with CSS attributes and their values. All these will be set to element

#### Examples

Returns absolutely positioned DIV element at position 0,0 and size 100*100px:

```javascript
var my_element = createPositionedElement();
```

Returns element positioned at 100,200:

```javascript
var my_element = createPositionedElement(100, 200);
```

Returns red element:

```javascript
var my_element = createPositionedElement(null, null, {background: 'red'});
```


### insertPositionedElement

```javascript
insertPositionedElement(left, top, parent_node, css_attributes);
```

This is basicaly the same as [`createPositionedElement()`], but it also inserts the created element to the document (or any other DOM node).

#### Parameters

**left** (default `100`)  
**top** (default `100`)  
Left and top position of the element.

**parent_node** (default `document.body`)  
DOM node into which created element should be inserted. This allows you to easily create nested DOM structures.

**css_attributes**  
Object with CSS attributes and their values. All these will be set to element

#### Examples

Insert new positioned element with default position to the BODY:

```javascript
var my_element = insertPositionedElement()
```

Nest one element into another:

```javascript
var outer_element = insertPositionedElement();
outer_element.parentNode; // document.body

var inner_element = insertPositionedElement(null, null, outer_element);
inner_element.parentNode; // outer_element
```



### NOTE regarding positioned elements

All positioned elements created using [`createPositionedElement()`](#createpositionedElement) or [`insertPositionedElement()`](#insertpositionedElement) have classname `created-positioned-element`. This is handy when you need to cleanup all created elements during your tests:

```javascript
describe('my tests', function () {

  afterEach(function () {
    // find all created elements inserted to the document...
    var elements = document.querySelectorAll('.created-positioned-element');
    // ...and remove them
    for (var i = 0; i < elements.length; i++) {
      elements[i].parentNode.removeChild(elements[i]);
    }
  });

  it('test that inserts elements', function () {
    // ...
  })

});
```



### simulateEvent

```javascript
simulateEvent(object, event_type)
```

This is handy if you want to test events that are otherwise hard to fire.

For example `window.onscroll` does not fire if you call `window.scrollTo()` or `window.scrollBy()` methods. If you need to test interactions when user scrolls the content, you will need to fire the event manually.

NOTE: Be careful when manually firing `window.onload` event. Every onload listener will be activated, not just the one you want to test. Which can have [funny effects on your testing environment](https://www.youtube.com/watch?v=lhkn9PaG0QQ).

#### Parameters

**object**  
Object that should fire the element. E.g. `window`.

**event_type**  
Any event name that can be fired. E.g. `scroll`.

#### Examples

Fire the `window.onscroll` event after you scroll the viewport:

```javascript
window.scrollBy(0, 100);
simulateEvent(window, 'scroll');
```


### simulateMouseEvent

```javascript
simulateMouseEvent(object, event_type, button, properties)
```

Simulates any mouse event. This is very handy when testing user interactions with the UI. Event object allows you to set lots of various properties, but most of the time, you just care about two of them: event type (usualy `click`) and mouse button (usualy `left`).

#### Parameters

**object**  
Which DOM object should receive the event. This should be a reference to an element or `document.body`.

**event_type** (default `click`)  
This is a list of valid values you can use: `click`, `mousedown`, `mouseup`, `mouseover`, `mousemove` and `mouseout`.

**button** (default `left`)  
Default value is `left`. This represents a mouse button that triggers the event. Valid values are: `left`, `right` and `middle`.

**properties**  
Object with event properties. You will probably only need this in special cases. For example when you need to specify exact coordinates of the mouse at the time of event. [See complete list of event properties at MDN.](https://developer.mozilla.org/en-US/docs/Web/API/event.initMouseEvent)

#### Examples

Left-click on the element:

```javascript
simulateMouseEvent(my_element);
```

Left mouse button pressed on the element:

```javascript
simulateMouseEvent(my_element, 'mousedown');
```

Right mouse button pressed on the element:

```javascript
simulateMouseEvent(my_element, 'mousedown', 'right');
```

Right mouse button pressed on  the element at coordinates `x: 100px, y: 100px`:

```javascript
simulateMouseEvent(my_element, 'mousedown', 'right', {
  clientX: 100, clientY: 100
});
```


## How to contribute

TODO

## Bug reports, feature requests and contact

If you found any bugs, if you have feature requests or any questions, please, either [file an issue at GitHub](https://github.com/fczbkk/jasmine-helpers/issues) or send me an e-mail at [riki@fczbkk.com](mailto:riki@fczbkk.com).

## License

JS Helpers is published under the [UNLICENSE license](https://github.com/fczbkk/jasmine-helpers/blob/master/UNLICENSE). Feel free to use it in any way.
