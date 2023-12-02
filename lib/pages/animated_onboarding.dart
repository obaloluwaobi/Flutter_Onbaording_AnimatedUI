import 'package:flutter/material.dart';

class AnimatedUI extends StatefulWidget {
  const AnimatedUI({Key? key}) : super(key: key);

  @override
  State<AnimatedUI> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animationImg;
  late final Animation<Offset> _animationText;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2)
    )..forward();

    _animationImg = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear));

    _animationText = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear));

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f2ff),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _animationImg,
                  child:  Image.asset('assets/img.png'),
                ),

               const SizedBox(height: 30,),
                SlideTransition(
                  position: _animationText,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text('Tried of boaring \nWorking Space',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold),),
                      ),

                      const SizedBox(height: 30,),

                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text('We help you find the best working space \nAccorging to your mood',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),),
                      ),

                      const SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff574e0),
                            minimumSize:const Size.fromHeight(70),
                            shape: const RoundedRectangleBorder(
                                borderRadius:BorderRadius.horizontal(
                                  left: Radius.circular(20.0),
                                  right: Radius.circular(20.0),
                                ) ),
                          ),
                          child: const Text('Show the magic',style: TextStyle(color: Colors.white,fontSize: 20),),),
                      ),
                    ],
                  ),),

              ],
            ),
          ),
      ),
    );
  }
}
