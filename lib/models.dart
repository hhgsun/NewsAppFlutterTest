class Post {
  String id;
  String title;
  String content;
  String excerpt;
  String imageId;
  String featuredImageUrl;

  Post({this.id, this.title, this.content, this.excerpt, this.imageId, this.featuredImageUrl});

  factory Post.fromJson(Map<String, dynamic> data){
    return Post(
      id: data['id'].toString(),
      title: data['title']['rendered'],
      content: data['content']['rendered'],
      excerpt: data['excerpt']['rendered'],
      imageId: data['featured_media'].toString(),
      featuredImageUrl: data['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']['medium']['source_url'].toString(),
    );
  }
}