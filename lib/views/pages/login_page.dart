import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/views/pages/register_page.dart';
import 'package:flutter_application_1/widgets/hero_widget.dart';
import 'package:flutter_application_1/widgets/widget_tree.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controlleruser = TextEditingController();
  final controllerpass = TextEditingController();



  @override
  void dispose() {
    controlleruser.dispose();
    controllerpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(child: HeroWidget()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controlleruser,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: 'Username/Email',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: controllerpass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: FilledButton(
                        onPressed: () {
                            loginPressed();
                        },
                        child: Text('Login'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('Don\'t have an account? Register'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginPressed() async{
    try {
      await supabase.auth.signInWithPassword(
        email: controlleruser.text,
        password: controllerpass.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
      );
    } 
    on AuthException catch (error) {
      showDialog(
        
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error.message),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
