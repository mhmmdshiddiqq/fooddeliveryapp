import 'package:flutter/material.dart';
import 'package:food_deliver/widgets/navigations.dart';
import 'package:food_deliver/widgets/shared_button.dart';
import 'package:food_deliver/widgets/shared_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  final _signupEmailController = TextEditingController();
  final _signupPhoneController = TextEditingController();
  final _signupPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late TabController _tabController;
  final bool _isObsecure = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupEmailController.dispose();
    _signupPhoneController.dispose();
    _signupPasswordController.dispose();
    _confirmPasswordController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(400),
                bottomRight: Radius.circular(400),
              ),
              image: DecorationImage(
                image: AssetImage('images/logos.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _tabController,
            builder: (context, child) {
              return TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 250, 74, 12),
                    width: 3.0,
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [Tab(text: 'Login'), Tab(text: 'Sign-Up')],
              );
            },
          ),
          const SizedBox(height: 15),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [buildLoginField(context), buildSignUpField(context)],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SharedTextfield(
                    title: 'Email',
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _loginEmailController,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 20),
                  SharedTextfield(
                    title: 'Password',
                    hintText: 'Enter your password',
                    obscureText: _isObsecure,
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _loginPasswordController,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 74, 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SharedButton(
            text: 'Login',
            margins: EdgeInsets.only(bottom: 20),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigations()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSignUpField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SharedTextfield(
                    title: 'Email',
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _signupEmailController,
                    prefixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(height: 20),
                  SharedTextfield(
                    title: 'Phone Number',
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _signupPhoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  const SizedBox(height: 20),
                  SharedTextfield(
                    title: 'Password',
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _signupPasswordController,
                    prefixIcon: Icon(Icons.lock),
                    obscureText: _isObsecure,
                  ),
                  SizedBox(height: 20),
                  SharedTextfield(
                    title: 'Confirm Password',
                    hintText: 'Confirm your password',
                    hintStyle: TextStyle(color: Colors.grey),
                    controller: _confirmPasswordController,
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    obscureText: _isObsecure,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(0);
                      },
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 74, 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SharedButton(
            text: 'Sign Up',
            margins: EdgeInsets.only(bottom: 20),
            onPressed: () {
              if (_signupEmailController.text.isNotEmpty &&
                  _signupPhoneController.text.isNotEmpty &&
                  _signupPasswordController.text.isNotEmpty &&
                  _confirmPasswordController.text.isNotEmpty) {
                _tabController.animateTo(0);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all the fields')),
                );
              }

              if (_signupPasswordController.text !=
                  _confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Passwords do not match')),
                );
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
