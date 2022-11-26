import 'dart:async';

class StreamDemo {
  StreamController<int> streamController = StreamController<int>();

  add(num) {
    streamController.add(num);
  }
}
