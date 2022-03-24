import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class AppUtils {
  static Future<String> createDynamicLink(String name ,String price,String description, String imageUrl) async {
    String url = "https://dynamiclinkss.page.link";

    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/post/$name/$price/$description/$imageUrl'),
      androidParameters: const AndroidParameters(
        packageName: "com.example.flutter_dynamic_link_app",
        minimumVersion: 0,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: "Movie",
          imageUrl: Uri.parse(imageUrl),
          title: "Popolar Movies"),
    );
    final ShortDynamicLink dynamicUrl = await dynamicLinks.buildShortLink(parameters);
    return dynamicUrl.shortUrl.toString();
  }
}