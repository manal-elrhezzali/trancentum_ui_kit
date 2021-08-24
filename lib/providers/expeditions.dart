import 'package:flutter/material.dart';

import 'expedition.dart';

class Expeditions with ChangeNotifier {
  List<Expedition> _items = [
    Expedition(
        clientDestinataireId: "c3",
        clientExpediteurId: "c1",
        codeABarre: "123456789",
        codeExpedition: "123456",
        codeGenere: "123456",
        etat: Etat.Chargee,
        dCloturation: DateTime.now(),
        dLivraison: DateTime.now(),
        dcreation: DateTime.now(),
        modePaiement: ModePaiement.PP,
        nbrColis: 11,
        nbrFactures: 15,
        pht: 12098,
        premise: 12.32,
        ptaxe1: 11.34,
        ptaxe2: 10.34,
        ptaxe3: 12.32,
        ptaxe4: 12.32,
        pttc: 12.32,
        ptva: 12.32,
        taxation: TypeTaxation.Forfait,
        ttlPoids: 12.32,
        ttlValDeclaree: 12.32,
        typeLivraison: "a domicile",
        villeDestinataireId: "v2",
        villeExpediteurId: "v1"),
    Expedition(
      clientDestinataireId: "c2",
      clientExpediteurId: "c1",
      codeABarre: "223456789",
      codeExpedition: "223456",
      codeGenere: "223456",
      etat: Etat.Cloturee,
      dCloturation: DateTime.now(),
      dLivraison: DateTime.now(),
      dcreation: DateTime.now(),
      modePaiement: ModePaiement.PDE,
      nbrColis: 12,
      nbrFactures: 15,
      pht: 12098,
      premise: 12.32,
      ptaxe1: 11.34,
      ptaxe2: 10.34,
      ptaxe3: 12.32,
      ptaxe4: 12.32,
      pttc: 12.32,
      ptva: 12.32,
      taxation: TypeTaxation.Service,
      ttlPoids: 12.32,
      ttlValDeclaree: 12.32,
      typeLivraison: "a domicile",
      villeDestinataireId: "v1",
      villeExpediteurId: "v2",
    ),
    Expedition(
        clientDestinataireId: "c2",
        clientExpediteurId: "c1",
        codeABarre: "323456789",
        codeExpedition: "323456",
        codeGenere: "323456",
        etat: Etat.Enregistree,
        dCloturation: DateTime.now(),
        dLivraison: DateTime.now(),
        dcreation: DateTime.now(),
        modePaiement: ModePaiement.PP,
        nbrColis: 13,
        nbrFactures: 15,
        pht: 12098,
        premise: 12.32,
        ptaxe1: 11.34,
        ptaxe2: 10.34,
        ptaxe3: 12.32,
        ptaxe4: 12.32,
        pttc: 12.32,
        ptva: 12.32,
        taxation: TypeTaxation.Service,
        ttlPoids: 12.32,
        ttlValDeclaree: 12.32,
        typeLivraison: "a domicile",
        villeDestinataireId: "v3",
        villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "423456",
    //     codeGenere: "323456",
    //     etat: Etat.Livree,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "523456",
    //     codeGenere: "323456",
    //     etat: Etat.Recue,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c2",
    //     clientExpediteurId: "c1",
    //     codeABarre: "323456789",
    //     codeExpedition: "523456",
    //     codeGenere: "323456",
    //     etat: Etat.Retour,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 13,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v3",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "623456",
    //     codeGenere: "123456",
    //     etat: Etat.Chargee,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Forfait",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "723456",
    //     codeGenere: "123456",
    //     etat: Etat.Chargee,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Forfait",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "823456",
    //     codeGenere: "123456",
    //     etat: Etat.Cloturee,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Forfait",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1"),
    // Expedition(
    //     clientDestinataireId: "c3",
    //     clientExpediteurId: "c1",
    //     codeABarre: "123456789",
    //     codeExpedition: "923456",
    //     codeGenere: "123456",
    //     etat: Etat.Cloturee,
    //     dCloturation: DateTime.now(),
    //     dLivraison: DateTime.now(),
    //     dcreation: DateTime.now(),
    //     modePaiement: "PP",
    //     nbrColis: 11,
    //     nbrFactures: 15,
    //     pht: 12098,
    //     premise: 12.32,
    //     ptaxe1: 11.34,
    //     ptaxe2: 10.34,
    //     ptaxe3: 12.32,
    //     ptaxe4: 12.32,
    //     pttc: 12.32,
    //     ptva: 12.32,
    //     taxation: "Service",
    //     ttlPoids: 12.32,
    //     ttlValDeclaree: 12.32,
    //     typeLivraison: "a domicile",
    //     villeDestinataireId: "v2",
    //     villeExpediteurId: "v1",),
  ];

  int expeditionEnregistreeCount = 0;
  int expeditionRecueCount = 0;
  int expeditionChargeeCount = 0;
  int expeditionLivreeCount = 0;
  int expeditionRetourCount = 0;
  int expeditionClotureeCount = 0;

  List<Expedition> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  int get nbrOfExpeditionsRetour {
    _items.forEach((element) {
      if (element.etat == Etat.Retour) {
        expeditionRetourCount++;
      }
    });
    return expeditionEnregistreeCount;
  }

  int get nbrOfExpeditionsRecue {
    _items.forEach((element) {
      if (element.etat == Etat.Recue) {
        expeditionRecueCount++;
      }
    });
    return expeditionEnregistreeCount;
  }

  int get nbrOfExpeditionsEnregistree {
    _items.forEach((element) {
      if (element.etat == Etat.Enregistree) {
        expeditionEnregistreeCount++;
      }
    });
    return expeditionEnregistreeCount;
  }

  int get nbrOfExpeditionsLivree {
    _items.forEach((element) {
      if (element.etat == Etat.Livree) {
        expeditionLivreeCount++;
      }
    });
    return expeditionEnregistreeCount;
  }

  int get nbrOfExpeditionsChargee {
    _items.forEach((element) {
      if (element.etat == Etat.Chargee) {
        expeditionChargeeCount++;
      }
    });
    return expeditionChargeeCount;
  }

  int get nbrOfExpeditionsCloturee {
    _items.forEach((element) {
      if (element.etat == Etat.Cloturee) {
        expeditionClotureeCount++;
      }
    });
    return expeditionClotureeCount;
  }

  Expedition findById(String codeExpedition) {
    return _items.firstWhere(
        (expedition) => expedition.codeExpedition == codeExpedition);
  }

  void addExpedition(Expedition expedition) {
    final newExpedition = Expedition(
      clientDestinataireId: expedition.clientDestinataireId,
      clientExpediteurId: expedition.clientExpediteurId,
      codeExpedition: expedition.codeExpedition,
      dcreation: expedition.dcreation,
      etat: expedition.etat,
      modePaiement: expedition.modePaiement,
      nbrColis: expedition.nbrColis,
      nbrFactures: expedition.nbrFactures,
      pht: expedition.pht,
      premise: expedition.premise,
      ptaxe1: expedition.ptaxe1,
      ptaxe2: expedition.ptaxe2,
      ptaxe3: expedition.ptaxe3,
      ptaxe4: expedition.ptaxe4,
      pttc: expedition.pttc,
      ptva: expedition.ptva,
      taxation: expedition.taxation,
      ttlPoids: expedition.ttlPoids,
      ttlValDeclaree: expedition.ttlValDeclaree,
      typeLivraison: expedition.typeLivraison,
      villeDestinataireId: expedition.villeDestinataireId,
      villeExpediteurId: expedition.villeExpediteurId,
      codeABarre: expedition.codeABarre,
      codeGenere: expedition.codeGenere,
      dCloturation: expedition.dCloturation,
      dLivraison: expedition.dLivraison,

      // title: product.title,
      // description: product.description,
      // price: product.price,
      // imageUrl: product.imageUrl,
      // id: DateTime.now().toString(),
    );
    _items.add(newExpedition);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void deleteExpedition(String codeExpedition) {
    _items.removeWhere(
        (expedition) => expedition.codeExpedition == codeExpedition);
    notifyListeners();
  }
}
