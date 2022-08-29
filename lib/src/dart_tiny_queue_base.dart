class SortQueue<T> implements Iterable<T> {
  final List<T> _data;
  late Comparator<T> _compare;

  SortQueue(List<T> list, {Comparator<T>? compare})
      : _data = List<T>.of(list, growable: true) {
    _compare = compare ?? (T a, T b) => 0;
    if (_data.isNotEmpty) {
      for (var i = (_data.length >> 1) - 1; i >= 0; i--) {
        _down(i);
      }
    }
  }

  void push(T item) {
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

  T peek() {
    return _data[0];
  }

  void _up(pos) {
    var item = _data[pos];

    while (pos > 0) {
      var parent = (pos - 1) >> 1;
      var current = _data[parent];
      if (_compare(item, current) >= 0) break;
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

      if (right < _data.length &&
          _compare(_data[right], _data[bestChild]) < 0) {
        bestChild = right;
      }
      if (_compare(_data[bestChild], item) >= 0) break;

      _data[pos] = _data[bestChild];
      pos = bestChild;
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
