import 'package:flutter/material.dart';
import 'package:geo_pulse/Custom_Field.dart';
import 'package:geo_pulse/Service/Alert_Service.dart';
import 'package:geo_pulse/Service/Auth_Services.dart';
import 'package:geo_pulse/Service/Navigation_Services.dart';
import 'package:geo_pulse/const.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GetIt getIt=GetIt.instance;
  final GlobalKey<FormState>loginFormKey=GlobalKey();

  late AuthService authService;
  late NavigationService navigationService;
  late AlertService alertService;

  String? email,password;

  @override
  void initState() {
    super.initState();
    authService=getIt.get<AuthService>(); 
    navigationService=getIt.get<NavigationService>();
    alertService=getIt.get<AlertService>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false ,
      body: buildUI(),
    );
  }
  Widget buildUI() {
  return  SafeArea(child: 
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ) ,
      child: Column(
        children: [
          headerText(),
          loginForm(),
          createAnAccountLink()
        ],
      ),
      )
  );
}
Widget headerText(){
  return SizedBox(
    width: MediaQuery.sizeOf(context).width,
    child: const Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
  );
}

  Widget loginForm(){
    return Container(
      height: MediaQuery.sizeOf(context).height*0.40,
      margin: EdgeInsetsDirectional.symmetric(
        vertical: MediaQuery.sizeOf(context).height*0.05,
      ),
      child: Form(
        key:loginFormKey ,
        child: Column(
        mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomerFormField(hintText: 'Email',
          height:MediaQuery.sizeOf(context).height*0.1,
          validationRegularExpression: Email_VALIDATION_REGEX,
          onSaved: (value){
            setState(() {
              email=value;
            });
          },),
          CustomerFormField(hintText: 'Password',height: MediaQuery.sizeOf(context).height*0.1,
          validationRegularExpression: PASSWORD_VALIDATION_REGEX,
          obscureText: true,
            onSaved: (value){
            setState(() {
              password=value;
            });},),
          loginButton(),
        ],
      )),
    );
  }
  Widget loginButton(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(onPressed: ()async{
        if (loginFormKey.currentState?.validate()??false) {
          loginFormKey.currentState?.save();
          print(email);
          print(password);
          bool result =await authService.login(email!,password!);
          print(result);
          if(result){
            navigationService.pushReplacementNamed("/home");
          }else{
            alertService.ShowToast(text: "Fail to login",icon: Icons.error);
          }
        }
      },
      color: Theme.of (context).colorScheme.primary,
      child: Text('Login',
      style: TextStyle(
        color: Colors.white,
      ),),
    )
    );
  }

  Widget createAnAccountLink(){
    return  Expanded(
      child:Row(
        mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Don\'t Have a Account?',),
          GestureDetector(
            onTap: (){
              navigationService.pushNamed("/register");
            },
            child: Text('Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w800
            ),),
          )
        ],
      ) 
    );
  }
}