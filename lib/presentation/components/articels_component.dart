import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/presentation/screens/item_screen.dart';

class ArticleComponent extends StatelessWidget {
  const ArticleComponent({super.key, required this.articles});
  final List<News> articles;

  @override
  Widget build(BuildContext context) {
    final custimCahceManager = CacheManager((Config('customCacheKey',
        stalePeriod: const Duration(days: 1),
        maxNrOfCacheObjects: articles.length)));

    final dates = AppFunction.getDaysBetween(articles);

    return ListView.builder(
      itemExtent: 140,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemScreen(
                          article: articles[index], date: dates[index])));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: -2,
                          blurRadius: 7,
                          color: Color.fromARGB(143, 17, 15, 15),
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        cacheManager: custimCahceManager,
                        key: UniqueKey(),
                        imageUrl: articles[index].urlToImage!,
                        // fit: BoxFit.contain,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const Center(),
                        useOldImageOnUrlChange: true,
                        errorWidget: (context, url, error) => Image.network(
                          AppString.nullImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Text(articles[index].name,
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                            subtitle: Text(
                              maxLines: 3,
                              articles[index].title,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.black54,
                              size: 17,
                            ),
                            SizedBox(width: AppFunction.width(context) * 0.01),
                            Text(
                              dates[index] == 0
                                  ? AppString.today.toString()
                                  : dates[index] == 1
                                      ? "${dates[index]} ${AppString.dayAgo}"
                                      : "${dates[index]} ${AppString.daysAgo}",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
