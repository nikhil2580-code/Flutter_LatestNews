import 'package:flutter/material.dart';
import 'package:latest_news/view/detail_view.dart';

class Newscontainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  Newscontainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsCnt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "assets/images/breaking news.jpeg",
              image: imgUrl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                newsHead,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 5,
              ),
              Text(
                newsDes,
                style: TextStyle(fontSize: 12, color: Colors.black38),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                newsCnt != "--"
                    ? newsCnt.length > 550
                        ? newsCnt.substring(0, 550)
                        : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                    : newsCnt,
                style: TextStyle(fontSize: 16),
              ),
            ]),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailViewScreen(
                                    newsUrl: newsUrl,
                                  )));
                    },
                    child: Text(
                      "Read More",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
