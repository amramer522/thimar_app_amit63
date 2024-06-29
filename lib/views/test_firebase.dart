import 'package:app/core/design/app_button.dart';
import 'package:app/core/design/app_input.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TestFirebaseView extends StatefulWidget {
  const TestFirebaseView({super.key});

  @override
  State<TestFirebaseView> createState() => _TestFirebaseViewState();
}

class _TestFirebaseViewState extends State<TestFirebaseView> {
  final emailController = TextEditingController(text: "amramer522@gmail.com");
  final passwordController = TextEditingController(text: "123456789");
  bool isLoading = false;
  final signInObject = GoogleSignIn();
  GoogleSignInAccount? account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(account?.displayName ?? "No User Founded"),
        actions: [
          IconButton(
            onPressed: () async {
              await signInObject.signOut();
              account=null;
              showMessage("Log out Success");
              setState(() {});
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInput(
                  label: "البريد الإلكتروني",
                  controller: emailController,
                ),
                AppInput(
                  label: "كلمة المرور",
                  inputType: InputType.password,
                  controller: passwordController,
                ),
                AppButton(
                  isLoading: isLoading,
                  onPressed: () async {

                  },
                  text: "تسجيل الدخول",
                ),
                SizedBox(
                  height: 24,
                ),
                OutlinedButton(
                  onPressed: () async {
                   loginWithGoogle();
                  },
                  child: Text("Login With Google"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    registerFirebase();
                    },
                  child: Text("SignUp With Google"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> registerWithGoogle()async{
    try {
      account = await signInObject.signIn();
      showMessage("Hello ${account?.displayName}",
          messageType: MessageType.success);
      // print(account?.email+account.);

    } catch (ex) {
      print("catch*******");
      showMessage(ex.toString());
    }
    setState(() {});
  }
  Future<void> loginWithGoogle()async{
    try {
      account = await signInObject.signIn();
      showMessage("Hello ${account?.displayName}",
          messageType: MessageType.success);
      print(account?.displayName);

    } catch (ex) {
      print("catch*******");
      showMessage(ex.toString());
    }
    setState(() {});
  }

  Future<void> loginFirebase()async{
    isLoading = true;
    setState(() {});
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      showMessage("Hello ${userCredential.user?.displayName}",
          messageType: MessageType.success);
    } on FirebaseAuthException catch (ex) {
      print("FirebaseAuthException*******");
      print(ex.message);
      print(ex.code);
      showMessage(ex.code ?? "Failed");
    } catch (ex) {
      print("catch*******");
      showMessage(ex.toString());
    }

    isLoading = false;
    setState(() {});
  }
  Future<void> registerFirebase()async{
    isLoading = true;
    setState(() {});
    try {
      final userCredential = await FirebaseAuth.instance.signInWithProvider(
        GoogleAuthProvider()
      );

      showMessage("Hello ${userCredential.user?.displayName}",
          messageType: MessageType.success);
    } on FirebaseAuthException catch (ex) {
      print("FirebaseAuthException*******");
      print(ex.message);
      print(ex.code);
      showMessage(ex.code ?? "Failed");
    } catch (ex) {
      print("catch*******");
      showMessage(ex.toString());
    }

    isLoading = false;
    setState(() {});
  }
  Future<void> registerFirebaseEmailAndPassword()async{
    isLoading = true;
    setState(() {});
    try {
      final userCredential = await FirebaseAuth.instance.signInWithProvider(
        PhoneAuthProvider()

      );

      showMessage("Hello ${userCredential.user?.displayName}",
          messageType: MessageType.success);
    } on FirebaseAuthException catch (ex) {
      print("FirebaseAuthException*******");
      print(ex.message);
      print(ex.code);
      showMessage(ex.code ?? "Failed");
    } catch (ex) {
      print("catch*******");
      showMessage(ex.toString());
    }

    isLoading = false;
    setState(() {});
  }

}
