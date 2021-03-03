import "dart:async";
import 'package:expressions/expressions.dart';
import 'package:f_calculator/data/datasource.dart';

class Calculator {
  String _content;
  //DataSource dataSource = DataSource.getInstance();

  StreamController _controller = StreamController();

  Sink get _input => _controller.sink;
  Stream get output => _controller.stream;

  void onReceiveSymbol(symbol) {
    _content = _content == null ? symbol : _content += symbol;
    _input.add(_content);
  }

  void onEquals() {
    DataSource dataSource = DataSource.getInstance();
    String conta = "";
    final expression = Expression.parse(_content);

    _content = ExpressionEvaluator().eval(expression, null).toString();
    _input.add(_content);

    conta = "$expression=$_content";
    dataSource.insert(conta);
  }

  void onClean() {
    _content = _content == null ? null : _content.substring(0, 0);
    _input.add(_content);
  }

  void onCleanLast() {
    _content = _content == null ? null : _content.substring(0, _content.length-1);
    _input.add(_content);
  }

  void dispose() => _controller.close();
}