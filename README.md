# acilyayalim

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# REST API
- https://developer.wordpress.org/rest-api/

## 1 posts:
  - category posts:
  https://acilyayalim.com/wp-json/wp/v2/posts?categories=1
  - tag posts
  https://acilyayalim.com/wp-json/wp/v2/posts?tags=14
  - post
  https://acilyayalim.com/wp-json/wp/v2/posts/< post_id >
  return array|object:
    status :publish
    id  :int
    title.rendered  :text
    content.rendered  :text
    excerpt.rendered  :text
    date  :str_date
    sticky  :bool
    featured_media  :int
    format  :'gallery' or 'standart'

    categories  :array id int >>>>>> #2 cats
    tags  :array id int >>>>>> #3 tags
    featured_media  :id int >>>>>> #4 media

  - filter: &per_page=6 (total post)
  - filter: &page=2 (page number)

## 2 all categories
  https://acilyayalim.com/wp-json/wp/v2/categories
  https://acilyayalim.com/wp-json/wp/v2/categories/< cat_id >
  return array|object:
    id  :int
    count :int
    name  :text
    description :text
    taxonomy: :'category'

  - filter: &per_page=6 (total post)
  - filter: &page=2 (page number)

## 3 all tags
  https://acilyayalim.com/wp-json/wp/v2/tags
  https://acilyayalim.com/wp-json/wp/v2/tags/< tag_id >
  return array|object:
    id  :int
    count :int
    name  :text
    description :text
    taxonomy: :'post_tag'

  - filter: &per_page=6 (total post)
  - filter: &page=2 (page number)

## 4 all media
  https://acilyayalim.com/wp-json/wp/v2/media/< image_id >
  return object:
    id  :int
    type  :'attachment'
    media_type  :'image'
    media_details :array
        width :int
        height  :int
        sizes :array
          'thumbnail','medium','full','medium_large','large' :array
              file: "kare-banner.png",
              width: int,
              height: int,
              source_url: "https://acilyayalim.com/wp-content/uploads/2020/04/kare-banner.png" <<<<<
