import 'dart:async';

class AddProduct {
  int _counterAdd = 0;
  final StreamController _addController = StreamController();
  StreamSink get result => _addController.sink;
  final StreamController _minusController = StreamController();
  StreamSink get _sinkResult => _minusController.sink;
  Stream get output => _minusController.stream;

  AddProduct() {
    _addController.stream.listen((event) {
      if (event == 'add') {
        _counterAdd++;
      } else {
        _counterAdd--;
      }
      _sinkResult.add(_counterAdd);
    });
  }

  void dispose() {
    _addController.close();
    _minusController.close();
  }
}
