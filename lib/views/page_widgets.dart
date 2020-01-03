import 'package:flutter/material.dart';
import 'package:new_flutter_app/model/model.dart';

class PagerWidget extends StatelessWidget {
  final List<Articles> articles;

  PagerWidget({@required this.articles});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, position) {
        return Pages(articles: articles[position]);
      },
      itemCount: articles.length,
    );
  }
}

class Pages extends StatelessWidget {
  final Articles articles;

  Pages({@required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: 'images/loader-black.gif',
            image: articles.urlToImage,
            height: 300.0,
            fadeInDuration: Duration(milliseconds: 100),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: Text(
              articles.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat-Regular'),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Text(
                  articles.description,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat-Regular'),
                ),
              ),
              Container(
                width: 100.0,
                color: Colors.white70,
              )
            ],
          ),
        ],
      ),
    );
  }
}
