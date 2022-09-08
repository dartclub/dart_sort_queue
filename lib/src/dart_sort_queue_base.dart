class SortQueue<T extends Comparable<T>> implements Iterable<T> {
  List<T> _data = <T>[];
  SortQueue({List<T>? list}) {
    _data = list ?? _data;
    if (_data.isNotEmpty) {
      for (int i = (_data.length >> 1) - 1; i >= 0; i--) {
        _down(i);
      }
    }
  }

  void push(T item) {
    _data.add(item);
    _up(_data.length - 1);
  }

  T? pop() {
    if (_data.isEmpty) return null;

    T top = _data[0];
    T bottom = _data.removeLast();

    if (_data.isNotEmpty) {
      _data[0] = bottom;
      _down(0);
    }

    return top;
  }

  T peek() {
    return _data[0];
  }

  void _up(pos) {
    var item = _data[pos];

    while (pos > 0) {
      var parent = (pos - 1) >> 1;
      var current = _data[parent];
      if (item.compareTo(current) >= 0) break;
      _data[pos] = current;
      pos = parent;
    }

    _data[pos] = item;
  }

  void _down(pos) {
    //divides by two, and throws out the remainder. 15 >> 1 = 7
    int halfLength = _data.length >> 1;
    T item = _data[pos];

    while (pos < halfLength) {
      // multiplies by two.
      int left = (pos << 1) + 1; // initially it is the left child
      T best = _data[left];
      int right = left + 1;

      if (right < _data.length && _data[right].compareTo(best) < 0) {
        left = right;
        best = _data[right];
      }
      if (best.compareTo(item) >= 0) break;

      _data[pos] = best;
      pos = left;
    }

    _data[pos] = item;
  }

  @override
  bool any(bool Function(T element) test) => _data.any(test);

  @override
  Iterable<R> cast<R>() => _data.cast<R>();

  @override
  bool contains(Object? element) => _data.contains(element);

  @override
  T elementAt(int index) => _data.elementAt(index);

  @override
  bool every(bool Function(T element) test) => _data.every(test);

  @override
  Iterable<R> expand<R>(Iterable<R> Function(T element) toElements) =>
      _data.expand(toElements);

  @override
  T get first => _data.first;

  @override
  T firstWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _data.firstWhere(test, orElse: orElse);

  @override
  R fold<R>(R initialValue, R Function(R previousValue, T element) combine) =>
      _data.fold(initialValue, combine);

  @override
  Iterable<T> followedBy(Iterable<T> other) => _data.followedBy(other);

  @override
  void forEach(void Function(T element) action) => _data.forEach(action);

  @override
  bool get isEmpty => _data.isEmpty;

  @override
  bool get isNotEmpty => _data.isNotEmpty;

  @override
  Iterator<T> get iterator => _data.iterator;

  @override
  String join([String separator = ""]) => _data.join(separator);

  @override
  T get last => _data.last;

  @override
  T lastWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _data.lastWhere(test, orElse: orElse);

  @override
  int get length => _data.length;

  @override
  Iterable<R> map<R>(R Function(T e) toElement) => _data.map<R>(toElement);

  @override
  T reduce(T Function(T value, T element) combine) => _data.reduce(combine);

  @override
  T get single => _data.single;

  @override
  T singleWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _data.singleWhere(test, orElse: orElse);

  @override
  Iterable<T> skip(int count) => _data.skip(count);

  @override
  Iterable<T> skipWhile(bool Function(T value) test) => _data.skipWhile(test);

  @override
  Iterable<T> take(int count) => _data.take(count);

  @override
  Iterable<T> takeWhile(bool Function(T value) test) => _data.takeWhile(test);

  @override
  List<T> toList({bool growable = true}) => _data.toList();

  @override
  Set<T> toSet() => _data.toSet();

  @override
  Iterable<T> where(bool Function(T element) test) => _data.where(test);

  @override
  Iterable<R> whereType<R>() => _data.whereType();
}
