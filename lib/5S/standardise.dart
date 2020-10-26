import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app11/added%20questions/standardisequestions.dart';
import '../mainpage.dart';
String unitText;
String sectionText;
String questionText;
final sectionOrderText = 'STANDARDISE';

class Standardise extends StatefulWidget {
  @override
  _StandardiseState createState() => _StandardiseState();
}

class _StandardiseState extends State<Standardise> {
  int value = 1;
  List<String> questions = [];
  _addItem() {
    questions.add(questionText);
    setState(() {
      value = value + 1;
      SizedBox(
        height: 10,
      );
    });
  }

  final _Firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      heroTag: 'btn 1',
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.lightGreenAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mainPage()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Add Question',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
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
              Dropdown(),
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
              Container(width: 200,
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    sectionOrderText,
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                child: Text(
                  'Type Your Question',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: this.value,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              this._buildedRow(index)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: 'btn 2',
                onPressed: _addItem,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.lightGreenAccent,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () async {
                      var res;
                      questions.add(questionText);
                      var result =
                      await _Firestore.collection('Questions').add({
                        'unit': unitText,
                        'section': sectionOrderText,
                        'question': questions,
                      }).then((value) {
                        setState(() {
                          res = value.id;
                        });
                      });

                      print(res);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StandardiseQuestions(docid: null,),
                        ),
                      );
                    },
                    child: Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                            BorderRadius.all(Radius.circular(32))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'submit new question',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _buildedRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 70,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: TextFormField(
          onChanged: (val) {
            questionText = val;
          },
          style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent),
          decoration: InputDecoration(
              hintText: index.toString() + '  enter your question',
              hintStyle:
              TextStyle(fontSize: 20, color: Colors.lightGreenAccent)),
        ),
      ),
    );
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
            unitText = newValue;
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
