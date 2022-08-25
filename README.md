## tinyqueue

```dart
// create an empty priority queue
var queue = TinyQueue();

// add some items
queue.add(7);
queue.add(5);
queue.add(10);

// remove the top item
var top = queue.pop(); // returns 5

// return the top item (without removal)
top = queue.peek(); // returns 7

// get queue length
queue.length; // returns 2

// create a priority queue from an existing array (modifies the array)
queue = TinyQueue([7, 5, 10]);

// pass a custom item comparator as a second argument
queue = TinyQueue([{value: 5}, {value: 7}], (a, b) {
	return a.value - b.value;
});

// turn a queue into a sorted array
var list = [];
while (queue.length) list.add(queue.pop());
```

For a faster number-based queue, see [flatqueue](https://github.com/mourner/flatqueue).

### Install

Install using pub for Dart (`dart pub add dart_tiny_queue`), or for Flutter (`flutter pub add dart_tiny_queue`) then:

```dart
// import 
import ' package:dart_tiny_queue.dart';

```


### Thanks

A port of https://github.com/mourner/tinyqueue by [mourner](https://github.com/mourner) to Dart
---
Inspired by [js-priority-queue](https://github.com/adamhooper/js-priority-queue)
by [Adam Hooper](https://github.com/adamhooper).
