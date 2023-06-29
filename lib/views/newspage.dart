import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

class NewsItem {
  final String title;
  final String summary;
  final String imageUrl;
  final String link;

  NewsItem({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.link,
  });
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<NewsItem> _newsItems;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('https://variety.com/wp-json/wp/v2/posts?per_page=3'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<NewsItem> newsItems = [];
      final HtmlUnescape unescape = HtmlUnescape();
      for (final item in data) {
        final title = unescape.convert(item['title']['rendered']);
        final summary = unescape.convert(item['excerpt']['rendered']);
        final imageUrl = item['jetpack_featured_media_url'];
        final link = item['link'];
        final newsItem = NewsItem(
          title: title,
          summary: summary,
          imageUrl: imageUrl,
          link: link,
        );
        newsItems.add(newsItem);
      }
      setState(() {
        _newsItems = newsItems;
      });
    } else {
      // Manejo de error en caso de que la solicitud no sea exitosa
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimas noticias'),
      ),
      body: ListView.builder(
        itemCount: _newsItems?.length ?? 0,
        itemBuilder: (context, index) {
          final newsItem = _newsItems[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: newsItem.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(newsItem.title),
            subtitle: Text(newsItem.summary),
            onTap: () {
              // Navegar a la noticia original
              // Aquí puedes utilizar el paquete de navegación de Flutter (por ejemplo, Navigator.push)
            },
          );
        },
      ),
    );
  }
}