# Jasmine Helpers

Collection of small JavaScript helpers. These are intended to be used with JavaScript testing framework [Jasmine](https://github.com/pivotal/jasmine).

## How to use

TODO

## Documentation

- [simulateMouseEvent](#simulatemouseevent)

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
