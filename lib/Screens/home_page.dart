import 'dart:convert';

import 'package:azkar_moslim/Screens/section_detail_screen.dart';
import 'package:flutter/material.dart';
import '../model_section/sectiom_model.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "أذكار المسلم ",
          style: TextStyle(fontFamily: 'Tajawal', fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
          physics: BouncingScrollPhysics(),

          // children: [
          //   buildSectionItem(text: "أذكار الصباح"),
          //   buildSectionItem(text: "أذكار المساء"),
          //   buildSectionItem(text: "أذكار الاستيقاظ من النوم"),
          //   buildSectionItem(text: "أذكار قبل الوضوء"),
          //   buildSectionItem(text: "أذكار الأذان"),
          //   buildSectionItem(text: "أذكار النوم"),
          //   buildSectionItem(text: "أذكار الطعام"),
          // ],
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SectionDetailScreen(id: model.id!, title: model.name!,)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightGreenAccent,
                  Colors.green,
                  Colors.lightGreen,
                ])),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section); // sections ==> List
      });
      setState(() {}); // to feel Scaffold with the new data
    }).catchError((error) {
      print(error);
    });
  }
}
