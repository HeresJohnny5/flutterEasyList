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

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;                    
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;                    
                  });
                },
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                padding: EdgeInsets.all(20.0),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    print(_emailValue);
                    print(_passwordValue);
                    Navigator.pushReplacementNamed(context, '/products');
                  });
                },
              ),
            ],
          ),
        ),
      );
    }
}