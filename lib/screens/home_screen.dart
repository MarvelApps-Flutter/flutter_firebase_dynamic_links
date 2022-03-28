import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_link_app/constants/app_constants.dart';
import 'package:flutter_dynamic_link_app/model/movies_model.dart';
import 'package:flutter_dynamic_link_app/screens/movie_detail_screen.dart';
import 'package:flutter_dynamic_link_app/services/json_service.dart';
import 'package:flutter_dynamic_link_app/utils/app_text_styles.dart';
import 'package:flutter_dynamic_link_app/utils/dynamic_link_utility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? url;
  List<MoviesModel>? products;
  var name;
  var year;
  var imageUrl;
  var description;

  init()
  {
    url = "";
    products = [];
  }

  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      final Uri? deepLink = dynamicLinkData.link;

      if (deepLink != null) {
        handleDynamicLink(deepLink);
      }
    }).onError((handleError) {
      print(handleError.message);
    });
  }

  handleDynamicLink(Uri url) {
    var str = url.path;
    var parts = str.split('/');
    var navigationPrefix = parts[1].trim();
    name = parts[2].trim();
    year = parts[3].trim();
    description = parts[4].trim();
    imageUrl = parts.sublist(5).join('/').trim();
    if (navigationPrefix == AppConstants.postString) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                  name, year, description, imageUrl)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black54,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black54,
            ))
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          buildMoviesTitle(),
          buildMoviesData()
        ],
      ),
    );
  }

  Widget buildMoviesTitle()
  {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          AppConstants.popularMoviesString,
          style: AppTextStyles.popularMoviesTextStyle,
        ),
      ),
    );
  }

  Widget buildMoviesData()
  {
    return FutureBuilder(
      future: JsonService.readMoviesData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          products = JsonService.movies;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 260,
                    height: 230,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                      products![index].title!,
                                      products![index].year!,
                                      products![index].description!,
                                      products![index].poster!)));
                        },
                        child: GridTile(
                          child: Image.asset(
                            products![index].poster!,
                            fit: BoxFit.cover,
                          ),
                          footer: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.grey.withOpacity(.5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    products![index].title!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      try {
                                        url = await AppUtils
                                            .createDynamicLink(
                                            products![index].title!,
                                            products![index].year!,
                                            products![index]
                                                .description!,
                                            products![index].poster!);
                                      } catch (e) {
                                        print(e);
                                      }
                                      setState(() {});
                                      if (url!.isNotEmpty) {
                                        Share.share(url!);
                                      }
                                    },
                                    icon: const Icon(Icons.share),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.0 : 1.2);
                }),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
