import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compegwork/constants.dart';
import 'package:compegwork/editpost.dart';
import 'package:compegwork/pdf_page.dart';
import 'package:compegwork/providers.dart';
import 'package:compegwork/uploadnams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as p;

class AdminScreen extends ConsumerWidget {
  // SingingCharacter? _character = SingingCharacter.lafayette;

/*  dopresident(Constant.PRESIDENT, value),
        dopresident(Constant.VPRESIDENT, value),
        dopresident(Constant.VPRESIDENTII, value),
        dopresident(Constant.SECRETARYGENRAL, value),
        dopresident(Constant.ASSSECRETARYGENERAL, value),
        dopresident(Constant.FINANCIALSECRETARY, value),
        dopresident(Constant.ASSISTANTFINANCIALSECRETARY, value),
        dopresident(Constant.TREASURER, value),
        dopresident(Constant.ASSISTANTTREASURER, value),
        dopresident(Constant.PROI, value),
        dopresident(Constant.PROII, value),
        dopresident(Constant.AUDITORI, value),
        dopresident(Constant.AUDITORII, value),
        dopresident(Constant.WELFAREDIRECTORI, value),
        dopresident(Constant.WELFAREDIRECTORII, value),
        dopresident(Constant.ORGANISINGSECRETARY, value),
        dopresident(Constant.ASSORGANISINGSECRETARY, value),
        dopresident(Constant.LEGALADVISER, value), */
  List<String> president = [];
  List<String> vPresident = [];
  List<String> VP2 = [];
  List<String> secretarygeneral = [];
  List<String> assSecregeneral = [];
  List<String> financialSre = [];
  List<String> assfinancialSre = [];
  List<String> treasurer = [];
  List<String> assTreasurer = [];
  List<String> pro1 = [];
  List<String> pro2 = [];
  List<String> auditor1 = [];
  List<String> auditor2 = [];
  List<String> welfareDirector1 = [];
  List<String> welfareDirector2 = [];
  List<String> organisingSecre = [];
  List<String> assOrganisingSecre = [];
  List<String> legarlAdviser = [];

  var choicepresident = 'nil';
  var choicevPresident = 'nil';
  var choiceVP2 = 'nil';
  var choiceSecretarygeneral = 'nil';
  var choiceAssSecregeneral = 'nil';
  var choiceFinancialSre = 'nil';
  var choiceAssfinancialSre = 'nil';
  var choicetreasurer = 'nil';
  var choiceAssTreasurer = 'nil';
  var choicePro1 = 'nil';
  var choicePro2 = 'nil';
  var choiceAuditor1 = 'nil';
  var choiceAuditor2 = 'nil';
  var choiceWelfareDirector1 = 'nil';
  var choiceWelfareDirector2 = 'nil';
  var choiceOrganisingSecre = 'nil';
  var choiceAssOrganisingSecre = 'nil';
  var choicelegalAdviser = 'nil';

  Map<String, dynamic> data = {};

  String? id;
  WidgetRef? ref;
  List<Model> models = [];
  BuildContext? context;

  AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    this.context = context;
    Color color = Theme.of(context).primaryColor;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Candidates');
    Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Votes').snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Results'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something

