import 'package:flutter/material.dart';
import 'package:new_flutter_app/data/viewmodel.dart';
import 'package:new_flutter_app/model/model.dart';
import 'package:new_flutter_app/views/page_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ViewModel _viewModel = ViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
        leading: Icon(Icons.pages),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<NewsResponse>(
            future: _viewModel.getResponse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PagerWidget(articles: snapshot.data.articles);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel.getResponse();
  }
}
