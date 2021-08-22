import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mvvm/view-model/news_view_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsViewModel article;

  const NewsDetailScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 150),
              child: Column(
                children: [
                  Text(
                    "Author",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(this.article.author ?? 'Undefined')
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Divider(
                    height: 80,
                    color: Color(0xffff8a30),
                    thickness: 20,
                  ),
                  Text(
                    'Headline',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                this.article.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3,
                ),
              ),
              Text(
                this.article.publishedAt,
              ),
              Container(
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: this.article.imageUrl,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              Text("Description"),
              Text(
                this.article.description,
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                this.article.content,
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
