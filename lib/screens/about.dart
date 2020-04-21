import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String appName;
  final String version;
  final String buildNumber;

  About({
    Key key,
    this.appName,
    this.version,
    this.buildNumber,
  }) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang aplikasi'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  widget.appName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                Text(
                  'Versi ${widget.version} (${widget.buildNumber})',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(
                      '${widget.appName} adalah Applikasi Mobile yang berisi kumpulan kajian tematik (series).\n'
                      'Insyaallah, bisa membantu antum untuk belajar Agama Islam lebih mudah.\n'
                      '${widget.appName} mengelompokkan setiap kajian yang di ampu oleh Ustadz kedalam satu "Pembelajaran".\n'
                      'Dengan begitu, diharapkan akan mempermudah antum guna memilih kajian apa yang hendak diikuti.\n\n'
                      'Adapun untuk data, saat ini kami masih mengumpulkan link video dari Youtube ke dalam server kami.\n'
                      'Jadi di aplikasi ini, semua video di streaming secara langsung tanpa menyimpan kedalam penyimpanan internal.\n\n'
                      'Aplikasi ini masih dalam tahap "Beta". '
                      'Jadi masih sangat butuh saran dan kritik dari antum, supaya aplikasi ini terus tumbuh menjadi lebih baik lagi.\n\n'
                      'Untuk itu jika antum mempunyai kritik, saran, dan support dalam bentuk apapun, termasuk jika ingin berkontribusi mengembangkan aplikasi ini. '
                      'Kami akan sangat senang sekali.\n\n'
                      'Untuk menghubungi kami. Silahkan anda klik menu "Hubungi Kami" dibawah menu ini.\nJazakumullahu khairan.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
