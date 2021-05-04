import 'package:DuckerHub/FullApp/Network.dart';
import 'package:DuckerHub/FullApp/dashboard.dart';
import 'package:DuckerHub/FullApp/Images.dart';
import 'package:DuckerHub/FullApp/terminal.dart';
import 'package:DuckerHub/Welcome_SignIn_SignUp/SignIn.dart';
import 'package:DuckerHub/FullApp/ViewAll.dart';
import 'package:DuckerHub/Welcome_SignIn_SignUp/forgotpass.dart';
import 'package:DuckerHub/Welcome_SignIn_SignUp/signUp.dart';
import 'package:DuckerHub/Welcome_SignIn_SignUp/welcomeScreen.dart';
import 'package:DuckerHub/FullApp/Container.dart';
import 'package:DuckerHub/FullApp/Volume.dart';

var approutes = {
  // "/" route, build the WelcomeScreen.
  'welcomescreen': (context) => WelcomeScreen(),

  //"/second" route, build the LogInScreen.
  'signin': (context) => SignInScreen(),

  // "/signup" route build the SignInScreen
  'signup': (context) => SignUp(),

  //"/forgotpass" route build the ForgotPassScreen
  'forgotpass': (context) => ForgotPassScreen(),

  //"/viewall" go to All function page
  'viewall': (context) => ViewAll(),

  //"dashboard" go to Dashboard Page
  'dashboard': (context) => DashBoard(),

  //"launchContainer" go to Launch a container page
  'launchContainer': (context) => LaunchContainer(),

  //"createImage"
  'createImage': (context) => CreateImage(),

  //"createNetwork"
  'createNetwork': (context) => CreateNetwork(),

  //"createVolume"
  'createVolume': (context) => CreateVolume(),

  //"downloadImage"
  'downloadImage': (context) => DownloadImage(),

  //"removeImage"
  'removeImage': (context) => RemoveImage(),

  //"terminal"
  'terminal': (context) => Terminal(),

  //"exposeContainer"
  'exposeContainer': (context) => ExposeContainer(),

  //"pushImage"
  'pushImage': (context) => PushImage(),

  //"startContainer"
  'startContainer': (context) => StartContainer(),

  //"stopContainer"
  'stopContainer': (context) => StopContainer(),

  //"Remove Container"
  'removeContainer': (context) => RemoveContainer(),

  //"Remove All Container"
  'removeAllContainer': (context) => RemoveAllContainer(),

  //"Image List"
  'imageList': (context) => ImageList(),

  //Show Volume
  'showVol': (context) => ShowVolume(),

  //Show Network
  'showNet': (context) => ShowNetwork(),

  //Running Container
  'running': (context) => RunningContainer(),
};
