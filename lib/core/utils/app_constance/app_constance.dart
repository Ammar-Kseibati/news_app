import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';
import 'package:news_app/presentation/controller/news_event.dart';
import 'package:url_launcher/url_launcher.dart';

class AppString {
  static const String splashText = "World News";
  static const String today = "Today";
  static const String dayAgo = "Day Ago";
  static const String daysAgo = "Days Ago";
  static List<String> titles = ["Apple", "Buisness", "Tesla", "Wall Street"];
  static const String nullId = "el-mundo";
  static const String nullAuthor = "L. B. BORGES";
  static const String nullDescription =
      "España vive un desplome térmico, con 13 provincias en alerta amarilla por lluvias, nevadas y fuerte oleaje. Un panorama que invita a refugiarse bajo una buena manta o un lustroso...";

  static const String nullImage =
      "https://i.insider.com/637d639bad0e8800193c0699?width=1200&format=jpeg";

  static const String nullContent =
      "The palera1n jailbreak, albeit intended for developers more-so than the general public, remains one of the only publicly available jailbreaks supporting iOS &amp; iPadOS 15.x. But as more users turn … [+2613 chars]";
}

class AppFunction {
  static hieght(BuildContext context) => MediaQuery.of(context).size.height;
  static width(BuildContext context) => MediaQuery.of(context).size.width;

  static getDaysBetween(List<News> articles) {
    final dates = articles.map((e) {
      DateTime unFormated =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(e.publishedAt);
      DateTime inputDate = DateTime.parse(unFormated.toString());
      int daysBetween(DateTime from, DateTime to) {
        from = DateTime(from.year, from.month, from.day);
        to = DateTime(to.year, to.month, to.day);
        return (to.difference(from).inHours / 24).round();
      }

      DateTime date1 = DateTime.now();
      final date = daysBetween(inputDate, date1);
      return date;
    }).toList();
    return dates;
  }

  static Future<void> launchLink(News article) async {
    final Uri url = Uri.parse(article.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> onRefresh(BuildContext context, NewsEvent event) async {
    BlocProvider.of<NewsBloc>(context).add(event);
  }
}
