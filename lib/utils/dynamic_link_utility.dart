import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_dynamic_link_app/constants/app_constants.dart';
import 'package:share_plus/share_plus.dart';

class AppUtils {
  static Future<String> createDynamicLink(String name ,String price,String description, String imageUrl) async {
    String url = AppConstants.firebaseDynamicLinkUrl;

    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/post/$name/$price/$description/$imageUrl'),
      androidParameters: const AndroidParameters(
        packageName: AppConstants.packageNameString,
        minimumVersion: 0,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: AppConstants.movieString,
          imageUrl: Uri.parse(imageUrl),
          title: AppConstants.popularMoviesString),
    );
    final ShortDynamicLink dynamicUrl = await dynamicLinks.buildShortLink(parameters);
    return dynamicUrl.shortUrl.toString();
  }
}