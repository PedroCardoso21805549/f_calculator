import 'package:f_calculator/blocs/historic.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class HistoricScreen extends StatelessWidget{
  final Historic historic;
  final Stream output;

  HistoricScreen({this.historic, this.output});

  @override
  Widget build(BuildContext context){
    ShakeDetector.autoStart(
        onPhoneShake: () {
          historic.clean();
        }
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Histórico"),
        ),
        body: StreamBuilder(
          initialData: "",
          stream: output,
          builder:(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
              itemCount: historic.tamanhoDaLista(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset('lib/assets/logo.jpg'),
                    title: Text("${snapshot.data}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}