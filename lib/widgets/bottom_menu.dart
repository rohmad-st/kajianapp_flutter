import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kajianapp/screens/about.dart';

void contactUs(String appVersion, String buildNumber) {
  final String email = 'kajiantematikapp@gmail.com';
  final String subject = '[KAJIAN TEMATIK ANDROID]';
  final String body = 'Bismillah.\n'
      'Assalamualaikum warahmatullah\n\n\n\n\n\n\n'
      '---------------------------------------------------------------\n'
      ' App version: $appVersion.$buildNumber\n'
      '---------------------------------------------------------------\n';
  final String url = 'mailto:$email?subject=$subject&body=$body';
  launch(url);
}

Widget showBottomMenu(BuildContext context) {
  String appName;
  String version;
  String buildNumber;

  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    appName = packageInfo.appName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  });

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
      return Container(
        height: 200,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300], width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Tentang aplikasi'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(
                      appName: appName,
                      version: version,
                      buildNumber: buildNumber,
                    ),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Hubungi kami'),
              onTap: () => contactUs(version, buildNumber),
            ),
          ],
        ),
      );
    },
  );
  return null;
}
