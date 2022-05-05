import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compegwork/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  DocumentReference users =
      FirebaseFirestore.instance.collection('Candidates').doc('list');
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

  Map<String, dynamic> data = {};
  Future<void> UploadStuffs() {
    Loader.show(context, progressIndicator: const LinearProgressIndicator());
    return users.set(
      {
        if (presidentController.text.isNotEmpty)
          Constant.PRESIDENT: presidentController.text,
        if (vPresidentController.text.isNotEmpty)
          Constant.VPRESIDENT: vPresidentController.text,
        if (VP2Controller.text.isNotEmpty)
          Constant.VPRESIDENTII: VP2Controller.text,
        if (secretarygeneralController.text.isNotEmpty)
          Constant.SECRETARYGENRAL: secretarygeneralController.text,
        if (assSecregeneralController.text.isNotEmpty)
          Constant.ASSSECRETARYGENERAL: assSecregeneralController.text,
        if (financialSreController.text.isNotEmpty)
          Constant.FINANCIALSECRETARY: financialSreController.text,
        if (assfinancialSreController.text.isNotEmpty)
          Constant.ASSISTANTFINANCIALSECRETARY: financialSreController.text,
        if (treasurerController.text.isNotEmpty)
          Constant.TREASURER: treasurerController.text,
        if (assTreasurerController.text.isNotEmpty)
          Constant.ASSISTANTTREASURER: assTreasurerController.text,
        if (pro1Controller.text.isNotEmpty) Constant.PROI: pro1Controller.text,
        if (pro2Controller.text.isNotEmpty) Constant.PROII: pro2Controller.text,
        if (auditor1Controller.text.isNotEmpty)
          Constant.AUDITORI: auditor1Controller.text,
        if (auditor2Controller.text.isNotEmpty)
          Constant.AUDITORII: auditor2Controller.text,
        if (welfareDirector1Controller.text.isNotEmpty)
          Constant.WELFAREDIRECTORI: welfareDirector1Controller.text,
        if (welfareDirector2Controller.text.isNotEmpty)
          Constant.WELFAREDIRECTORII: welfareDirector2Controller.text,
        if (organisingSecreController.text.isNotEmpty)
          Constant.ORGANISINGSECRETARY: organisingSecreController.text,
        if (assOrganisingSecreController.text.isNotEmpty)
          Constant.ASSORGANISINGSECRETARY: assOrganisingSecreController.text,
        if (legarlAdviserController.text.isNotEmpty)
          Constant.LEGALADVISER: legarlAdviserController.text,
      },
      SetOptions(merge: true),
    ).then((value) {
      Loader.hide();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Upload Successful')));
      // Navigator.of(context).pop();
    }).catchError((error) {
      Loader.hide();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add Candidates${error ?? ""}')));
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Candidates');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Names'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('list').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return showWithText(true);
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return showWithText(true);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            return showWithText(false);
          }

          return const Center(child: Text("loading...."));
        },
      ),
    );
  }

  Widget oneTextField(String hintValue, TextEditingController controller) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintValue,
          ),
        ),
      );
  Widget thebutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red)))),
          onPressed: () {
            UploadStuffs();
            /*Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  UploadStuffs()),
          );*/
          }),
    );
  }

  Widget showWithText(bool value) {
    if (data.isEmpty) {
      return showOther();
    }

    if (value) {
      return showOther();
    } else {
      return ListView(
        children: [
          //data['full_name']

          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                  'Use comma to separate the name from the level and Dollar sign to'
                  ' separate one candidate from another EG. Mr A,level & Mr B,Level'),
            ),
          ),
          (data[Constant.PRESIDENT] != null)
              ? oneTextFieldText('Enter Presidents', presidentController,
                  data[Constant.PRESIDENT])
              : oneTextFieldText('Enter Presidents', presidentController, ''),
          (data[Constant.VPRESIDENT] != null)
              ? oneTextFieldText('Enter Vice President', vPresidentController,
                  data[Constant.VPRESIDENT])
              : oneTextFieldText(
                  'Enter Vice President', vPresidentController, ''),
          (data[Constant.VPRESIDENTII] != null)
              ? oneTextFieldText('Enter Vice President II', VP2Controller,
                  data[Constant.VPRESIDENTII])
              : oneTextFieldText('Enter Vice President II', VP2Controller, ''),
          (data[Constant.SECRETARYGENRAL] != null)
              ? oneTextFieldText('Enter Secretary General',
                  secretarygeneralController, data[Constant.SECRETARYGENRAL])
              : oneTextFieldText(
                  'Enter Secretary General', secretarygeneralController, ''),
          (data[Constant.ASSSECRETARYGENERAL] != null)
              ? oneTextFieldText('Enter Assistant Secretary General',
                  assSecregeneralController, data[Constant.ASSSECRETARYGENERAL])
              : oneTextFieldText('Enter Assistant Secretary General',
                  assSecregeneralController, ''),
          (data[Constant.FINANCIALSECRETARY] != null)
              ? oneTextFieldText('Enter Financial Secretary',
                  financialSreController, data[Constant.FINANCIALSECRETARY])
              : oneTextFieldText(
                  'Enter Financial Secretary', financialSreController, ''),
          (data[Constant.ASSISTANTFINANCIALSECRETARY] != null)
              ? oneTextFieldText(
                  'Enter Assistant Financial Secretary',
                  assfinancialSreController,
                  data[Constant.ASSISTANTFINANCIALSECRETARY])
              : oneTextFieldText('Enter Assistant Financial Secretary',
                  assfinancialSreController, ''),
          (data[Constant.TREASURER] != null)
              ? oneTextFieldText('Enter Treasurer', treasurerController,
                  data[Constant.TREASURER])
              : oneTextFieldText('Enter Treasurer', treasurerController, ''),
          (data[Constant.ASSISTANTTREASURER] != null)
              ? oneTextFieldText('Enter Assistant Treasurer',
                  assTreasurerController, data[Constant.ASSISTANTTREASURER])
              : oneTextFieldText(
                  'Enter Assistant Treasurer', assTreasurerController, ''),
          (data[Constant.PROI] != null)
              ? oneTextFieldText(
                  'Enter PRO I', pro1Controller, data[Constant.PROI])
              : oneTextFieldText('Enter PRO I', pro1Controller, ''),
          (data[Constant.PROII] != null)
              ? oneTextFieldText(
                  'Enter PRO II', pro2Controller, data[Constant.PROII])
              : oneTextFieldText('Enter PRO II', pro2Controller, ''),
          (data[Constant.AUDITORI] != null)
              ? oneTextFieldText('Enter Auditor I', auditor1Controller,
                  data[Constant.AUDITORI])
              : oneTextFieldText('Enter Auditor I', auditor1Controller, ''),
          (data[Constant.AUDITORII] != null)
              ? oneTextFieldText('Enter Auditor II', auditor2Controller,
                  data[Constant.AUDITORII])
              : oneTextFieldText('Enter Auditor II', auditor2Controller, ''),
          (data[Constant.WELFAREDIRECTORI] != null)
              ? oneTextFieldText('Enter Welfare Director I',
                  welfareDirector1Controller, data[Constant.WELFAREDIRECTORI])
              : oneTextFieldText(
                  'Enter Welfare Director I', welfareDirector1Controller, ''),
          (data[Constant.WELFAREDIRECTORII] != null)
              ? oneTextFieldText('Enter Welfare Director II',
                  welfareDirector2Controller, data[Constant.WELFAREDIRECTORII])
              : oneTextFieldText(
                  'Enter Welfare Director II', welfareDirector2Controller, ''),
          (data[Constant.ORGANISINGSECRETARY] != null)
              ? oneTextFieldText('Enter Organising Secretary',
                  organisingSecreController, data[Constant.ORGANISINGSECRETARY])
              : oneTextFieldText(
                  'Enter Organising Secretary', organisingSecreController, ''),
          (data[Constant.ASSORGANISINGSECRETARY] != null)
              ? oneTextFieldText(
                  'Enter Asst. Organising Secretary',
                  assOrganisingSecreController,
                  data[Constant.ASSORGANISINGSECRETARY])
              : oneTextFieldText('Enter Asst. Organising Secretary',
                  assOrganisingSecreController, ''),
          (data[Constant.LEGALADVISER] != null)
              ? oneTextFieldText('Enter Legal Adviser', legarlAdviserController,
                  data[Constant.LEGALADVISER])
              : oneTextFieldText(
                  'Enter Legal Adviser', legarlAdviserController, ''),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: thebutton(context),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }
  }

  Widget showOther() {
    return ListView(
      children: [
        //data['full_name']

        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Text(
                'Use comma to separate the name from the level and Dollar sign to'
                ' separate one candidate from another EG. Mr A,level & Mr B,Level'),
          ),
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: thebutton(context),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

Widget oneTextFieldText(
    String s, TextEditingController controller, String? conValue) {
  if (conValue != '') {
    controller.text = conValue!;
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: s,

        /*labelText:conValue== ''? conValue = null : conValue ,*/
      ),
    ),
  );
}
