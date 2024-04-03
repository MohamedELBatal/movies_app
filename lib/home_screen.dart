import 'package:flutter/material.dart';
import 'package:movies_app/api_manage.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),
      ),
      body: FutureBuilder(future: ApiManager.getSources(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return const Center(child: Text("Something went Wrong"));
        }
        var sourcesList=snapshot.data?.results??[];
        return ListView.builder(itemBuilder: (context, index) {
          return Text("${sourcesList[index].genreIds}");
        },itemCount: sourcesList.length,);
      },),
    );
  }
}
