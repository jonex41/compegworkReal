import 'package:flutter/material.dart';

class EditPost extends StatelessWidget {
  EditPost({Key? key}) : super(key: key);
  final TextEditingController presidentController = TextEditingController();
  final TextEditingController vPresidentController = TextEditingController();
  final TextEditingController VP2Controller = TextEditingController();
  final TextEditingController secretarygeneralController =
  TextEditingController();
  final TextEditingController assSecregeneralController =
  TextEditingController();
  final TextEditingController financialSreController = TextEditingController();
  final TextEditingController assfinancialSreController =
  TextEditingController();
  final TextEditingController treasurerController = TextEditingController();
  final TextEditingController assTreasurerController = TextEditingController();
  final TextEditingController pro1Controller = TextEditingController();
  final TextEditingController pro2Controller = TextEditingController();
  final TextEditingController auditor1Controller = TextEditingController();
  final TextEditingController auditor2Controller = TextEditingController();
  final TextEditingController welfareDirector1Controller =
  TextEditingController();
  final TextEditingController welfareDirector2Controller =
  TextEditingController();
  final TextEditingController organisingSecreController =
  TextEditingController();
  final TextEditingController assOrganisingSecreController =
  TextEditingController();
  final TextEditingController legarlAdviserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Names'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(child: Text('Use comma to separate the name from the level and Dollar sign to'
                ' separate one candidate from another EG. Mr A,level\$Mr B,Level'),),
          ),
          oneTextField('Enter Presidents', presidentController),
          oneTextField('Enter Vice President', vPresidentController),
          oneTextField('Enter Vice President II', VP2Controller),
          oneTextField('Enter Secretary General', secretarygeneralController),
          oneTextField(
              'Enter Assistant Secretary General', assSecregeneralController),
          oneTextField('Enter Financial Secretary', financialSreController),
          oneTextField(
              'Enter Assistant Financial Secretary', assfinancialSreController),
          oneTextField('Enter Treasurer', treasurerController),
          oneTextField('Enter Assistant Treasurer', assTreasurerController),
          oneTextField('Enter PRO I', pro1Controller),
          oneTextField('Enter PRO II', pro2Controller),
          oneTextField('Enter Auditor I', auditor1Controller),
          oneTextField('Enter Auditor II', auditor2Controller),
          oneTextField('Enter Welfare Director I', welfareDirector1Controller),
          oneTextField('Enter Welfare Director II', welfareDirector2Controller),
          oneTextField('Enter Organising Secretary', organisingSecreController),
          oneTextField(
              'Enter Asst. Organising Secretary', assOrganisingSecreController),
          oneTextField('Enter Legal Adviser', legarlAdviserController),
          const SizedBox(height: 20,),
          thebutton(context),
        ],
      ),
    );
  }

  Widget oneTextField(String hintValue, TextEditingController controller) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintValue,
          ),
        ),
      );
}

Widget thebutton(BuildContext context) {
  return RaisedButton(
      color: Colors.pink,
      child: const Text("Submit", style: TextStyle(color: Colors.white)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        /*Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  UploadStuffs()),
        );*/
        /* if (auth.fetchCredentials(
                        usernameController.text, passwordController.text)) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        _isVisible = true;
                      });
                    }*/
      });
}


