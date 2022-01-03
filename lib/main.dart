import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:bio/constants.dart';
import 'package:bio/social_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

String viewID = "youtube-placeholder";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melissa Goo Hub',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String socialName = "@img_dev";
  String description =
      "Software Engineer (React/Node/Flutter) \n I love creating interesting web and mobile apps with beautiful UI.";

  AnimationController animationController;
  Animation<double> rotateY;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    rotateY = new Tween<double>(
      begin: .0,
      end: 1,
    ).animate(new CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = '100%' // MediaQuery.of(context).size.width.toString()
          ..height = '100%' //MediaQuery.of(context).size.height.toString()
          ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
          ..style.border = 'none');

    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                new AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    final card = Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/melissa_sq.jpg'),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 4),
                            blurRadius: 4.0,
                          )
                        ],
                      ),
                    );

                    return new Transform(
                      transform: new Matrix4.rotationY(rotateY.value * math.pi), 
                      alignment: Alignment.center,
                      child: card,
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  socialName,
                  style: normalText(
                    fontSize: 28,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: normalText(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Social links',
                  style: normalText(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 150,
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 30,
                ),
                SocialButton(
                  url: 'https://github.com/img31415',
                  icon: MdiIcons.github,
                  iconColor: Colors.black,
                  label: "GitHub profile",
                ),
                const SizedBox(
                  height: 25,
                ),
                SocialButton(
                  url: 'https://www.linkedin.com/in/inwugoo/',
                  icon: MdiIcons.linkedin,
                  iconColor: Colors.blue[800],
                  label: "LinkedIn profile",
                ),
                const SizedBox(
                  height: 25,
                ),     SocialButton(
                  url: 'https://dev.to/img_dev',
                  icon: MdiIcons.devTo,
                  iconColor: Colors.black,
                  label: "Dev Blog",
                ),
                const SizedBox(
                  height: 25,
                ),
                SocialButton(
                  url: 'https://twitter.com/img__dev',
                  icon: MdiIcons.twitter,
                  iconColor: Colors.lightBlue,
                  label: "I'm on Twitter!",
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
