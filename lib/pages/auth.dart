import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // PRIVATE METHODS
  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)) {
          return 'Please enter a valid Email.';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;                    
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length <= 8) {
          return 'Password is required and must be 8+ characters.';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;                    
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }

    _formKey.currentState.save();

    print(_formData);

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
    Widget build(BuildContext context) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
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
          ),
        ),
      ); 
    }
}