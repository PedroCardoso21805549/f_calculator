import "dart:async";
import 'package:expressions/expressions.dart';
import 'package:f_calculator/data/datasource.dart';

class Historic {
  String _content;
  int _tam;
  DataSource dataSource = DataSource.getInstance();

  StreamController _controller = StreamController();

  Sink get _input => _controller.sink;
  Stream get output => _controller.stream;

  String mostrarConta(int index) {
    _content = dataSource.getAll() == null ? "" : dataSource.getAll()[index];
    _input.add(_content);
  }

  int tamanhoDaLista() {
    _tam = dataSource.length();
    _input.add(_tam);
  }

  void clean() {
    dataSource.getCleaned();
    _content = "";
    _input.add(_content);
  }

  void dispose() => _controller.close();
}