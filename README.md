## tinyqueue

```dart
import 'package:dart_sort_queue/dart_sort_queue.dart';

main() {
  // create a priority queue from an existing array (modifies the array)
  dynamic queue = SortQueue<int>([7, 5, 10], (a, b) => a.compareTo(b));

// add some items
  queue.push(7);
  queue.push(5);
  queue.push(10);

// remove the top item
  var top = queue.pop(); // returns 5

// return the top item (without removal)
  top = queue.peek(); // returns 7

// get queue length
  queue.length; // returns 2

// pass a custom item comparator as a second argument
  queue = SortQueue<Map<String, int>>([
    {"value": 5},
    {"value": 7}
  ], (a, b) {
    return (a["value"] ?? 0) - (b["value"] ?? 0);
  });

// turn a queue into a sorted array
  var list = queue.toList();
}

```

For a faster number-based queue, see [flatqueue](https://github.com/mourner/flatqueue).

### Install

Install using pub for Dart (`dart pub add dart_sort_queue`), or for Flutter (`flutter pub add dart_sort_queue`) then:

### Thanks

A port of [tinyqueue](https://github.com/mourner/tinyqueue) by [mourner](https://github.com/mourner) to Dart

---

Inspired by [js-priority-queue](https://github.com/adamhooper/js-priority-queue)
by [Adam Hooper](https://github.com/adamhooper).
