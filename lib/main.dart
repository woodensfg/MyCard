import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nm_box.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme(body1: TextStyle(color: fCL))),
      home: MainCard(),
    );
  }
}

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  ],
                ),
                AvatarImage(),
                SizedBox(height: 15),
                Text(
                  'Woodens G. Fanfan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Port-au-Prince Haiti',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 15),
                Text(
                  'Mobile App Developer and Marketing Manager',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(onPressed: () async {
                      const url = 'https://www.facebook.com/woodens.fanfagregoire';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }else{
                        throw 'Could not launch $url';
                      }
                    },
                        child: NMButton(icon: FontAwesomeIcons.facebookF)),
                    SizedBox(width: 25),
                    FlatButton(onPressed: () async {
                      const url = 'https://twitter.com/woodyfanfan';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }else{
                        throw 'Could not launch $url';
                      }
                    },
                        child: NMButton(icon: FontAwesomeIcons.twitter)),
                    SizedBox(width: 25),
                    FlatButton(onPressed: () async {
                      const url = 'https://www.instagram.com/woodensfg/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }else{
                        throw 'Could not launch $url';
                      }
                    },
                        child: NMButton(icon: FontAwesomeIcons.instagram)),
                  ],
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.dribbble,
                        count: '35',
                        category: 'shots'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.userAlt,
                        count: '1.2k',
                        category: 'followers'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.heart,
                        count: '5.1k',
                        category: 'likes'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.user,
                        count: '485',
                        category: 'following'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SocialBox(
                        icon: FontAwesomeIcons.glassWhiskey,
                        count: '97',
                        category: 'buckets'),
                    SizedBox(width: 15),
                    SocialBox(
                        icon: FontAwesomeIcons.folderOpen,
                        count: '7',
                        category: 'projects'),
                  ],
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.07,
            minChildSize: 0.07,
            maxChildSize: 0.4,
            builder: (BuildContext context, scroll) {
              return Container(
                decoration: nMbox,
                child: ListView(
                  controller: scroll,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.share, color: fCL),
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Credits The Spot',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 35),
                          Container(
                            width: 225,
                            padding: EdgeInsets.all(10),
                            decoration: nMboxInvert,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.facebookF, color: fCL),
                                Icon(FontAwesomeIcons.twitter, color: fCL),
                                Icon(FontAwesomeIcons.instagram, color: fCL),
                                Icon(FontAwesomeIcons.whatsapp, color: fCL),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          FaIcon(
                            FontAwesomeIcons.copy,
                            color: Colors.pink.shade800,
                          ),
                          Text(
                            'Copy link',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  final IconData icon;
  final String count;
  final String category;

  const SocialBox({this.icon, this.count, this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: nMboxInvert,
        child: Row(
          children: <Widget>[
            FaIcon(icon, color: Colors.pink.shade800, size: 20),
            SizedBox(width: 8),
            Text(
              count,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 3),
            Text(
              category,
            ),
          ],
        ),
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final IconData icon;
  const NMButton({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: nMbox,
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: nMbox,
      child: Container(
        decoration: nMbox,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/fanfan.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