              await getPdf(models);
            },
          ),
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Upload"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Edit Upload"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Delete Candidates"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => UploadScreen()),
              );
            } else if (value == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => EditPost()),
              );
            } else {
              p.Loader.hide();
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text('Vote'),
                        content: const Text(
                            'Are you sure you want to delete all the contestants'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('Candidates')
                                    .doc('list')
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.PRESIDENT)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.VPRESIDENT)
                                    .delete();

                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.VPRESIDENTII)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.SECRETARYGENRAL)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.ASSSECRETARYGENERAL)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.FINANCIALSECRETARY)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.ASSISTANTFINANCIALSECRETARY)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.TREASURER)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.ASSISTANTTREASURER)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.PROI)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.PROII)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.AUDITORI)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.AUDITORII)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.WELFAREDIRECTORI)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.WELFAREDIRECTORII)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.ORGANISINGSECRETARY)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.ASSORGANISINGSECRETARY)
                                    .delete();
                                FirebaseFirestore.instance
                                    .collection('Votes')
                                    .doc(Constant.LEGALADVISER)
                                    .delete();
                                Navigator.of(ctx).pop();
                                _usersStream = FirebaseFirestore.instance
                                    .collection('Votes')
                                    .snapshots();
                              },
                              child: const Text('Ok'))
                        ],
                      ));

              /*  ScaffoldMessenger.of(_context!).showSnackBar(const SnackBar(
                content: Text('Please you cant vote two times'))); */

              p.Loader.hide();
            }
          }),
        ],
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Center(
              child: Image.asset(
                "assets/images/abu.png",
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 2.5,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('There is no vote yet'));
              }

              /*  if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading..."));
              } */
              /*Map<String, dynamic> data = snapshot.data!.docs as Map<String, dynamic>;
            print(data);*/
              if (snapshot.hasData) {
                //snapshot -> AsyncSnapshot of DocumentSnapshot
                //snapshot.data -> DocumentSnapshot
                //snapshot.data.data -> Map of fields that you need :)

                // Map<String, dynamic> documentFields = snapshot.data.docs;

                //  final model = Model(snapshot.data!.docs(''),snapshot.data!.docs('') as Map<String, dynamic>);
                List<DocumentSnapshot> docs = snapshot.data!.docs;
                for (DocumentSnapshot doc in docs) {
                  final model =
                      Model(doc.id, doc.data() as Map<String, dynamic>);
                  models.add(model);
                }
                if (docs.isEmpty) {
                  return const Center(child: Text('There is no vote yet'));
                }

                return showWidget(true, context);
              }
              return const Center(child: Text('There is no vote yet'));
            },
          ),
        ],
      ),
    );
  }

  Widget start(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget inbetween() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Name',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        10.width,
        const Text(
          'Count(s)',
          style: TextStyle(
              fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500),
        ),
        10.width,
        const Text(
          'Level',
          style: TextStyle(
              fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget showWidget(bool value, BuildContext context) {
    return ListView(
      children: [
        dopresident(Constant.PRESIDENT, value),
        dopresident(Constant.VPRESIDENT, value),
        dopresident(Constant.VPRESIDENTII, value),
        dopresident(Constant.SECRETARYGENRAL, value),
        dopresident(Constant.ASSSECRETARYGENERAL, value),
        dopresident(Constant.FINANCIALSECRETARY, value),
        dopresident(Constant.ASSISTANTFINANCIALSECRETARY, value),
        dopresident(Constant.TREASURER, value),
        dopresident(Constant.ASSISTANTTREASURER, value),
        dopresident(Constant.PROI, value),
        dopresident(Constant.PROII, value),
        dopresident(Constant.AUDITORI, value),
        dopresident(Constant.AUDITORII, value),
        dopresident(Constant.WELFAREDIRECTORI, value),
        dopresident(Constant.WELFAREDIRECTORII, value),
        dopresident(Constant.ORGANISINGSECRETARY, value),
        dopresident(Constant.ASSORGANISINGSECRETARY, value),
        dopresident(Constant.LEGALADVISER, value),
      ],
    );
  }

  Future<void> UploadStuffs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id');
    FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //print('Document data: ${documentSnapshot.data()}');
        String value = documentSnapshot.get('voted') ?? '';
        if (value == '') {
          print('i am here');
          doTheCountAdd();
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void doTheCountAdd() {
    dotheOtherTransaction(
        choicepresident, Constant.PRESIDENT, choicepresidentProvider);
    dotheOtherTransaction(
        choicevPresident, Constant.VPRESIDENT, choicevPresidentProvider);
    dotheOtherTransaction(choiceVP2, Constant.VPRESIDENTII, choiceVP2Provider);
    dotheOtherTransaction(choiceSecretarygeneral, Constant.SECRETARYGENRAL,
        choiceSecretarygeneralProvider);
    dotheOtherTransaction(choiceAssSecregeneral, Constant.ASSSECRETARYGENERAL,
        choiceAssSecregeneralProvider);
    dotheOtherTransaction(choiceFinancialSre, Constant.FINANCIALSECRETARY,
        choiceFinancialSreProvider);
    dotheOtherTransaction(choiceAssfinancialSre,
        Constant.ASSISTANTFINANCIALSECRETARY, choiceAssfinancialSreProvider);
    dotheOtherTransaction(
        choicetreasurer, Constant.TREASURER, choicetreasurerProvider);
    dotheOtherTransaction(choiceAssTreasurer, Constant.ASSISTANTTREASURER,
        choiceAssTreasurerProvider);
    dotheOtherTransaction(choicePro1, Constant.PROI, choicePro1Provider);
    dotheOtherTransaction(choicePro2, Constant.PROII, choicePro2Provider);
    dotheOtherTransaction(
        choiceAuditor1, Constant.AUDITORI, choiceAuditor1Provider);
    dotheOtherTransaction(
        choiceAuditor2, Constant.AUDITORII, choiceAuditor2Provider);
    dotheOtherTransaction(choiceWelfareDirector1, Constant.WELFAREDIRECTORI,
        choiceWelfareDirector1Provider);
    dotheOtherTransaction(choiceWelfareDirector2, Constant.WELFAREDIRECTORII,
        choiceWelfareDirector2Provider);
    dotheOtherTransaction(choiceOrganisingSecre, Constant.ORGANISINGSECRETARY,
        choiceOrganisingSecreProvider);
    dotheOtherTransaction(choiceAssOrganisingSecre,
        Constant.ASSORGANISINGSECRETARY, choiceAssOrganisingSecreProvider);
    dotheOtherTransaction(
        choicelegalAdviser, Constant.LEGALADVISER, choicelegalAdviserProvider);
  }

  dotheOtherTransaction(
      String choiceUse, String post, StateProvider<String> provider) {
    final value = ref?.watch(provider);
    FirebaseFirestore.instance.collection('Votes').doc(value).set(
      {value!: 1},
      SetOptions(merge: true),
    );
  }

  Widget dopresident(String gggggg, bool value) {
    int indext = models.indexWhere((f) => f.id == gggggg);
    if (indext != -1) {
      Model model1 = models.elementAt(indext);
      return Column(
        children: [
          10.height,
          start(gggggg),
          20.height,
          inbetween(),
          ...listWidgets(model1.list),
        ],
      );
    } else {
      return Container();
    }
  }

  List<Widget> listWidgets(Map<String, dynamic> list) {
    List<Widget> list1 = [];
    list.forEach((key, value) {
      list1.add(Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Text(key.split(',').first.trim())),
            Expanded(
              child: Text(
                '    $value',
                style: TextStyle(color: Theme.of(context!).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Expanded(child: Text(key.split(',').last.trim())),
            ),
          ],
        ),
      ));
    });
    return list1;
  }

//the Pw doc type
}
