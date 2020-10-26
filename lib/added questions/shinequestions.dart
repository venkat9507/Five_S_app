import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app11/5S/shine.dart';

final _firestore = Firestore.instance;

class ShineQuestions extends StatefulWidget {

  final docid;
  ShineQuestions({this.docid});
  @override
  _ShineQuestionsState createState() => _ShineQuestionsState();
}

class _ShineQuestionsState extends State<ShineQuestions> {
  List<String> data = ['question', 'section', 'unit'];
  @override
  void initState() {
    super.initState();
    getQuestions().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }
  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    FloatingActionButton(heroTag: 'btn 1',
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.lightGreenAccent,
                        ),
                        onPressed: () {

                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Questions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: 250,
                child: Text(
                  'UNIT',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Container( width: 100,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    color: Colors.white,
                  ),
                  child: Text(
                    unitText,
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                width: 250,
                child: Text(
                  'SECTION',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Container( height: 50,
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: Colors.white,
                ),
                child: Text(sectionOrderText,style: TextStyle(color: Colors.lightGreenAccent,fontSize: 20,
                    fontWeight: FontWeight.w500),),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   height: 400,
              //   width: 350,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(35)),
              //     color: Colors.white,
              //   ),
              //   child: Text('')),
              _showQuestion(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showQuestion() {
    //check if querysnapshot is null
    if (querySnapshot != null) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
//load data into widgets
              Text("${querySnapshot.documents[i].get('question')}"),

            ],
          );
        },
      );
    } else {
      print(widget.docid);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getQuestions() async {
    return await Firestore.instance
        .collection('Questions').doc(widget.docid).get();
  }
}
