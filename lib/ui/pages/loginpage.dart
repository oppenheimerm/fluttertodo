import 'package:flutter/material.dart';
import 'package:todoapp/core/enums/form_types.dart';
import 'package:todoapp/core/services/DialogService.dart';
import 'package:todoapp/core/services/authenticationManager.dart';
import 'package:todoapp/core/services/navigationManager.dart';
import 'package:todoapp/ui/helpers/formValidation.dart';
import 'package:todoapp/ui/routing/routeNames.dart';

import '../../locator.dart';



class LoginPage extends StatefulWidget {

  NavigationManager _navigationManager;
  final DialogService _dialogService = locator<DialogService>();
  AuthenticationManager _authenticationManager;

  LoginPage(){
    _navigationManager = locator<NavigationManager>();
    _authenticationManager = locator<AuthenticationManager>();
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormKey () => formKey;
  FormType _formType = FormType.login;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  bool processingForm = false;

  //  ‘auto validate’ is used to validate the input as soon as we enter the data.
  //  Initially it is set it to false.  The reason that it is initially set to
  //  false, is because when the user opens the form, all the fields will by
  //  default empty, and an empty field is invalid. We don’t want to show such
  //  an invalid error.
  //
  //  Once the user submits the form, if there are any validation error then
  //  we'll start validating the input automatically by updating _autoValidate to true.
  bool _autoValidate = false;// DEPRECATED USER AutoValidateMode
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  //  Our switch to view methods: viewRegister or viewLogin
  void viewRegister(GlobalKey<FormState> formKey) {
    setState(() {
      _formType = FormType.register;
      formKey.currentState.reset();
    });
  }

  void viewLogin(GlobalKey<FormState> formKey){
    setState(() {
      _formType = FormType.login;
      formKey.currentState.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //  Hero
          Container(
            padding: EdgeInsets.fromLTRB(
                20.0, 20.0, 0.0, 0.0),
            child: Text('Welcome', style: TextStyle(
                fontSize: 40.0),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                20.0, 8.0, 0.0, 0.0),
            child: Text('Back!', style: TextStyle(
                fontSize: 40.0),),
          ),
          //  Form
          Container(
            padding: EdgeInsets.only(top: 35.0,left: 20.0, right: 20.0),
            child: Form(
              key: getFormKey(),
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: buildInputs() + buildSubmitButtons(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildInputs() {


    if (_formType == FormType.register) {
      return <Widget>[
        //  Firstname entry
        TextFormField(
          key: Key('firstname'),
          decoration: InputDecoration(labelText: 'First name', labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
              )),
          validator: DisplayNameValidator.validate,
          //onSaved: (String value) => _firstName = value,
          controller: firstNameController,
        ),
        SizedBox(height:20.0),
        //  Email entry
        TextFormField(
          key: Key('email'),
          decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
            //style focus underline colour
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            ),
          ),
          validator: EmailFieldValidator.validate,
          //onSaved: (String value) => _email = value,
          controller: emailController,
        ),
        SizedBox(height:20.0),
        //  Password entry
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
              )),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          //onSaved: (String value) => _password = value,
          controller: passwordController,
        ),

        SizedBox(height:20.0),

        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top:15.0, left: 20.0),
          child: InkWell(
            child: Text('Forgot Password',
              style: TextStyle(color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                  decoration: TextDecoration.underline),),
            onTap: (){},
          ),
        ),
        SizedBox(height: 20.0),
      ];
    }else{
      return <Widget>[
        //  Email entry
        TextFormField(
          key: Key('email'),
          decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
            //style focus underline colour
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            ),
          ),
          validator: EmailFieldValidator.validate /*longhand version - (value) => EmailFieldValidator.validate(value)*/,
          //onSaved: (String value) => _email = value,
          controller: emailController,
        ),
        SizedBox(height:20.0),
        //  Password entry
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
              )),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          //onSaved: (String value) => _password = value,
          controller: passwordController,
        ),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top:15.0, left: 20.0),
          child: InkWell(
            child: Text('Forgot Password',
              style: TextStyle(color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                  decoration: TextDecoration.underline),),
            onTap: (){},
          ),
        ),
        SizedBox(height: 20.0),
      ];
    }

  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        //  Login button
        Container(
          height: 40.0,
          child: Material(
            key: Key("signIn"),
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 4.0,
            child: GestureDetector(
              onTap: () => validateAndSubmitLogin(
                email: emailController.text,
                password: passwordController.text,
                formType: _formType,
                formKey: formKey,
              ),
              child: Center(
                child: Text("LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Archivo'
                  ),),
              ),
            ),
          ),
        ),
        //
        SizedBox(height: 20.0,),

        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top:15.0, left: 20.0),
          child: InkWell(
            child: Text('Create an account',
              style: TextStyle(color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                  decoration: TextDecoration.underline),),
            onTap: () => viewRegister(formKey),
          ),
        ),

      ];
    } else {
      return <Widget>[
        //  Login button
        Container(
          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 4.0,
            child: GestureDetector(
              onTap: () => validateAndSubmitSignUp(
                email: emailController.text,
                password: passwordController.text,
                firstname: firstNameController.text,
                formKey: formKey,
                formType: _formType,
              ),
              child: Center(
                child: Text("Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Archivo'
                  ),),
              ),
            ),
          ),
        ),

        SizedBox(height: 20.0,),

        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top:15.0, left: 20.0),
          child: InkWell(
            child: Text('Have an account? Login',
              style: TextStyle(color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                  decoration: TextDecoration.underline),),
            onTap: () => viewLogin(formKey),
          ),
        ),

      ];
    }
  }

  bool validateAndSave({GlobalKey<FormState> formKey}) {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmitLogin({
    @required String email,
    @required String password,
    @required FormType formType,
    @required GlobalKey<FormState> formKey
  }) async {
    if (validateAndSave(formKey: formKey)) {

      var result = await widget._authenticationManager.login(
          email: email, password: password);

      if(result.success == true){
        widget._navigationManager.navigateTo(HomeViewRoute);
      }else{
        await widget._dialogService.showDialog(
          title: "Login Failed",
          description: result.message
        );
      }

    }
  }

  Future<void> validateAndSubmitSignUp({
    @required String email,
    @required String password,
    @required String firstname,
    @required FormType formType,
    @required GlobalKey<FormState> formKey
  }) async {
    if (validateAndSave(formKey: formKey)) {

      var result = await widget._authenticationManager.register(
          email: email, password: password, firstname: firstname);

      if(result.success == true){
        widget._navigationManager.navigateTo(HomeViewRoute);
      }else{
        await widget._dialogService.showDialog(
            title: "Registration Failed",
            description: result.message
        );
      }
    }
  }
  /*Future handleStartUp() async{
    var hasLoggedInUser = await _authenticationManager.isUserLoggedIn();

    if(hasLoggedInUser){
      _navigationService.navigateTo(HomeViewRoute);

    }
  }*/

}

