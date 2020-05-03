import 'package:acilyayalim/page_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(AcilYayalimApp());

class AcilYayalimApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Haber Listeleme >'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            // tüm haberler için
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.all_inclusive),
                  Text('Tüm Haberler'),
                ],
              ),
            ),
            Divider(height: 30,),
            // kategori haberleri için
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage(catId: 1)),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.collections_bookmark),
                  Text('Kategori id ye göre'),
                ],
              ),
            ),
            Divider(height: 30,),
            // etiket haberleri için
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage(tagId: 14)),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.category),
                  Text('Tag id ye göre'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
