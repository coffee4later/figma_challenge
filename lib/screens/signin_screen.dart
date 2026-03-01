import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    
    final btnsignin = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 9, 203, 102),
        foregroundColor: Colors.white,
        minimumSize: const Size(280, 70),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(seconds: 2), () {
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, 'profile');
        });
      },
      child: const Text('Sign In'),
    );

    final btnsignup = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 9, 203, 102),
        minimumSize: const Size(380, 70),
        side: const BorderSide(color: Color.fromARGB(255, 9, 203, 102), width: 2),
      ),
      onPressed: (){
        isLoading = true;
        setState((){});
        Future.delayed(Duration(seconds: 2), (){
          isLoading = false;
          setState((){});
          Navigator.pushNamed(context, 'profile');
        });
      },
      child: const Text('Sign Up'),
    );

    final imgLoading = isLoading
        ? Positioned(
            top: 395,
            child: Image.asset('assets/loading.gif', width: 45, height: 45),
          )
        : Container();


    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/signin-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top:30,
              child: Image(
                image: AssetImage('assets/logo.png'), 
                width: 300, 
                height: 300)
            ),
            Positioned(
              top: 270,
              child: Text(
                'RUNTAHPEDIA',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )),
              Positioned(
                top: 490,
                child: Text('Figma Challenge en Flutter', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.1, foreground: Paint()
                ..color = Color.fromARGB(255, 9, 203, 102)..strokeWidth = 10 ..style = PaintingStyle.fill))
              ),
              
              Positioned(
                bottom: 85,
                child: Container(
                  color: Colors.transparent,
                  width: 300,
                  height: 190,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      btnsignin,
                      btnsignup
                    ],
                  ),
                )
              ),
              Positioned(
              bottom: 30,
              child: Text("Por: Emiliano Valencia",
              style: TextStyle(
                color: Color.fromARGB(209, 9, 203, 102)
              ))
              ),
              imgLoading
          ]

          )
        ),
    );
  }
}
