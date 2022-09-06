import 'package:dart_sort_queue/dart_sort_queue.dart';
import 'package:test/test.dart';
import 'dart:math' as math;

void main() {
  group(
    'A group of tests',
    () {
      final data = [];
      for (num i = 0; i < 10; i++) {
        data.add((10 * math.Random().nextDouble()).floor());
      }
      var sorted = [...data]..sort((a, b) => a - b);

      test(
        'maintains a priority queue',
        () {
          var queue = SortQueue<num>();
          for (var i = 0; i < data.length; i++) {
            queue.push(data[i]);
          }
          expect(queue.peek() == sorted[0], isTrue);

          var result = [];
          while (queue.isNotEmpty) {
            result.add(queue.pop());
          }

          expect(result, equals(sorted));
        },
      );

      test(
        'accepts data in constructor',
        () {
          var queue = SortQueue<num>(list: [...data]);

          var result = [];
          while (queue.isNotEmpty) {
            result.add(queue.pop());
          }

          expect(result, equals(sorted));
        },
      );

      test(
        'handles edge cases with few elements',
        () {
          var queue = SortQueue<num>();

          queue.push(2);
          queue.push(1);
          queue.pop();
          queue.pop();
          queue.pop();
          queue.push(2);
          queue.push(1);
          expect(queue.pop() == 1, isTrue);
          expect(queue.pop() == 2, isTrue);
          expect(queue.pop() == null, isTrue);
        },
      );

      test(
        'handles init with empty array',
        () {
          var queue = SortQueue<num>();

          expect(queue, equals([]));
        },
      );
    },
  );
}
