// ignore_for_file: unused_local_variable

import 'package:dart_sort_queue/dart_sort_queue.dart';

main() {
  // create a priority queue from an existing array (modifies the array)
  SortQueue<num> queue = SortQueue<num>(list: [7, 5, 10]);

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
  SortQueue<CustomComparableItem> queue1 = SortQueue<CustomComparableItem>(
      list: [CustomComparableItem(5), CustomComparableItem(7)]);

// turn a queue into a sorted array
  var list = queue1.toList();
}

class CustomComparableItem implements Comparable<CustomComparableItem> {
  int? value;
  CustomComparableItem(this.value);
  @override
  int compareTo(CustomComparableItem other) {
    return (value ?? 0) - (other.value ?? 0);
  }
}
