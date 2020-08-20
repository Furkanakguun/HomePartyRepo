import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String uid;
  var url;
  var userProfilePhotoUrl;
  String _imageUrl;

  int currentPageIndex = 4;
  CircularBottomNavigationController _navigationController =
      new CircularBottomNavigationController(4);

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.red,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.notifications, "Social", Colors.yellow[700],
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.add, "Let's Party", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.stars, "Badges", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.person, "Reports", Colors.blue),
  ]);

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    userProfilePhotoUrl =
        'gs://homeparty-68792.appspot.com/user_profile_images/cPW7zkbCpYQT2II7JqEOcUK5rOm2.png';
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        uid = user.uid;
        print(loggedInUser.email);
        print(uid);
      }
    } catch (e) {
      print(e);
    }
  }

  void changePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Future<FirebaseImage> getFirebaseProfilPhoto() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        uid = user.uid;
        print(loggedInUser.email);
        print(uid);
        return FirebaseImage(
            'gs://homeparty-68792.appspot.com/user_profile_images/cPW7zkbCpYQT2II7JqEOcUK5rOm2.png');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getCurrentUser();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('furkanakguun'),
      ),
      body: Builder(
        builder: (context) => Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: loggedInUser != null
                        ? FirebaseImage(
                            'gs://homeparty-68792.appspot.com/user_profile_images/${loggedInUser.uid}.png')
                        : FirebaseImage(
                            'gs://homeparty-68792.appspot.com/user_profile_images/cPW7zkbCpYQT2II7JqEOcUK5rOm2.png'),
                    // FirebaseImage(
                    //     'gs://homeparty-68792.appspot.com/user_profile_images/$uid.png'),
                    //backgroundImage: Image.network(userProfilePhotoUrl),
                    radius: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                      ),
                      focusColor: Colors.white,
                      color: Colors.deepPurple,
                      onPressed: () {
                        print('asd');
                        Navigator.pushNamed(context, 'image_uploader');
                      },
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Card(
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.person),
                  ),
                  Card(
                    color: Colors.black,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Furkan Akgün',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Card(
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.location_on),
                  ),
                  Card(
                    color: Colors.black,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Ankara',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Card(
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.rate_review),
                  ),
                  Card(
                    color: Colors.black,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                    child: Container(
                        child: SmoothStarRating(
                      spacing: 2.0,
                      allowHalfRating: true,
                      starCount: 5,
                      rating: 4.5,
                      size: 20,
                      color: Colors.yellow,
                      borderColor: Colors.white,
                      isReadOnly: true,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.deepPurple[900],
                    onPressed: () {
                      //uploadPic(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        barBackgroundColor: Colors.deepPurple[900],
        controller: _navigationController,
        selectedCallback: (int selectedPos) {
          if (selectedPos == 0) {
            Navigator.pushNamed(context, 'dashboard_screen');
          }
          if (selectedPos == 4) {
            Navigator.pushNamed(context, 'user_profile');
          }
        },
      ),
    );
  }
}
