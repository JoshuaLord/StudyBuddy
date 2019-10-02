import 'package:flutter/material.dart';
import 'home.dart';

class StartPageWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Study Hall';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              /* LOGIN BUTTON */
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('Login'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            RaisedButton(
              /* SIGN UP BUTTON */
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
            key: _loginFormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    /* USERNAME */
                    autofocus: true,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Username.';
                      }
                      return value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      contentPadding: const EdgeInsets.all(8.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  TextFormField(
                    /* PASSWORD */
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.all(8.0),
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new HomePage();
                      }));
                      /* TODO check login with database */
                    },
                  )
                ])));
  }
}

class SignupPage extends StatefulWidget {
  @override
  State createState() => new SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  String firstName;
  String lastName;
  String password;
  String passwordRetype;
  String email;

  List<Step> _steps;
  int currStep = 0;

  @override
  void initState() {
    super.initState();

    _steps = [
      new Step(
        title: const Text('Registration'),
        content: Form(
          key: _formKeys[0],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                /* EMAIL - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value.isEmpty) return 'Enter your school email';
                
                  RegExp re = RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
                  if (!re.hasMatch(value)) return 'Please Enter a Valid Email Address';
                  return value;
                },
                decoration: InputDecoration(
                  labelText: 'School Email',
                  hintText: 'Enter your school email',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                onSaved: (text) {
                  email = text;
                },
              ),
              TextFormField(
                /* FIRSTNAME - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value.isEmpty) return 'Enter your first name';
                  return value;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                onSaved: (text) {
                  firstName = text;
                },
              ),
              TextFormField(
                /* LASTNAME - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value.isEmpty) return 'Enter your last name';
                  return value;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                onSaved: (text) {
                  lastName = text;
                },
              ),
              TextFormField(
                /* PASSWORD - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value.isEmpty) return 'Enter your password';
                  if (value.length < 6) return 'Password must be at least 6 characters';

                  RegExp re = RegExp(r"^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$");
                  if (!re.hasMatch(value)) return 'Must contain one letter';
                  return value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                obscureText: true,
                onSaved: (text) {
                  password = text;
                },
              ),
              TextFormField(
                /* PASSWORD CHECK - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                    if (value.isEmpty) return 'Retype your password';
                    
                    if (password != null) {
                      if (value.compareTo(password) != 0) {
                        return 'Passwords Do Not Match';
                      }
                    } else {
                      return 'Type a Valid Password';
                    }
                    return value;
                },
                decoration: InputDecoration(
                  labelText: 'Retype Password',
                  hintText: 'Retype your password',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                obscureText: true,
                onSaved: (text) {
                  passwordRetype = text;
                },
              ),
            ],
          ),
        ),
      ),
      new Step(
        /* EMAIL CONFIRMATION */
        title: const Text('Confirmation'),
        content: Form(
          key: _formKeys[1],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                /* CONFIRMATION CODE - SIGNUP FORM */
                autocorrect: false,
                textAlign: TextAlign.center,
                validator: (value) {
                  // TODO validator for Confirmation Code - Signup Form
                  if (value.isEmpty) {
                    return 'Please Enter Your Confirmation Code';
                  }
                  return value;
                },
                decoration: InputDecoration(
                  labelText: 'Confirmation Code',
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: <Widget>[
          Stepper(
            steps: _steps,
            currentStep: this.currStep,
            onStepContinue: () {
              setState(() {
                _formKeys[currStep].currentState.save();
                if (_formKeys[currStep].currentState.validate()) {
                  currStep = (currStep < (_steps.length - 1)) ? currStep + 1 : 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                currStep = (currStep > 0) ? currStep - 1 : 0;
              });
            },
            onStepTapped: (step) {
              setState(() {
                _formKeys[currStep].currentState.save();

                bool validate = true;

                for (int i = 0; i < step; i++) {
                  if (!_formKeys[i].currentState.validate()) 
                    validate = false;
                }

                if (validate)
                  currStep = step;
              });
            },
          ),
          RaisedButton(
              // TODO submit button for sign up form 
              child: Text('Submit'),
              onPressed: () {}),
        ],
      ),
    );
  }

  void printState() {
    if (email != null) 
      print('email ' + email);
    if (firstName != null) 
      print('firstName ' + firstName);
    if (lastName != null) 
      print('lastName ' + lastName);
    if (password != null) 
      print('password ' + password);
    if (passwordRetype != null) 
      print('passwordRetype ' + passwordRetype);
  }
}
