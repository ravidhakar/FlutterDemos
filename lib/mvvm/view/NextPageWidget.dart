import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/mvvm/res/AppContextExtension.dart';
import 'package:flutter_page_navigation/mvvm/view/widget/LoadingWidget.dart';
import 'package:flutter_page_navigation/mvvm/view/widget/MyErrorWidget.dart';
import 'package:flutter_page_navigation/mvvm/view/widget/MyTextView.dart';
import 'package:flutter_page_navigation/mvvm/viewmodel/NextPageVM.dart';
import 'package:provider/provider.dart';

import '../Utils/Utils.dart';
import '../models/NextPageDataModel.dart';
import '../network/Status.dart';

class NextPageWidget extends StatefulWidget {
  const NextPageWidget({Key? key}) : super(key: key);

  @override
  State<NextPageWidget> createState() {
    return _NextScreenState();
  }
}

class _NextScreenState extends State<NextPageWidget> {
  final NextPageVM viewModel = NextPageVM();

  @override
  void initState() {
    viewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: MyTextView(
                context.resources.strings.homeScreen,
                context.resources.color.colorWhite,
                context.resources.dimension.bigText)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<NextPageVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<NextPageVM>(builder: (context, viewModel, _) {
          switch (viewModel.movieMain.status) {
            case Status.LOADING:
              print("RAVI :: LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("RAVI :: ERROR");
              return MyErrorWidget(viewModel.movieMain.message ?? "NA");
            case Status.COMPLETED:
              print("RAVI :: COMPLETED");
              return _getMoviesListView(viewModel.movieMain.data?.movies);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getMoviesListView(List<Movie>? moviesList) {
    return ListView.builder(
        itemCount: moviesList?.length,
        itemBuilder: (context, position) {
          return _getMovieListItem(moviesList![position]);
        });
  }

  Widget _getMovieListItem(Movie item) {
    return Card(
      elevation: context.resources.dimension.lightElevation,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
              context.resources.dimension.imageBorderRadius),
          child: Image.network(
            item.posterurl ?? "",
            errorBuilder: (context, error, stackTrace) {
              return new Image.asset('assets/images/img_error.png');
            },
            fit: BoxFit.fill,
            width: context.resources.dimension.listImageSize,
            height: context.resources.dimension.listImageSize,
          ),
        ),
        title: MyTextView(
            item.title ?? "NA",
            context.resources.color.colorPrimaryText,
            context.resources.dimension.bigText),
        subtitle: MyTextView(
            item.year ?? "NA",
            context.resources.color.colorSecondaryText,
            context.resources.dimension.mediumText),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextView(
                "${Utils.setAverageRating(item.ratings ?? [])}",
                context.resources.color.colorBlack,
                context.resources.dimension.mediumText),
            SizedBox(
              width: context.resources.dimension.verySmallMargin,
            ),
            Icon(
              Icons.star,
              color: context.resources.color.colorAccent,
            ),
          ],
        ),
        onTap: () {
          // _sendDataToMovieDetailScreen(context, item);
        },
      ),
    );
  }
}
