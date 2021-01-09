import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/View/Module/MainPages/NewsPage/Article.dart';
import 'package:covid19/View/Module/MainPages/NewsPage/article_model.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
List<ArticleModel> articles = new List<ArticleModel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Latest News',
                    style: TextStyle(
                      fontSize: 24,
                    ))
              ],
            ),
              Container(
                        padding: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                publishedAt: articles[index].publishedAt,
                                url: articles[index].url,
                              );
                            }),
                      ),
          ],
        ),
      ),
    );
  }
}



class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, publishedAt, url;

  const NewsTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.publishedAt,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      newsUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: 500,
                      height: 200,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black26),
                    width: 500,
                    height: 200,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Date&Time:\n" + publishedAt,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black26,
              ),
            )
          ],
        ),
      ),
    );
  }
}