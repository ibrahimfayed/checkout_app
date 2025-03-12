import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container( 
            decoration: ShapeDecoration(
              color: const Color(0xffD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,//20 is the redius of white circle
            left: 8 + 20,//20 is the redius of white circle
            right: 8 + 20,
            child: Row(
              children: List.generate(30, (index) => 
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color:const Color(0xffB8B8B8),
                    height: 2,
                  ),
                ),
              )),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child:const CircleAvatar(
              backgroundColor: Colors.white,
            ) 
            ),
            Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child:const CircleAvatar(
              backgroundColor: Colors.white,
            ) 
            ),
         const  Positioned(
            top: -50,
            left: 0,
            right: 0,
             child:  CircleAvatar(
              radius: 50,
                backgroundColor: Color(0xffD9D9D9),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:  Color(0xff34A853),
                  child: Icon(Icons.check,
                  size: 50,
                  color: Colors.white,),
                ),
              ),
           )
        ],
      ),
    );
  }
}