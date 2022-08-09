import 'package:flutter/material.dart';
import 'package:app/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLogin() {
    // TODO: implement validation
    // TODO: implement login with email
  }

  void handleLoginWithGoogle() {
    // TODO: implement login with Google
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(AppLocalizations.of(context)!.getText("login"),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 12.0),
                          hintText: AppLocalizations.of(context)!.getText("email"),
                          prefixIcon: const Icon(Icons.alternate_email_rounded),
                          fillColor: Theme.of(context).primaryColor,
                        ),
                        controller: emailController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 12.0),
                            hintText: AppLocalizations.of(context)!.getText("password"),
                            prefixIcon: const Icon(Icons.lock)),
                        controller: passwordController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                          onPressed: handleLogin,
                          child: Text(
                              AppLocalizations.of(context)!.getText("login"))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                          onPressed: handleLoginWithGoogle,
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  height: 24.0,
                                  fit: BoxFit.contain),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.getText("loginWithGoogle"),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white)),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.getText("noAccountQuestion")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/signup');
                            },
                            child: Text(AppLocalizations.of(context)!.getText("signup"),))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
