import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import '../constants.dart';
import '../model.dart';
import 'dart:collection';

Future getPdf(List<Model> models) async {
  pw.Document pdf = pw.Document();
  /*  /* 
        dopresident(Constant.VPRESIDENT, value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value),
        dopresident(Constant., value), */ */

  Model? president;
  if (models.indexWhere((f) => f.id == Constant.PRESIDENT) != -1) {
    // print('i am in president');
    president =
        models.elementAt(models.indexWhere((f) => f.id == Constant.PRESIDENT));
  }

  Model? vPresident;
  if (models.indexWhere((f) => f.id == Constant.VPRESIDENT) != -1) {
    vPresident =
        models.elementAt(models.indexWhere((f) => f.id == Constant.VPRESIDENT));
  }

  Model? vPresidentii;
  if (models.indexWhere((f) => f.id == Constant.VPRESIDENTII) != -1) {
    vPresidentii = models
        .elementAt(models.indexWhere((f) => f.id == Constant.VPRESIDENTII));
  }

  Model? secretaryGen;
  if (models.indexWhere((f) => f.id == Constant.SECRETARYGENRAL) != -1) {
    secretaryGen = models
        .elementAt(models.indexWhere((f) => f.id == Constant.SECRETARYGENRAL));
  }

  Model? assSec;
  if (models.indexWhere((f) => f.id == Constant.ASSSECRETARYGENERAL) != -1) {
    assSec = models.elementAt(
        models.indexWhere((f) => f.id == Constant.ASSSECRETARYGENERAL));
  }

  Model? finSec;
  if (models.indexWhere((f) => f.id == Constant.FINANCIALSECRETARY) != -1) {
    finSec = models.elementAt(
        models.indexWhere((f) => f.id == Constant.FINANCIALSECRETARY));
  }

  Model? assFinSec;
  if (models.indexWhere((f) => f.id == Constant.ASSISTANTFINANCIALSECRETARY) !=
      -1) {
    assFinSec = models.elementAt(
        models.indexWhere((f) => f.id == Constant.ASSISTANTFINANCIALSECRETARY));
  }

  Model? treasure;
  if (models.indexWhere((f) => f.id == Constant.TREASURER) != -1) {
    treasure =
        models.elementAt(models.indexWhere((f) => f.id == Constant.TREASURER));
  }

  Model? assTreaserer;
  if (models.indexWhere((f) => f.id == Constant.ASSISTANTTREASURER) != -1) {
    assTreaserer = models.elementAt(
        models.indexWhere((f) => f.id == Constant.ASSISTANTTREASURER));
  }

  Model? proi;
  if (models.indexWhere((f) => f.id == Constant.PROI) != -1) {
    proi = models.elementAt(models.indexWhere((f) => f.id == Constant.PROI));
  }

  Model? proii;
  if (models.indexWhere((f) => f.id == Constant.PROII) != -1) {
    proii = models.elementAt(models.indexWhere((f) => f.id == Constant.PROII));
  }

  Model? auditor1;
  if (models.indexWhere((f) => f.id == Constant.AUDITORI) != -1) {
    auditor1 =
        models.elementAt(models.indexWhere((f) => f.id == Constant.AUDITORI));
  }

  Model? auditor11;
  if (models.indexWhere((f) => f.id == Constant.AUDITORII) != -1) {
    auditor11 =
        models.elementAt(models.indexWhere((f) => f.id == Constant.AUDITORII));
  }

  Model? welfare1;
  if (models.indexWhere((f) => f.id == Constant.WELFAREDIRECTORI) != -1) {
    welfare1 = models
        .elementAt(models.indexWhere((f) => f.id == Constant.WELFAREDIRECTORI));
  }

  Model? welfare11;
  if (models.indexWhere((f) => f.id == Constant.WELFAREDIRECTORII) != -1) {
    welfare11 = models.elementAt(
        models.indexWhere((f) => f.id == Constant.WELFAREDIRECTORII));
  }

  Model? orgSec;
  if (models.indexWhere((f) => f.id == Constant.ORGANISINGSECRETARY) != -1) {
    orgSec = models.elementAt(
        models.indexWhere((f) => f.id == Constant.ORGANISINGSECRETARY));
  }

  Model? assOrgSec;
  if (models.indexWhere((f) => f.id == Constant.ASSORGANISINGSECRETARY) != -1) {
    assOrgSec = models.elementAt(
        models.indexWhere((f) => f.id == Constant.ASSORGANISINGSECRETARY));
  }

  Model? legalAdviser;
  if (models.indexWhere((f) => f.id == Constant.LEGALADVISER) != -1) {
    legalAdviser = models
        .elementAt(models.indexWhere((f) => f.id == Constant.LEGALADVISER));
  }

  pdf.addPage(
    pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16),
        build: (pw.Context context) {
          return <pw.Widget>[
            if (president != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.PRESIDENT,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (president != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (president != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = president!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2]
                        .toString()
                        .compareTo(mapvalue[k1].toString()));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //v president
            if (vPresident != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.VPRESIDENT,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (vPresident != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (vPresident != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = vPresident!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),
            //v p ii
            if (vPresidentii != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.VPRESIDENTII,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (vPresidentii != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (vPresidentii != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = vPresidentii!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),
            //SECRETARYGENRAL
            if (secretaryGen != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.SECRETARYGENRAL,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (secretaryGen != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (secretaryGen != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = secretaryGen!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //ASSSECRETARYGENERAL
            if (assSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.ASSSECRETARYGENERAL,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (assSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (assSec != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = assSec!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //FINANCIALSECRETARY
            if (finSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.FINANCIALSECRETARY,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (finSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (finSec != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = finSec!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //ASSISTANTFINANCIALSECRETARY

            if (assFinSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.ASSISTANTFINANCIALSECRETARY,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (assFinSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (assFinSec != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = assFinSec!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //TREASURER
            if (treasure != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.TREASURER,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (treasure != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (treasure != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = treasure!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //ASSISTANTTREASURER
            if (assTreaserer != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.ASSISTANTTREASURER,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (assTreaserer != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (assTreaserer != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = assTreaserer!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //PROI
            if (proi != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.PROI,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (proi != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (proi != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = proi!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //PROII

            if (proii != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.PROII,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (proii != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (proii != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = proii!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //AUDITORI
            if (auditor1 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.AUDITORI,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (auditor1 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (auditor1 != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = auditor1!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //AUDITORII
            if (auditor11 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.AUDITORII,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (auditor11 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (auditor11 != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = auditor11!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //WELFAREDIRECTORI
            if (welfare1 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.WELFAREDIRECTORI,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (welfare1 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (welfare1 != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = welfare1!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //WELFAREDIRECTORII
            if (welfare11 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.WELFAREDIRECTORII,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (welfare11 != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (welfare11 != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = welfare11!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //ORGANISINGSECRETARY
            if (orgSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.ORGANISINGSECRETARY,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (orgSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (orgSec != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = orgSec!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //ASSORGANISINGSECRETARY
            if (assOrgSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.ASSORGANISINGSECRETARY,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (assOrgSec != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (assOrgSec != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = assOrgSec!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),

            //LEGALADVISER
            if (legalAdviser != null)
              pw.SizedBox(
                height: 20,
                child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                  pw.Text(
                    Constant.LEGALADVISER,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ]),
              ),
            if (legalAdviser != null)
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Count(s)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Level',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (legalAdviser != null)
              pw.ListView.separated(
                separatorBuilder: (pw.Context context, int index) =>
                    pw.Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // parsing the maps in the list before passing them into the extracted widget
                  // the itemBuilder iterates through the list
                  final mapvalue = legalAdviser!.list;

                  var sortedKeys = mapvalue.keys.toList(growable: false)
                    ..sort((k1, k2) => mapvalue[k2].compareTo(mapvalue[k1]));
                  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(
                      sortedKeys,
                      key: (k) => k,
                      value: (k) => mapvalue[k]);
                  List<pw.Widget> list1 = [];
                  sortedMap.forEach((key, value) {
                    list1.add(
                      pw.SizedBox(
                        height: 15,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 3,
                              child: pw.Text(key.split(',').first.trim()),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '    $value',
                                textAlign: pw.TextAlign.left,
                                style: const pw.TextStyle(),
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Text(key.split(',').last.trim(),
                                  textAlign: pw.TextAlign.right),
                            ),
                          ],
                        ),
                      ),
                    );
                  });

                  return pw.Column(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [...list1],
                  );
                },
              ),
          ];
        }),
  );

  final documentPath = await getExternalStorageDirectory();
  // String documentPath = documentDirectory.path;
  print(' this is the part $documentPath');
  // String path = '${documentPath!.path}/vote.pdf';
  final diraa = await getTemporaryDirectory();
  final path = diraa.absolute.path + "/Original result.pdf";
  print(' this is the part $path');
  File receiptFile = File(path);
  receiptFile.writeAsBytesSync(await pdf.save());
  Share.shareFiles([path]);
}
