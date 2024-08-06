import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode? _usernameFocusNode;
  FocusNode? _passwordFocusNode;
  FocusNode? Button;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    // Set up event listeners for focus changes
    _usernameFocusNode!.addListener(_onUsernameFocusChanged);
    _passwordFocusNode!.addListener(_onPasswordFocusChanged);
  }

  @override
  void dispose() {
    _usernameFocusNode!.dispose();
    _passwordFocusNode!.dispose();
    _usernameController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  void _onUsernameFocusChanged() {
    setState(() {}); // Rebuild the UI to update focus styling
  }

  void _onPasswordFocusChanged() {
    setState(() {}); // Rebuild the UI to update focus styling
  }

  void _handleLogin() {
    // Perform your authentication logic here
    String username = _usernameController!.text;
    String password = _passwordController!.text;

    // Check credentials and navigate to the main screen if valid
    if (username == 'admin' && password == 'password') {
      Navigator.pushNamed(context, '/main_screen');
    } else {
      // Show an error message or perform other actions for invalid credentials
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
  }

  void _handleKeyDown(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.select ||
          event.logicalKey == LogicalKeyboardKey.numpadEnter) {
        _handleLogin();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        if (_usernameFocusNode!.hasFocus) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        } else if (_passwordFocusNode!.hasFocus) {
          FocusScope.of(context).unfocus();
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        if (_passwordFocusNode!.hasFocus) {
          FocusScope.of(context).requestFocus(_usernameFocusNode);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV App Login'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: _handleKeyDown,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    focusedBorder: _usernameFocusNode!.hasFocus
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: _passwordFocusNode!.hasFocus
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          )
                        : null,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  autofocus: true,
                  focusNode: Button,
                  onPressed: _handleLogin,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
