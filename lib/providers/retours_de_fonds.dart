import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/retour_fonds.dart';

class RetoursDeFonds with ChangeNotifier {
  List<RetourFonds> _items = [
    RetourFonds(
      banqueId: "B1",
      dCreation: DateTime.now().toIso8601String(),
      montant: 13452.76,
      nombre: 123,
      serie: "CCCCC",
      observation: "very good",
      etat: "en attente",
      codeExpedition: "123456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: TypeRetourFonds.Remboursement,
    ),
    RetourFonds(
      banqueId: "B2",
      dCreation: DateTime.now().toIso8601String(),
      montant: 23452.76,
      nombre: 124,
      serie: "CCCCC",
      observation: "very good 2",
      etat: "en attente",
      codeExpedition: "223456",
      dEnvoi: DateTime.now().toIso8601String(),
      type: TypeRetourFonds.Cheque,
    ),
  ];
  // final String codeExpedition,
  //     retourDeFonds,
  //     montant,
  //     nombre,
  //     banque,
  //     serie,
  //     observation,
  //     etat;

  List<RetourFonds> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  RetourFonds findById(String codeExpedition) {
    return _items.firstWhere(
        (retourFonds) => retourFonds.codeExpedition == codeExpedition,
        orElse: () => null);
  }
}
