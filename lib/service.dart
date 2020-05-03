import 'package:acilyayalim/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String _url = 'https://acilyayalim.com/wp-json/wp/v2';
String _countPosts = "10"; // listelemede toplam gösterilecek haber sayısı

// TÜM HABERLER
Future<List<Post>> getAllPost(int pageNumber) async {
  String queryUrl = _url + '/posts?_embed';
  queryUrl = queryUrl + '&per_page=' + _countPosts.toString();
  queryUrl = queryUrl + '&page=' + pageNumber.toString();
  final res = await http.get(queryUrl);
  Iterable iterable = json.decode(res.body);
  return iterable.map((e) => Post.fromJson(e)).toList();
}

// TEKİL HABER
Future<Post> getPost(int id) async {
  final res = await http.get(_url + '/posts/' + id.toString());
  return Post.fromJson(json.decode(res.body));
}

// KATEGORİYE GÖRE HABERLER
Future<List<Post>> getPostsByCat(int catId, int pageNumber) async {
  String queryUrl = _url + '/posts?_embed&categories=' + catId.toString();
  queryUrl = queryUrl + '&per_page=' + _countPosts.toString();
  queryUrl = queryUrl + '&page=' + pageNumber.toString();
  final res = await http.get(queryUrl);
  Iterable iterable = json.decode(res.body);
  return iterable.map((e) => Post.fromJson(e)).toList();
}

// ETİKETLERE GÖRE HABERLER
Future<List<Post>> getPostsByTag(int tagId, int pageNumber) async {
  String queryUrl = _url + '/posts?_embed&tags=' + tagId.toString();
  queryUrl = queryUrl + '&per_page=' + _countPosts.toString();
  queryUrl = queryUrl + '&page=' + pageNumber.toString();
  final res = await http.get(queryUrl);
  Iterable iterable = json.decode(res.body);
  return iterable.map((e) => Post.fromJson(e)).toList();
}

