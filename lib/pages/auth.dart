import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  // PRIVATE METHODS
  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;                    
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;                    
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
    Widget build(BuildContext context) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              width: targetWidth,
              child: ListView(
                children: <Widget>[
                  _buildEmailTextField(),
                  _buildPasswordTextField(),
                  _buildAcceptSwitch(),
                  SizedBox(height: 10.0,),
                  RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    textColor: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ),
          ), 
        ),
      );
    }
}