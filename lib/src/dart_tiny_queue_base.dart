class TinyQueue {
  late List<dynamic>? data;
  final Function compare;

  TinyQueue({this.data, this.compare = defaultCompare}) {
    data = data ?? [];
    if (data!.isNotEmpty) {
      for (var i = (data!.length >> 1) - 1; i >= 0; i--) {
        _down(i);
      }
    }
  }

  push(item) {
    data!.add(item);
    _up(data!.length - 1);
  }

  pop() {
    if (data!.isEmpty) return; // return undefined

    var top = data![0];
    var bottom = data!.removeLast();

    if (data!.isNotEmpty) {
      data![0] = bottom;
      _down(0);
    }

    return top;
  }

  peek() {
    return data![0];
  }

  _up(pos) {
    var item = data![pos];

    while (pos > 0) {
      var parent = (pos - 1) >> 1;
      var current = data![parent];
      if (compare(item, current) >= 0) break;
      data![pos] = current;
      pos = parent;
    }

    data![pos] = item;
  }

  _down(pos) {
    //divides by two, and throws out the remainder. 15 >> 1 = 7
    var halfLength = data!.length >> 1;
    var item = data![pos];

    while (pos < halfLength) {
      // multiplies by two.
      var bestChild = (pos << 1) + 1; // initially it is the left child
      var right = bestChild + 1;

      if (right < data!.length && compare(data![right], data![bestChild]) < 0) {
        bestChild = right;
      }
      if (compare(data![bestChild], item) >= 0) break;

      data![pos] = data![bestChild];
      pos = bestChild;
    }

    data![pos] = item;
  }
}

defaultCompare(a, b) {
  return a < b
      ? -1
      : a > b
          ? 1
          : 0;
}
