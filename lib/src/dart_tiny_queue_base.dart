typedef QueueComparator<T> = int Function(T a, T b);

class TinyQueue<T> extends Iterable<T> {
  late List<T> _data;
  final Function compare;

  TinyQueue(List<T> list, {this.compare = intDefaultCompare}) {
    _data = List<T>.of(list, growable: true);
    if (_data.isNotEmpty) {
      for (var i = (_data.length >> 1) - 1; i >= 0; i--) {
        _down(i);
      }
    }
  }
  push(item) {
    _data.add(item);
    _up(_data.length - 1);
  }

  T? pop() {
    if (_data.isEmpty) {
      return null;
    }
    var top = _data[0];
    var bottom = _data.removeLast();

    if (_data.isNotEmpty) {
      _data[0] = bottom;
      _down(0);
    }

    return top;
  }

  peek() {
    return _data[0];
  }

  void _up(pos) {
    var item = _data[pos];

    while (pos > 0) {
      var parent = (pos - 1) >> 1;
      var current = _data[parent];
      if (compare(item, current) >= 0) break;
      _data[pos] = current;
      pos = parent;
    }

    _data[pos] = item;
  }

  void _down(pos) {
    //divides by two, and throws out the remainder. 15 >> 1 = 7
    var halfLength = _data.length >> 1;
    var item = _data[pos];

    while (pos < halfLength) {
      // multiplies by two.
      var bestChild = (pos << 1) + 1; // initially it is the left child
      var right = bestChild + 1;

      if (right < _data.length && compare(_data[right], _data[bestChild]) < 0) {
        bestChild = right;
      }
      if (compare(_data[bestChild], item) >= 0) break;

      _data[pos] = _data[bestChild];
      pos = bestChild;
    }

    _data[pos] = item;
  }

  @override
  Iterator<T> get iterator => _data.iterator;
}

Comparator<int> intDefaultCompare(int a, int b) => (a, b) => a < b
    ? -1
    : a > b
        ? 1
        : 0;
