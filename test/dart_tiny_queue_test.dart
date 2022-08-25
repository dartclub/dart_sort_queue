import 'package:dart_tiny_queue/dart_tiny_queue.dart';
import 'package:test/test.dart';
import 'dart:math' as math;

void main() {
  group(
    'A group of tests',
    () {
      final data = [];
      for (var i = 0; i < 10; i++) {
        data.add((10 * math.Random().nextDouble()).floor());
      }
      var sorted = [...data]..sort((a, b) => a - b);

      test(
        'maintains a priority queue',
        () {
          var queue = TinyQueue();
          for (var i = 0; i < data.length; i++) {
            queue.push(data[i]);
          }
          expect(queue.peek() == sorted[0], isTrue);

          var result = [];
          while (queue.data!.isNotEmpty) {
            result.add(queue.pop());
          }

          expect(result, equals(sorted));
        },
      );

      test(
        'accepts data in constructor',
        () {
          var queue = TinyQueue(data: [...data]);

          var result = [];
          while (queue.data!.isNotEmpty) {
            result.add(queue.pop());
          }

          expect(result, equals(sorted));
        },
      );

      test(
        'handles edge cases with few elements',
        () {
          var queue = TinyQueue();

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
          var queue = TinyQueue(data: []);

          expect(queue.data, equals([]));
        },
      );
    },
  );
}
