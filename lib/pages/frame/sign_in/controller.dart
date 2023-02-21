import 'package:chatty/common/entities/entities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/routes.dart';
import 'index.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid'
    ],
  );

  void handleSignIn(String type) async {
    try{
      if (type=="phone number") {
        if (kDebugMode) {
          print("Youre login with phone number");
        }
      } else if (type=="google"){
        var user =await _googleSignIn.signIn();
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _credential = GoogleAuthProvider.credential(
            accessToken: _gAuthentication.accessToken,
            idToken: _gAuthentication.idToken,
          );

          await FirebaseAuth.instance.signInWithCredential(_credential);

          String? displayName = user.displayName;
          String? email = user.email;
          String? id = user.id;
          String? photoUrl = user.photoUrl??"assets/icons/google.png";
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print("Login type not sure");
        }
      }
    }catch(e){
      if (kDebugMode) {
        print("Login error: $e");
      }
    }
  }

  asyncPostAllData() {
    print("...Lets go to message page...");
    Get.offAllNamed(AppRoutes.Message);
  }
}