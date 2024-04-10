import 'package:flutter/material.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              "Browse Category",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),

              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),

              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),

              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),

              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),

              Image.asset("assets/images/1.png",fit: BoxFit.fill,height: 100,),
            ],
          ),
        ],
      ),
    );
  }
}
