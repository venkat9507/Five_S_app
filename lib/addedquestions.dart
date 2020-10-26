import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app11/addquestion.dart';

final _firestore = Firestore.instance;

class addedQuestions extends StatefulWidget {
final docid;
addedQuestions({this.docid});
  @override
  _addedQuestionsState createState() => _addedQuestionsState();
}

class _addedQuestionsState extends State<addedQuestions> {
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
                          questionStream();
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
                    SizedBox(
                      width: 5,
                    ),
                    RawMaterialButton(
                      elevation: 2.0,
                      shape: CircleBorder(),
                      fillColor: Colors.white,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.lightGreenAccent,
                        size: 20.0,
                      ),
                      constraints: BoxConstraints.tightFor(
                        width: 40.0,
                        height: 40.0,
                      ),
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
           child: Text(sectionText,style: TextStyle(color: Colors.lightGreenAccent,fontSize: 20,
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

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'Area 1';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.lightGreenAccent,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple, fontSize: 15),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Area 1', 'Area 2', 'Area 3', 'Area 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class Dropdown2 extends StatefulWidget {
  @override
  _Dropdown2State createState() => _Dropdown2State();
}

class _Dropdown2State extends State<Dropdown2> {
  String dropdownValue = 'SORT';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.lightGreenAccent,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple, fontSize: 15),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
            questionStream();
          });
        },
        items: <String>[
          'SORT',
          'SET IN ORDER',
          'SHINE',
          'STANDARDISE',
          'SUSTAIN'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

void questionStream() async {
  await for (var snapshot in _firestore.collection('Questions').snapshots()) {
    for (var question in snapshot.documents) {
      print(question.data());
    }
  }
}

void getQuestions() async {
  await _firestore.collection('Questions').getDocuments();
}
