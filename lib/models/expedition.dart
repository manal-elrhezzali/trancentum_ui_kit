import 'package:flutter/material.dart';

enum Etat {
  Enregistree,
  Chargee,
  Recue,
  Livree,
  Retour,
  Cloturee,
  Brouillon,
}

enum TypeTaxation {
  Forfait,
  Taxation,
  Service,
}

enum ModePaiement {
  PP,
  PPE,
  PD,
  PDE
}

class Expedition {
  String clientDestinataireId;
  String clientExpediteurId;
  String codeABarre;
  String codeExpedition;
  String codeGenere;
  DateTime dCloturation;
  DateTime dLivraison;
  DateTime dcreation;
  Etat etat;
  ModePaiement modePaiement;
  int nbrColis;
  int nbrFactures;
  num pht;
  double premise;
  double ptaxe1;
  double ptaxe2;
  double ptaxe3;
  double ptaxe4;
  double pttc;
  double ptva;
  TypeTaxation taxation;
  double ttlPoids;
  double ttlValDeclaree;
  String typeLivraison;
  String villeDestinataireId;
  String villeExpediteurId;

  Expedition({
    @required this.clientDestinataireId,
    @required this.clientExpediteurId,
   this.codeABarre = "",
    @required this.codeExpedition,
    this.codeGenere= "",
    this.dCloturation,
    this.dLivraison,
    @required this.dcreation,
    @required this.etat,
    @required this.modePaiement,
    @required this.nbrColis,
    @required this.nbrFactures,
    @required this.pht,
    @required this.premise,
    @required this.ptaxe1,
    @required this.ptaxe2,
    @required this.ptaxe3,
    @required this.ptaxe4,
    @required this.pttc,
    @required this.ptva,
    @required this.taxation,
    @required this.ttlPoids,
    @required this.ttlValDeclaree,
    @required this.typeLivraison,
    @required this.villeDestinataireId,
    @required this.villeExpediteurId,
  });
}
