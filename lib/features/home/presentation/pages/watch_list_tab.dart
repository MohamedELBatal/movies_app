import 'package:flutter/material.dart';

class WatchListTab extends StatelessWidget {
  static const String routeName = "Watch List";
  const WatchListTab({super.key});

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
              "WatchList",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            Image.asset("assets/images/2.png",height: 100,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angil",style: TextStyle(color: Colors.white),),
                Text("2019",style: TextStyle(
                    color: Colors.white38
                ),
                ),
                Text("Rosa Salazar, Christoph Waltz",style: TextStyle(
                    color: Colors.white38
                ),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white,thickness: 100,height: 50,),
          ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            Image.asset("assets/images/2.png",height: 100,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angil",style: TextStyle(color: Colors.white),),
                Text("2019",style: TextStyle(
                    color: Colors.white38
                ),
                ),
                Text("Rosa Salazar, Christoph Waltz",style: TextStyle(
                    color: Colors.white38
                ),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white,thickness: 100,height: 50,),
          ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            Image.asset("assets/images/2.png",height: 100,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angil",style: TextStyle(color: Colors.white),),
                Text("2019",style: TextStyle(
                    color: Colors.white38
                ),
                ),
                Text("Rosa Salazar, Christoph Waltz",style: TextStyle(
                    color: Colors.white38
                ),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white,thickness: 100,height: 50,),
          ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            Image.asset("assets/images/2.png",height: 100,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angil",style: TextStyle(color: Colors.white),),
                Text("2019",style: TextStyle(
                    color: Colors.white38
                ),
                ),
                Text("Rosa Salazar, Christoph Waltz",style: TextStyle(
                    color: Colors.white38
                ),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white,thickness: 100,height: 50,),
          ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Image.asset("assets/images/2.png",height: 100,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angil",style: TextStyle(color: Colors.white),),
                Text("2019",style: TextStyle(
                    color: Colors.white38
                ),
                ),
                Text("Rosa Salazar, Christoph Waltz",style: TextStyle(
                    color: Colors.white38
                ),),
              ],
            ),
            const SizedBox(height: 20,),
          ],
          ),
        ],
      ),
    );
  }
}