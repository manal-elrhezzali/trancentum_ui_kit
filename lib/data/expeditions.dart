import 'package:trancentum_ui_kit/models/expedition.dart';

List<Expedition> demoExpeditions = [
  // Expedition(
  //     clientDestinataireId: "c3",
  //     clientExpediteurId: "c1",
  //     codeABarre: "123456789",
  //     codeExpedition: "123456",
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
  //     clientDestinataireId: "c2",
  //     clientExpediteurId: "c1",
  //     codeABarre: "223456789",
  //     codeExpedition: "223456",
  //     codeGenere: "223456",
  //     etat: Etat.Cloturee,
  //     dCloturation: DateTime.now(),
  //     dLivraison: DateTime.now(),
  //     dcreation: DateTime.now(),
  //     modePaiement: "PPE",
  //     nbrColis: 12,
  //     nbrFactures: 15,
  //     pht: 12098,
  //     premise: 12.32,
  //     ptaxe1: 11.34,
  //     ptaxe2: 10.34,
  //     ptaxe3: 12.32,
  //     ptaxe4: 12.32,
  //     pttc: 12.32,
  //     ptva: 12.32,
  //     taxation: "Taxation",
  //     ttlPoids: 12.32,
  //     ttlValDeclaree: 12.32,
  //     typeLivraison: "a domicile",
  //     villeDestinataireId: "v1",
  //     villeExpediteurId: "v2"),
  // Expedition(
  //     clientDestinataireId: "c2",
  //     clientExpediteurId: "c1",
  //     codeABarre: "323456789",
  //     codeExpedition: "323456",
  //     codeGenere: "323456",
  //     etat: Etat.Enregistree,
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
