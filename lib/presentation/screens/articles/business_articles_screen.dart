import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/core/utils/enums.dart';
import 'package:news_app/presentation/components/articels_component.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';
import 'package:news_app/presentation/controller/news_event.dart';
import 'package:news_app/presentation/controller/news_state.dart';

class BuisnessArticlesScreen extends StatelessWidget {
  const BuisnessArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) =>
          previous.buisnessArticlesState != current.buisnessArticlesState,
      builder: (context, state) {
        switch (state.buisnessArticlesState) {
          case RequestState.loading:
            return Center(
                child: Lottie.asset("assets/lottie/loading.json",
                    width: AppFunction.width(context) * 0.4));

          case RequestState.loaded:
            final articles = state.buisnessArticles;

            return RefreshIndicator(
              onRefresh: () =>
                  AppFunction.onRefresh(context, GetBuisnessArticlesEvent()),
              child: ArticleComponent(
                articles: articles,
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(state.buisnessArticlesMessage),
            );
        }
      },
    );
  }
}
