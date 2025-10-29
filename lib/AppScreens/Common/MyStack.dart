class MyStack<E> {
  final List<E> _storage = [];

  void push(E element) {
    _storage.add(element);
  }

  E pop() {
    if (_storage.isEmpty) {
      throw StateError('Cannot pop from an empty stack.');
    }
    return _storage.removeLast();
  }

  E get peek {
    if (_storage.isEmpty) {
      throw StateError('Cannot peek into an empty stack.');
    }
    return _storage.last;
  }

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  int get length => _storage.length;

  @override
  String toString() => _storage.toString();
}
