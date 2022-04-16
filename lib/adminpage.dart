import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compegwork/constants.dart';
import 'package:compegwork/editpost.dart';
import 'package:compegwork/providers.dart';
import 'package:compegwork/uploadnams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class AdminScreen extends ConsumerWidget {
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
  List<Model> models = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    Color color = Theme.of(context).primaryColor;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Candidates');
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Votes').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote'),
        actions: [
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
                return const Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading..."));
              }
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
              }
              return showWidget(false, context);
            },
          ),
        ],
      ),
    );
  }

  /*Widget takeInAllList(String name, String choice, List<String> list, bool value) {
    if (value) {
      String stuff = data[name];
      // Mr A,level & Mr B,Level'
      list = stuff.split("&");
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
            fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        'Level',
        style: TextStyle(
            fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
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
        dopresident(Constant.WELFAREDIRECTORII, value),
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
  /*doTransactions(String choiceUse, String post){
    // Create a reference to the document the transaction will use
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Votes')
        .doc(post);

    return FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get the document
      DocumentSnapshot snapshot = await transaction.get(documentReference);

      if (!snapshot.exists) {
        // throw Exception("User does not exist!");
        dotheOtherTransaction(choiceUse, post);
      }

      // Update the follower count based on the current count
      // Note: this could be done without a transaction
      // by updating the population using FieldValue.increment()

      int newFollowerCount = snapshot.get(choiceUse)+1;


      // Perform an update on the document
      transaction.update(documentReference, {choiceUse: newFollowerCount});

      // Return the new count
      return newFollowerCount;
    })
        .then((value) => print("Follower count updated to $value"))
        .catchError((error) => print("Failed to update user followers: $error"));
  }
*/

  dotheOtherTransaction(
      String choiceUse, String post, StateProvider<String> provider) {
    final value = ref?.watch(provider);
    FirebaseFirestore.instance.collection('Votes').doc(value).set(
      {value!: 1},
      SetOptions(merge: true),
    );
  }

  Widget dopresident(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      president = stuff.split("&");
      //Mr A,level Mr B,level
    }
    int indext = models.indexWhere((f) => f.id == gggggg);
    Model model1 = models.elementAt(indext);
    return Column(
      children: [
        start(gggggg),
        inbetween(),
        ...listWidgets(model1.list),
      ],
    );
  }
/*

  Widget doVPresident(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      vPresident = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...vPresident
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choicevPresidentProvider),
                  onChanged: (value) {
                    provider.read(choicevPresidentProvider.notifier).state = value!;
                  },
                ),
                trailing: Row(
                  children: [
                    Text(e.split(',').last.trim()),
                    Text(e.split(',').last.trim()),
                  ],
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
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      VP2 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...VP2
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceVP2Provider),
                  onChanged: (value) {
                    provider.read(choiceVP2Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doSecretaryGeneral(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      secretarygeneral = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...secretarygeneral
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceSecretarygeneralProvider),
                  onChanged: (value) {
                    provider.read(choiceSecretarygeneralProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doAssSecretaryGeneral(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      assSecregeneral = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assSecregeneral
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAssSecregeneralProvider),
                  onChanged: (value) {
                    provider.read(choiceAssSecregeneralProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doinancialSecretery(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      financialSre = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...financialSre
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceFinancialSreProvider),
                  onChanged: (value) {
                    provider.read(choiceFinancialSreProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget  doAssiFinacialSecretary(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      assfinancialSre = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assfinancialSre
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAssfinancialSreProvider),
                  onChanged: (value) {
                    provider.read(choiceAssfinancialSreProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doTreaserer(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      treasurer = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...treasurer
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choicetreasurerProvider),
                  onChanged: (value) {
                    provider.read(choicetreasurerProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doAssTreasurer(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      assTreasurer = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assTreasurer
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAssTreasurerProvider),
                  onChanged: (value) {
                    provider.read(choiceAssTreasurerProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doPro1(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      pro1 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...pro1
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choicePro1Provider),
                  onChanged: (value) {
                    provider.read(choicePro1Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doProii(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      pro2 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...pro2
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choicePro2Provider),
                  onChanged: (value) {
                    provider.read(choicePro2Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doAuditori(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      auditor1 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...auditor1
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAuditor1Provider),
                  onChanged: (value) {
                    provider.read(choiceAuditor1Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doAuditor2(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      auditor2 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...auditor2
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAuditor2Provider),
                  onChanged: (value) {
                    provider.read(choiceAuditor2Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doWelfareDirector1(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      welfareDirector1 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...welfareDirector1
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceWelfareDirector1Provider),
                  onChanged: (value) {
                    provider.read(choiceWelfareDirector1Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doWelfareDirector2(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      welfareDirector2 = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...welfareDirector2
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceWelfareDirector2Provider),
                  onChanged: (value) {
                    provider.read(choiceWelfareDirector2Provider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doOrganizerSecretary(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      organisingSecre = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...organisingSecre
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceOrganisingSecreProvider),
                  onChanged: (value) {
                    provider.read(choiceOrganisingSecreProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doAssOrganisingSecretary(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      assOrganisingSecre = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...assOrganisingSecre
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choiceAssOrganisingSecreProvider),
                  onChanged: (value) {
                    provider.read(choiceAssOrganisingSecreProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
  Widget doLegalAdviser(String gggggg, bool value) {
    if (value) {
      String stuff = data[gggggg];
      // Mr A,level & Mr B,Level'
      legarlAdviser = stuff.split("&");
      //Mr A,level Mr B,level
    }

    return Consumer(
      builder: (context, provider, child) {
        return Column(
          children: [
            start(gggggg),
            inbetween(),
            ...legarlAdviser
                .map((e) {
              return   ListTile(
                title: Text(e.split(',').first.trim()),
                leading: Radio<String>(
                  value: e,
                  groupValue:  provider.watch(choicelegalAdviserProvider),
                  onChanged: (value) {
                    provider.read(choicelegalAdviserProvider.notifier).state = value!;
                  },
                ),
                trailing: Text(e.split(',').last.trim()),
              );
            })
                .toList(),
          ],
        );
      },
    );}
*/

  List<Widget> listWidgets(Map<String, dynamic> list) {
    List<Widget> list1 = [];
    list.forEach((key, value) {
      list1.add(ListTile(
        title: Text('    ${value}'),
        leading: Text(key.split(',').first.trim()),
        trailing: Text(key.split(',').last.trim()),
      ));
    });
    return list1;
  }
}
