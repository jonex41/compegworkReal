import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compegwork/constants.dart';
import 'package:compegwork/admin/editpost.dart';
import 'package:compegwork/login/loginscreen.dart';
import 'package:compegwork/providers.dart';
import 'package:compegwork/admin/uploadnams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as p;

class MainScreen extends HookConsumerWidget {
  // SingingCharacter? _character = SingingCharacter.lafayette;

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
  BuildContext? _context;

  SharedPreferences? prefs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> doThis() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      id = prefs.getString('id');
    }

    useEffect(() {
      doThis();
      return null;
      // print('my id $id');
      // FirebaseFirestore.instance.collection('Users').doc(id).get();
    });

    this.ref = ref;
    _context = context;
    Color color = Theme.of(context).primaryColor;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Candidates');

    // String value = getSharedPref();
    //  if (prefs!.getBool('vote' + prefs!.getString('ids')!) == null) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vote'),
        actions: const [
          /* IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) =>  UploadScreen()),
                  );
                },
              )*/
          /*     PopupMenuButton(
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
                 
                }
              }), */
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('list').get(),
        builder:
            (BuildContext _context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("No Candidates yet"));
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(child: Text("No Candidates yet"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            print('i am fiart here');
            print('my id $id');

            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(id)
                  .get(), // async work
              builder: (BuildContext _context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Text('Loading....');
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // return Text('Result: ${snapshot.data}');
                      print('i am here');
                      if (snapshot.data!['vote'] == 'yes') {
                        return Container(
                            child: const Text(
                          'Please you cannot \nvote two times',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ).center());
                      } else {
                        return ShowWidget(true, context);
                      }
                    }
                }
              },
            );
          }

          return const Center(child: Text("loading...."));
        },
      ),
    );
  }

  /*Widget takeInAllList(String name, String choice, List<String> list, bool value) {
    if (value) {
      String stuff = data[name];
      // Mr A,level \$ Mr B,Level'
      list = stuff.split("\$");
      //Mr A,level Mr B,level

    }


  }
*/
  Widget start(String name) {
    return ListTile(
      leading: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget inbetween() {
    return const ListTile(
      leading: Visibility(
        visible: false,
        child: Text(
          'NAME',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        'Name',
        style: TextStyle(
            fontSize: 14,
            color: Colors.lightGreen,
            fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        'Level',
        style: TextStyle(
            fontSize: 14,
            color: Colors.lightGreen,
            fontWeight: FontWeight.w500),
      ),
    );
  }
/*

  Widget addOneRadioButton(int index, List<String> list, String choice) {
    debugPrint(choice);

    return ListTile(
      title: Text(list[index].split(',').first.trim()),
      leading: Radio<String>(
        value: list.elementAt(index),
        groupValue: checkWhichOne(choice),
        onChanged: (value) {
          setState(() {
            assignValue(choice, value!);
          });
        },
      ),
      trailing: Text(list[index].split(',').last.trim()),
    );
  }

*/

  Widget ShowWidget(bool value, BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Please note that you can only vote onces, this implies once submitted, you cant vote again',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        dopresident(Constant.PRESIDENT, value),
        doVPresident(Constant.VPRESIDENT, value),
        doVPresident2(Constant.VPRESIDENTII, value),
        doSecretaryGeneral(Constant.SECRETARYGENRAL, value),
        doAssSecretaryGeneral(Constant.ASSSECRETARYGENERAL, value),
        doinancialSecretery(Constant.FINANCIALSECRETARY, value),
        doAssiFinacialSecretary(Constant.ASSISTANTFINANCIALSECRETARY, value),
        doTreaserer(Constant.TREASURER, value),
        doAssTreasurer(Constant.ASSISTANTTREASURER, value),
        doPro1(Constant.PROI, value),
        doProii(Constant.PROII, value),
        doAuditori(Constant.AUDITORI, value),
        doAuditor2(Constant.AUDITORII, value),
        doWelfareDirector1(Constant.WELFAREDIRECTORII, value),
        doWelfareDirector2(Constant.WELFAREDIRECTORII, value),
        doOrganizerSecretary(Constant.ORGANISINGSECRETARY, value),
        doAssOrganisingSecretary(Constant.ASSORGANISINGSECRETARY, value),
        doLegalAdviser(Constant.LEGALADVISER, value),
        thebutton(context),
      ],
    ); /*ListView.builder(
      controller: widget._controller,
      itemCount: 18,
      itemBuilder: (BuildContext ctxt, int index) {


      }
    );*/
  }

  Widget thebutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
          onPressed: () {
            p.Loader.show(_context!,
                progressIndicator: const CircularProgressIndicator());
            UploadStuffs();
            /*Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  UploadStuffs()),
          );*/
          }),
    );
  }

  Future<void> UploadStuffs() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs!.getString('id');
    if (prefs!.getBool('vote' + id!) == null) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          //print('Document data: ${documentSnapshot.data()}');
          if (documentSnapshot.get("vote") == 'no') {
            doTheCountAdd();
          } else {
            showDialog(
                context: _context!,
                builder: (ctx) => AlertDialog(
                      title: const Text('Vote'),
                      content: const Text('Please you cant vote two times'),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              p.Loader.hide();
                              await FirebaseFirestore.instance
                                  .collection('Candidates')
                                  .doc('list')
                                  .delete();
                              p.Loader.hide();
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('Ok'))
                      ],
                    ));

            /*  ScaffoldMessenger.of(_context!).showSnackBar(const SnackBar(
                content: Text('Please you cant vote two times'))); */
          }
        } else {
          p.Loader.hide();
          print('Document does not exist on the database');
        }
      });
    } else {
      p.Loader.hide();
      ScaffoldMessenger.of(_context!).showSnackBar(
          const SnackBar(content: Text('Please you cant vote two times')));
    }
  }

  void doTheCountAdd() async {
    final pre = ref!.read(choicepresidentProvider);
    if (pre != '') {
      await doTransactions(
          choicepresident, Constant.PRESIDENT, choicepresidentProvider);
    }
    final prev = ref!.read(choicevPresidentProvider);
    if (prev != '') {
      await doTransactions(
          choicevPresident, Constant.VPRESIDENT, choicevPresidentProvider);
    }
    final prev2 = ref!.read(choiceVP2Provider);
    if (prev2 != '') {
      await doTransactions(choiceVP2, Constant.VPRESIDENTII, choiceVP2Provider);
    }
    final secgen = ref!.read(choiceSecretarygeneralProvider);
    if (secgen != '') {
      await doTransactions(choiceSecretarygeneral, Constant.SECRETARYGENRAL,
          choiceSecretarygeneralProvider);
    }
    final secgenasst = ref!.read(choiceAssSecregeneralProvider);
    if (secgenasst != '') {
      await doTransactions(choiceAssSecregeneral, Constant.ASSSECRETARYGENERAL,
          choiceAssSecregeneralProvider);
    }
    final finsec = ref!.read(choiceFinancialSreProvider);
    if (finsec != '') {
      await doTransactions(choiceFinancialSre, Constant.FINANCIALSECRETARY,
          choiceFinancialSreProvider);
    }
    final finsecass = ref!.read(choiceAssfinancialSreProvider);
    if (finsecass != '') {
      await doTransactions(choiceAssfinancialSre,
          Constant.ASSISTANTFINANCIALSECRETARY, choiceAssfinancialSreProvider);
    }
    final treas = ref!.read(choiceAssTreasurerProvider);
    if (treas != '') {
      await doTransactions(
          choicetreasurer, Constant.TREASURER, choicetreasurerProvider);
    }
    final treasass = ref!.read(choiceAssTreasurerProvider);
    if (treasass != '') {
      await doTransactions(choiceAssTreasurer, Constant.ASSISTANTTREASURER,
          choiceAssTreasurerProvider);
    }
    final pro1 = ref!.read(choicePro1Provider);
    if (pro1 != '') {
      await doTransactions(choicePro1, Constant.PROI, choicePro1Provider);
    }
    final pro2 = ref!.read(choicePro2Provider);
    if (pro2 != '') {
      await doTransactions(choicePro2, Constant.PROII, choicePro2Provider);
    }
    final aud1 = ref!.read(choiceAuditor1Provider);
    if (aud1 != '') {
      await doTransactions(
          choiceAuditor1, Constant.AUDITORI, choiceAuditor1Provider);
    }
    final aud2 = ref!.read(choiceAuditor2Provider);
    if (aud2 != '') {
      await doTransactions(
          choiceAuditor2, Constant.AUDITORII, choiceAuditor2Provider);
    }
    final welfdirect = ref!.read(choiceWelfareDirector1Provider);
    if (welfdirect != '') {
      await doTransactions(choiceWelfareDirector1, Constant.WELFAREDIRECTORI,
          choiceWelfareDirector1Provider);
    }
    final welfdirect2 = ref!.read(choiceWelfareDirector2Provider);
    if (welfdirect2 != '') {
      await doTransactions(choiceWelfareDirector2, Constant.WELFAREDIRECTORII,
          choiceWelfareDirector2Provider);
    }
    final organisecre = ref!.read(choiceOrganisingSecreProvider);
    if (organisecre != '') {
      await doTransactions(choiceOrganisingSecre, Constant.ORGANISINGSECRETARY,
          choiceOrganisingSecreProvider);
    }
    final organisecreass = ref!.read(choiceAssOrganisingSecreProvider);
    if (organisecreass != '') {
      await doTransactions(choiceAssOrganisingSecre,
          Constant.ASSORGANISINGSECRETARY, choiceAssOrganisingSecreProvider);
    }
    final legaladviser = ref!.read(choicelegalAdviserProvider);
    if (legaladviser != '') {
      final value = ref!.read(choicelegalAdviserProvider);
      // await doTransactions(choicelegalAdviser, Constant.LEGALADVISER, choicelegalAdviserProvider);
      await FirebaseFirestore.instance
          .collection('Votes')
          .doc(Constant.LEGALADVISER)
          .update({value: FieldValue.increment(1)}).catchError((err) {
        FirebaseFirestore.instance
            .collection('Votes')
            .doc(Constant.LEGALADVISER)
            .set({value: 1}, SetOptions(merge: true));
      });
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set({'vote': 'yes'}, SetOptions(merge: true)).whenComplete(() {
      prefs!.setBool('vote' + prefs!.getString('ids')!, true);
      p.Loader.hide();
      showDialog(
          context: _context!,
          builder: (ctx) => AlertDialog(
                title: const Text('Vote'),
                content: const Text('Voting Successful'),
                actions: [
                  TextButton(
                      onPressed: () {
                        ref!.read(choicepresidentProvider.notifier).state = '';
                        ref!.read(choicevPresidentProvider.notifier).state = '';
                        ref!.read(choiceVP2Provider.notifier).state = '';
                        ref!.read(choiceSecretarygeneralProvider.notifier).state = '';
                        ref!.read(choiceAssSecregeneralProvider.notifier).state = '';
                        ref!.read(choiceFinancialSreProvider.notifier).state = '';
                        ref!.read(choiceAssfinancialSreProvider.notifier).state = '';
                        ref!.read(choicetreasurerProvider.notifier).state = '';
                        ref!.read(choiceAssTreasurerProvider.notifier).state = '';
                        ref!.read(choicePro1Provider.notifier).state = '';
                        ref!.read(choicePro2Provider.notifier).state = '';
                        ref!.read(choiceAuditor1Provider.notifier).state = '';
                        ref!.read(choiceAuditor2Provider.notifier).state = '';
                        ref!.read(choiceWelfareDirector1Provider.notifier).state = '';
                        ref!.read(choiceWelfareDirector2Provider.notifier).state = '';
                        ref!.read(choiceOrganisingSecreProvider.notifier).state = '';
                        ref!.read(choiceAssOrganisingSecreProvider.notifier).state = '';
                        ref!.read(choicelegalAdviserProvider.notifier).state = '';
                        ref!.read(choicevPresidentProvider.notifier).state = '';

                        Navigator.of(ctx).pop();
                        Navigator.of(_context!).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                        );
                      },
                      child: const Text('Ok'))
                ],
              )).then((value) => null);
    });
  }

  doTransactions(
      String choiceUse, String post, StateProvider<String> provider) {
    final value = ref!.read(provider);
    FirebaseFirestore.instance
        .collection('Votes')
        .doc(post)
        .update({value: FieldValue.increment(1)}).catchError((err) {
      FirebaseFirestore.instance
          .collection('Votes')
          .doc(post)
          .set({value: 1}, SetOptions(merge: true));
    });
  }

  dotheOtherTransaction(
      String choiceUse, String post, StateProvider<String> provider) {
    final value = ref?.watch(provider);
    FirebaseFirestore.instance.collection('Votes').doc(post).set(
      {value!: 1},
      SetOptions(merge: true),
    );
  }

  Widget dopresident(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        president = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...president.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicepresidentProvider),
                    onChanged: (value) {
                      provider.read(choicepresidentProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doVPresident(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        vPresident = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...vPresident.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicevPresidentProvider),
                    onChanged: (value) {
                      provider.read(choicevPresidentProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doVPresident2(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        VP2 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...VP2.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceVP2Provider),
                    onChanged: (value) {
                      provider.read(choiceVP2Provider.notifier).state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doSecretaryGeneral(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        secretarygeneral = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...secretarygeneral.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceSecretarygeneralProvider),
                    onChanged: (value) {
                      provider
                          .read(choiceSecretarygeneralProvider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAssSecretaryGeneral(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        assSecregeneral = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assSecregeneral.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceAssSecregeneralProvider),
                    onChanged: (value) {
                      provider
                          .read(choiceAssSecregeneralProvider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doinancialSecretery(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        financialSre = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...financialSre.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceFinancialSreProvider),
                    onChanged: (value) {
                      provider.read(choiceFinancialSreProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAssiFinacialSecretary(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        assfinancialSre = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assfinancialSre.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceAssfinancialSreProvider),
                    onChanged: (value) {
                      provider
                          .read(choiceAssfinancialSreProvider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doTreaserer(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        treasurer = stuff.split("\$");
      }

      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...treasurer.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicetreasurerProvider),
                    onChanged: (value) {
                      provider.read(choicetreasurerProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAssTreasurer(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) assTreasurer = stuff.split("\$");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assTreasurer.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceAssTreasurerProvider),
                    onChanged: (value) {
                      provider.read(choiceAssTreasurerProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doPro1(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        pro1 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...pro1.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicePro1Provider),
                    onChanged: (value) {
                      provider.read(choicePro1Provider.notifier).state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doProii(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        pro2 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...pro2.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicePro2Provider),
                    onChanged: (value) {
                      provider.read(choicePro2Provider.notifier).state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAuditori(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        auditor1 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...auditor1.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceAuditor1Provider),
                    onChanged: (value) {
                      provider.read(choiceAuditor1Provider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAuditor2(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        auditor2 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...auditor2.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceAuditor2Provider),
                    onChanged: (value) {
                      provider.read(choiceAuditor2Provider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doWelfareDirector1(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        welfareDirector1 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...welfareDirector1.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceWelfareDirector1Provider),
                    onChanged: (value) {
                      provider
                          .read(choiceWelfareDirector1Provider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doWelfareDirector2(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        welfareDirector2 = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...welfareDirector2.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceWelfareDirector2Provider),
                    onChanged: (value) {
                      provider
                          .read(choiceWelfareDirector2Provider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doOrganizerSecretary(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        organisingSecre = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...organisingSecre.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choiceOrganisingSecreProvider),
                    onChanged: (value) {
                      provider
                          .read(choiceOrganisingSecreProvider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doAssOrganisingSecretary(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        assOrganisingSecre = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assOrganisingSecre.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue:
                        provider.watch(choiceAssOrganisingSecreProvider),
                    onChanged: (value) {
                      provider
                          .read(choiceAssOrganisingSecreProvider.notifier)
                          .state = value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget doLegalAdviser(String gggggg, bool value) {
    if (value) {
      String? stuff = data[gggggg];
      // Mr A,level \$ Mr B,Level'
      if (stuff != null) {
        legarlAdviser = stuff.split("\$");
      }
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...legarlAdviser.map((e) {
              return InkWell(
                onTap: () {
                  provider.read(choicepresidentProvider.notifier).state = e;
                },
                child: ListTile(
                  title: Text(e.split(',').first.trim()),
                  leading: Radio<String>(
                    value: e,
                    groupValue: provider.watch(choicelegalAdviserProvider),
                    onChanged: (value) {
                      provider.read(choicelegalAdviserProvider.notifier).state =
                          value!;
                    },
                  ),
                  trailing: Text(e.split(',').last.trim()),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
