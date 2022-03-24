import 'package:flutter/material.dart';
import 'package:flutter_dynamic_link_app/utils/app_text_styles.dart';

class MovieDetailScreen extends StatefulWidget {
  final String name;
  final String year;
  final String description;
  final String image;
  const MovieDetailScreen(this.name, this.year, this.description, this.image, {Key? key}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  Size? size;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: body(),
        floatingActionButton: buildFloatingButton());
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Text(
                    widget.name.replaceAll("%20", " ").toUpperCase(),
                    style: AppTextStyles.nameTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Year',
                        style: AppTextStyles.headingTextStyle
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        widget.year.toString(),
                        style: AppTextStyles.headingBelowTextStyle
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Country',
                        style: AppTextStyles.headingTextStyle
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "USA",
                        style: AppTextStyles.headingBelowTextStyle
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.fromLTRB(20,8, 20,0),
                child: Text(
                  "Description :",
                  style: AppTextStyles.simpleTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.fromLTRB(20, 5, 20, 7),
                child: Text(
                  widget.description.replaceAll("%20", " "),
                  style: AppTextStyles.simpleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingButton()
  {
    return FloatingActionButton(
        elevation: 0.0,
        child: const Icon(Icons.favorite),
        backgroundColor: Colors.pink,
        onPressed: () {});
  }

  SliverAppBar buildSliverAppBar()
  {
    return SliverAppBar(
      snap: true,
      floating: true,
      backgroundColor: const Color(0xFF200087),
      expandedHeight: 300,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius:
          const BorderRadius.vertical(bottom: Radius.circular(40)),
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
