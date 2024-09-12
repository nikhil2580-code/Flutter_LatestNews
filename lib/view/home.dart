import 'package:flutter/material.dart';
import 'package:latest_news/model/newsArt.dart';
import 'package:latest_news/view/controller/fetchNews.dart';
import 'package:latest_news/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          GetNews();
        },
        itemBuilder: (context, index) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Newscontainer(
                  imgUrl: newsArt.imgUrl,
                  newsHead: newsArt.newsHead,
                  newsCnt: newsArt.newsCnt,
                  newsDes: newsArt.newsDes,
                  newsUrl: newsArt.newsUrl);
        },
        itemCount: 5,
      ),
    );
  }
}
