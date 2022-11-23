import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/domain/entities/news_entity.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.article, required this.date});
  final News article;
  final int date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            height: AppFunction.hieght(context) * 0.55,
            top: 0,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: -2,
                    blurRadius: 7,
                    blurStyle: BlurStyle.solid,
                    color: Color.fromARGB(143, 17, 15, 15),
                    offset: Offset(1, 2),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  errorBuilder: (context, url, error) => Image.network(
                    AppString.nullImage,
                  ),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  article.urlToImage!,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Colors.black45,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: AppFunction.width(context),
            height: AppFunction.hieght(context) * 0.7,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              article.name,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          subtitle: Text(
                            textAlign: TextAlign.start,
                            article.title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff2C3E50),
                          Colors.black,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: -2,
                          blurRadius: 7,
                          blurStyle: BlurStyle.solid,
                          color: Color.fromARGB(143, 17, 15, 15),
                          offset: Offset(-1, -3),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person_pin,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(article.author!.split(',')[0],
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Icon(
                                    Icons.access_time,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      date == 0
                                          ? AppString.today
                                          : date == 1
                                              ? "$date ${AppString.dayAgo}"
                                              : "$date ${AppString.daysAgo}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 6.0),
                                    child: Text("Description:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                  ),
                                  subtitle: Text(article.description!,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 6.0),
                                    child: Text("Content:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                  ),
                                  subtitle: Text(article.content!,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: 110,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              onPressed: () => AppFunction.launchLink(article),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Icon(
                                      Icons.link,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Link",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
