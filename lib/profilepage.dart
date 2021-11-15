import 'package:flutter/material.dart';
import 'package:portfolio_application/responsive_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgets(
      largeScreen: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.green),
          backgroundColor: Colors.white,
        ),
        drawer: ResponsiveWidgets.isSmallScreen(context) ? Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              NavButton(
                text: "About Me",
                onPressed: (){}
              ),
              const SizedBox(height: 10),
              NavButton(
                text: "Work",
                onPressed: (){}
              ),
              const SizedBox(height: 10),
              NavButton(
                text: "Contact Me",
                onPressed: (){}
              ),
            ],
          ),
        ): null,

        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidgets(
              largeScreen: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   NavHeader(),
                   SizedBox(
                     height: MediaQuery.of(context).size.height * 0.1,
                   ),
                   ProfileInformation(),
                   SizedBox(
                     height: MediaQuery.of(context).size.height * 0.1,
                   ),
                   SocialInformation()
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  const NavHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgets(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidgets.isSmallScreen(context) ? MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           DGDot(),
          if(!ResponsiveWidgets.isSmallScreen(context))
          Row(
            children: [
              NavButton(
                text: "About Me",
                onPressed: (){}
              ),
              const SizedBox(width: 10),
              NavButton(
                text: "Work",
                onPressed: (){}
              ),
              const SizedBox(width: 10),
              NavButton(
                text: "Contact Me",
                onPressed: (){}
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DGDot extends StatelessWidget {
  const DGDot({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "DG",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          width: 5
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green
          ),
          )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton({ Key? key, @required this.text, @required this.onPressed, this.color = Colors.green}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed,
    child: Text(text, style: TextStyle(color: Colors.green,),),
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: Colors.green //color of the border outline in the navigation type of bar
      ),
      onSurface: Colors.green
    ),
    
    );
  }
}

class ProfileInformation extends StatelessWidget {

  profileImage(context) => AnimatedContainer(
    duration: Duration(seconds: 1),
    height: ResponsiveWidgets.isSmallScreen(context)
          ? MediaQuery.of(context).size.height * 0.25
          : MediaQuery.of(context).size.width * 0.25,
    width: ResponsiveWidgets.isSmallScreen(context)
         ? MediaQuery.of(context).size.height * 0.25
         : MediaQuery.of(context).size.width * 0.25,
    decoration: const BoxDecoration(
      backgroundBlendMode: BlendMode.luminosity,
      color: Colors.blueGrey,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('profileimage.jpg'),
      alignment: Alignment.center,
      fit: BoxFit.cover
      ),
      // borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
  );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Hi there! My name is",
      textScaleFactor: 1.5,
      style: TextStyle(color: Colors.green),),
      const Text(
        "Deepshika\nGhale",
        textScaleFactor: 3.2,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text("My name is Deepshika. \n"
      "I am a flutter enthusiast. \n"
      "I am a Computer Science student. \n",
      softWrap: true,
      textScaleFactor: 1.5,
      style: TextStyle(color: Colors.black87),),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          OutlinedButton(
            onPressed: (){},
            child: Text("Resume", style: TextStyle(color: Colors.green),),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              side: BorderSide(
                color: Colors.green,
              ),
              padding: EdgeInsets.all(10)
            )
          ),
          const SizedBox(
              width: 20,
          ),
          OutlinedButton(
            onPressed: (){},
            child: Text("Say Hi!", style: TextStyle(color: Colors.white)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              backgroundColor: Colors.green,
              side: BorderSide(
                color: Colors.green,
              ),
              padding: EdgeInsets.all(10)
            )
            ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgets(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileImage(context), // this is an animated container
          profileData //this is the column containing the data of the portfolio holder
          ]
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
          profileImage(context), // this is an animated container
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData //this is the column containing the data of the portfolio holder
          ]
      ),
    );
  }
}

class SocialInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgets(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          NavButton(
            text: "GitHub",
            onPressed: (){},
            color: Colors.green,
          ),
          const SizedBox(width: 10),
          NavButton(
            text: "Instagram",
            onPressed: (){},
            color: Colors.green,
          ),
          const SizedBox(width: 10),
          NavButton(
            text: "Facebook",
            onPressed: (){},
            color: Colors.green,
          ),
        ],
          ),
          const Text("Deepshika Ghale ©2021",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green
          ),)
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavButton(
            text: "GitHub",
            onPressed: (){},
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          NavButton(
            text: "Instagram",
            onPressed: (){},
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          NavButton(
            text: "Facebook",
            onPressed: (){},
            color: Colors.green,
          ),
          const SizedBox(height: 30),
          const Text("Deepshika Ghale ©2021",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green
          ),)
        ],
      ),
      
    );
  }
}