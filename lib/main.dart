import 'package:flutter/material.dart';
import 'dart:async'; // Future.delayed

void main() => runApp(MyApp());

// MyApp ウイジェットクラス
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: MyHomePage(title: 'ProgressIndicator Demo'),
      routes: <String,WidgetBuilder>{
        '/main' : (BuildContext context) => new MyHomePage(),
        '/1' : (BuildContext context) => new SubPage(),
       }
    );
  }
}

// MyHomePage ウイジェットクラス
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: new Text('登録ページ')
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ありがとうございます'),
              RaisedButton(onPressed:(){}, child: new Text('登録'),)
            ],
          ),
        ),
      ),
    );
  }
}

// MyHomePage ステートクラス
class _MyHomePageState extends State<MyHomePage> {
  // 全画面プログレスダイアログを表示する関数
  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('全画面プログレスダイアログ'),
            SizedBox(height: 150),
            RaisedButton(
              child: Text('表示'),
              onPressed: () async {
                // 全画面プログレスダイアログを表示
                showProgressDialog();
                // ３秒後にダイアログを閉じる
                await Future.delayed(Duration(seconds: 5));
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/1');
              },
            ),
          ],
        ),
      ),
    );
  }
}