# JS Helpers

Collection of small JavaScript helpers. These are usable either in regular JavaScript projects, or with testing frameworks (e.g. Jasmine).

## Documentation

### simulateMouseEvent(obj[, properties])

Simulates any mouse event. If not configured otherwise, simulates a click on
the element.

```javascript
// click on element
simulateMouseEvent(my_element);

// right-click on element
simulateMouseEvent(my_element, {button: 2});

// middle mouse button pressed on element
simulateMouseEvent(my_element, {type: 'mousedown', button: 1})
```

[See complete list of event properties at MDN.](https://developer.mozilla.org/en-US/docs/Web/API/event.initMouseEvent)

## Bug reports, feature requests and contact

If you found any bugs, if you have feature requests or any questions, please, either [file an issue at GitHub](https://github.com/fczbkk/js-helpers/issues) or send me an e-mail at [riki@fczbkk.com](mailto:riki@fczbkk.com).

## License

JS Helpers is published under the [UNLICENSE license](https://github.com/fczbkk/js-helpers/blob/master/UNLICENSE). Feel free to use it in any way.
