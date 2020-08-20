import 'package:flutter/material.dart';
import 'package:home_party/screens/image_uploader_screen.dart';
import 'package:home_party/screens/user_profile_screen.dart';
import 'package:home_party/screens/welcome_screen.dart';
import 'package:home_party/screens/login_screen.dart';
import 'package:home_party/screens/registration_screen.dart';
import 'package:home_party/event_details/event_details_page.dart';
import 'package:home_party/screens/dashboard.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HomeParty());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
}

class HomeParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'dashboard_screen': (context) => Dashboard(),
        'image_uploader': (context) => ImageUploaderScreen(),
        'user_profile': (context) => ProfilePage(),
        'event_details': (context) => EventDetailsPage(),
      },
      home: WelcomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
