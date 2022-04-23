import 'package:doctor/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = [
    'Mumbai',
    'bhandup',
    'Bangalore',
    'Bhopal',
    'New delhi',
    'chennai'
  ];
  final recentCities = [
    'bhandup',
    'Bangalore',
    'Bhopal',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: ((context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
            leading: const Icon(Icons.location_city),
            title: RichText(text:TextSpan(text:suggestionList[index].substring(0,query.length),
            style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold),
            children: [TextSpan(text:suggestionList[index].substring(query.length),
            style:const TextStyle(color: Colors.grey))])),
           
          )),
      itemCount: suggestionList.length,
    );
  }
}
