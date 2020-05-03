import 'package:acilyayalim/models.dart';
import 'package:acilyayalim/service.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final int catId;
  final int tagId;

  const ListPage({Key key, this.catId, this.tagId}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static const int OK = 0;
  static const int LOADING = 1;
  static const int ERROR = 3;
  static const int EMPTY = 4;
  int _pageNumber = 1;
  int _status = OK;

  List<Post> _articles;

  Future getNewsSelected() async {
    if (widget.catId != null) {
      return await getPostsByCat(widget.catId, _pageNumber);
    } else if (widget.tagId != null) {
      return await getPostsByTag(widget.tagId, _pageNumber);
    } else {
      return await getAllPost(_pageNumber);
    }
  }

  void loadNews() {
    _status = LOADING;
    getNewsSelected().then((values) {
      setState(() {
        if (values == null || values.length == 0) {
          _status = EMPTY;
        } else {
          _articles = values;
          _status = OK;
        }
      });
    }).catchError((onError) {
      print(onError);
      setState(() {
        _status = ERROR;
      });
    });
  }

  @override
  void initState() {
    loadNews();
    super.initState();
  }

  Widget _body() {
    switch (_status) {
      case OK:
        return ListView(
          children: _articles.map((article) {
            return ListTile(
              leading: Image(image: NetworkImage(article.featuredImageUrl)),
              title: Text(article.title),
              subtitle: Text(article.excerpt),
              onTap: () {},
            );
          }).toList(),
        );
        break;
      case LOADING:
        return Center(child: CircularProgressIndicator());
        break;
      case EMPTY:
        return Center(
          child: Text('HABER BULUNAMADI'),
        );
        break;
      case ERROR:
        return Center(
          child: Text('BEKLENMEDİK BİR HATA'),
        );
        break;
      default:
        return Text('...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Haberler ' +
              widget.catId.toString() +
              ' - ' +
              widget.tagId.toString() + ' - toplam: ' + _articles?.length.toString()),
        ),
        body: _body());
  }
}
