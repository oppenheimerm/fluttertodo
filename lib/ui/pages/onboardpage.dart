import 'package:flutter/material.dart';
import 'package:todoapp/core/services/navigationManager.dart';
import 'package:todoapp/locator.dart';
import 'package:todoapp/ui/pages/loginpage.dart';
import 'package:todoapp/ui/routing/routeNames.dart';

class OnboardingPage extends StatefulWidget {
  NavigationManager _navigationManager;

  OnboardingPage(){
    _navigationManager = locator<NavigationManager>();
  }

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      onBoardPage("onboard1", "Welcome to AKing"),
                      onBoardPage("onboard2", "Work Happens"),
                      onBoardPage("onboard3", "Task and assignments"),
                    ],
                    onPageChanged: (value) =>(setCurrentPage(value)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => getIndicator(index))
                )
              ],
            ),
            Positioned(
              //  centered
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/path1.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: navigateToLogin,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0,9),
                            blurRadius: 20.0,
                            spreadRadius: 3
                          )]
                        ),
                        child: Text("Get Started",
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNumb)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (_currentPage == pageNumb) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (_currentPage == pageNumb) ? Colors.black : Colors.grey,

      ),
    );
  }

  Column onBoardPage(String image, String pageTitle)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20.0,),
        Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                    image:AssetImage('assets/images/$image.png')
            ),
          )
        ),
        SizedBox(height:50.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            pageTitle,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40.0
          ),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing "
              "elit. Phasellus non odio at nibh egestas rutrum. Phasellus "
              "viverra, augue in aliquet egestas, quam velit vehicula ante, "
              "et molestie nisi enim sit amet felis.",
            style: TextStyle(
                fontSize: 16.0,
              color: Colors.grey,
            ), textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value){
    _currentPage = value;
    /*setState(() {

    });*/
  }

  navigateToLogin(){
    widget._navigationManager.navigateTo(LoginViewRoute);
  }
}

