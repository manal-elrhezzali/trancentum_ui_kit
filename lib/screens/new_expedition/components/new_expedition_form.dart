import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/default_button.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class NewExpeditionForm extends StatefulWidget {
  @override
  _NewExpeditionFormState createState() => _NewExpeditionFormState();
}

class _NewExpeditionFormState extends State<NewExpeditionForm> {
  final _formKey = GlobalKey<FormState>();
  //exepediteur/destinataire subform focus nodes
  final _telExpediteurFocusNode = FocusNode();
  final _nomDestinataireFocusNode = FocusNode();
  final _telDestinataireFocusNode = FocusNode();

  //Retours de fonds subForm focus noddes
  final _nbrDeBonsFocusNode = FocusNode();
  final _nbrFacturesFocusNode = FocusNode();
  final _montantRetoursDeFondsFocusNode = FocusNode();
  final _nbrRetoursDeFondsFocusNode = FocusNode();

  //Reglement focus noddes
  final _nbrColisFocusNode = FocusNode();

  // List<Ville> villes = [];

  List villes = <Map>[];
  List listItemsRetoursFondsDropDownButton = [];
  List listItemsTypeMarchandiseDropDownButton = [];
  List listItemsModePaiementDropDownButton = [];
  List listItemsTypeTaxationDropDownButton = [];

  // var telPattern = r'ˆ[0][0-9]{9}$'; //review this
  // var fixePattern = r'ˆ[0][0-9]{9}$'; //review this
  // var faxPattern = r'ˆ[0][0-9]{9}$'; //review this

  Expedition expedition = Expedition(
    etat: "Brouillon",
    ptaxe1: 0.0,
    ptaxe2: 0.0,
    ptaxe3: 0.0,
    dcreation: DateTime.now(),
    codeGenere: "",
    codeExpedition: "",
    modePaiement: "PD",
    taxation: "Forfait",
    nbrColis: 0,
    nbrFactures: 0,
    pht: 0,
    premise: 0.0,
    ptaxe4: 0.0,
    pttc: 0.0,
    ptva: 0.0,
    ttlPoids: 0.0,
    ttlValDeclaree: 0.0,
    typeLivraison: "",
    codeABarre: "",
    clientDestinataireId: "",
    clientExpediteurId: "",
    villeDestinataireId: "",
    villeExpediteurId: "",
  );

  //// expediteur / destinataire form
  String nomExpediteur = "";
  String telExpediteur = "";
  String nomDestinataire = "";
  String telDestinataire = "";
  //----->dropDown
// String _initialValueVilleExpediteur = "Fes";
  var _initialValueVilleExpediteur;
  var _initialValueVilleDestinataire;

  //// Retours de fonds form
  String nbrDeBonsLivraison = "";
  String nbrFactures = "";
  String montant = "";
  String nombre = "";
  //----->dropDown
  var _initialValueTypeDeRetours;

  //// Reglements form
  String nombreDeColis = "";
  //----->dropDown
  var _initialValueTypeMarchandise;
  var _initialValueModePaiement;
  var _initialValueTypeTaxation = "Forfait";

  @override
  void dispose() {
    _telExpediteurFocusNode.dispose();
    _nomDestinataireFocusNode.dispose();
    _telDestinataireFocusNode.dispose();
    _nbrFacturesFocusNode.dispose();
    _montantRetoursDeFondsFocusNode.dispose();
    _nbrRetoursDeFondsFocusNode.dispose();
    _nbrDeBonsFocusNode.dispose();
    _nbrColisFocusNode.dispose();

    super.dispose();
  }

  // @override
  // void didChangeDependencies() {

  //     villes = Provider.of<Villes>(context).items;
  //     print("villes got from provider are : ${villes[0].nom}");

  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();

    //get json Map from Back-End
    villes = [
      {
        'id': 'c1',
        'nom': 'Fes',
      },
      {
        'id': 'c2',
        'nom': 'Meknes',
      },
      {
        'id': 'c3',
        'nom': 'Tanjer',
      },
    ];
    listItemsRetoursFondsDropDownButton = [
      "C/Remboursement",
      "C/Cheque",
      "C/Traite",
      "C/BL",
    ];
    listItemsTypeMarchandiseDropDownButton = [
      "Marchandise 1",
      "Marchandise 2",
    ];
    listItemsModePaiementDropDownButton = [
      "PP",
      "PPE",
      "PD",
      "PDE",
    ];
    listItemsTypeTaxationDropDownButton = [
      "Forfait",
      "Taxation",
      "Service",
    ];
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    ///remove these prints
    print(nomExpediteur);
    print(telExpediteur);
    print(nomDestinataire);
    print(telDestinataire);
    print(_initialValueVilleExpediteur);
    print(_initialValueVilleDestinataire);
    //
    print(nbrDeBonsLivraison);
    print(nbrFactures);
    print(montant);
    print(nombre);
    print(_initialValueTypeDeRetours);
    //
    print(nombreDeColis);
    print(_initialValueTypeMarchandise);
    print(_initialValueModePaiement);
    print(_initialValueTypeTaxation);

    Navigator.of(context).pushNamed(HomeScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Expedition added",
        ),
      ),
    );
  }

  Widget buildSubForm(String title, List<Widget> widgets) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          ...widgets,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5, //takes 5/6 of the screen
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      buildSubForm(
                        "Expéditeur / Destinataire",
                        [
                          TextFormField(
                            onSaved: (newValue) => nomExpediteur = newValue,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_telExpediteurFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le nom de l\'expediteur";
                              }
                              return null; //means there is no error
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nom d\'expéditeur",
                              labelText: "Nom Expéditeur",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le nom d\'expéditeur", "Nom Expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          TextFormField(
                            focusNode: _telExpediteurFocusNode,
                            onSaved: (newValue) => telExpediteur = newValue,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_nomDestinataireFocusNode);
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir un tel";
                              }
                              // var result =
                              //     new RegExp(telPattern, caseSensitive: false)
                              //         .hasMatch(value);
                              // if (!result) {
                              //   return "Veuillez saisir un tel valid";
                              // }
                              return null; //means there is no error
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le tel d\'expéditeur",
                              labelText: "Tél Expéditeur",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),

                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le tel d\'expéditeur", "Tél Expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),

                          TextFormField(
                            focusNode: _nomDestinataireFocusNode,
                            onSaved: (newValue) => nomDestinataire = newValue,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_telDestinataireFocusNode);
                            },
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir un nom";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nom destinataire",
                              labelText: "Nom Destinataire",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),

                          // buildTextFormField(outlineInputBorder,
                          // "Enter le nom destinataire", "Nom Destinataire"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          TextFormField(
                            focusNode: _telDestinataireFocusNode,
                            onSaved: (newValue) => telDestinataire = newValue,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir un tel";
                              }
                              // var result =
                              //     new RegExp(telPattern, caseSensitive: false)
                              //         .hasMatch(value);
                              // if (!result) {
                              //   return "Veuillez saisir un tel valid";
                              // }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le tel destinataire",
                              labelText: "Tél Destinataire",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le tel destinataire", "Tél Destinataire"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Ville Expéditeur"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              // value: _initialValueVilleExpediteur,

                              value: _initialValueVilleExpediteur,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueVilleExpediteur = newValue;
                                });
                              },
                              items: villes.map((ville) {
                                return DropdownMenuItem(
                                  value: ville["id"],
                                  child: Text(
                                    ville["nom"], // the prob is here
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          // buildDropDownButton(
                          //   villeExpediteur,
                          //   villesExped,
                          //   "Ville Expéditeur",
                          // ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Ville Destinataire"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              // value: _initialValueVilleDestinataire,
                              value: _initialValueVilleDestinataire,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueVilleDestinataire = newValue;
                                });
                                FocusScope.of(context)
                                    .requestFocus(_nbrDeBonsFocusNode);
                              },
                              items: villes.map((ville) {
                                return DropdownMenuItem(
                                  value: ville["id"],
                                  child: Text(
                                    ville["nom"],
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildSubForm(
                        "Retours de fonds",
                        [
                          TextFormField(
                            focusNode: _nbrDeBonsFocusNode,
                            onSaved: (newValue) =>
                                nbrDeBonsLivraison = newValue,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_nbrFacturesFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le nombre de Bons Livraison";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nbr de bons",
                              labelText: "Bons Livraison",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le nbr de bons ", "Bons Livraison"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          TextFormField(
                            focusNode: _nbrFacturesFocusNode,
                            onSaved: (newValue) => nbrFactures = newValue,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(
                                  _montantRetoursDeFondsFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le nbr de factures";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nbr de factures",
                              labelText: "Nombre de factures",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le nbr de factures", "Nombre de factures"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          TextFormField(
                            focusNode: _montantRetoursDeFondsFocusNode,
                            onSaved: (newValue) => montant = newValue,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_nbrRetoursDeFondsFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le montant";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le montant",
                              labelText: "Montant",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le montant", "Montant"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          TextFormField(
                            focusNode: _nbrRetoursDeFondsFocusNode,
                            onSaved: (newValue) => nombre = newValue,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le nombre";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nombre",
                              labelText: "Nombre",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(
                          //     outlineInputBorder, "Enter le nombre", "Nombre"),
                          SizedBox(height: getProportionateScreenHeight(20)),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Type de retours"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _initialValueTypeDeRetours,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueTypeDeRetours = newValue;
                                });
                              },
                              items: listItemsRetoursFondsDropDownButton
                                  .map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // buildDropDownButton(
                          //     _initialValueTypeDeRetours,
                          //     listItemsRetoursFondsDropDownButton,
                          //     "Type de retours"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildSubForm(
                        "Règlement",
                        [
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) => nombreDeColis = newValue,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez saisir le Nombre de Colis";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter le nbr de colis",
                              labelText: "Nombre de Colis",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(outlineInputBorder,
                          //     "Enter le nbr de colis ", "Nombre de Colis"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Type de Marchandise"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _initialValueTypeMarchandise,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueTypeMarchandise = newValue;
                                });
                              },
                              items: listItemsTypeMarchandiseDropDownButton
                                  .map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // buildDropDownButton(
                          //     _initialValueTypeMarchandise,
                          //     listItemsTypeMarchandiseDropDownButton,
                          //     "Type de Marchandise"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Mode Paiement"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _initialValueModePaiement,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueModePaiement = newValue;
                                });
                              },
                              items: listItemsModePaiementDropDownButton
                                  .map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          // buildDropDownButton(
                          //     _initialValueModePaiement,
                          //     listItemsModePaiementDropDownButton,
                          //     "Mode Paiement"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 42,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kTextColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: DropdownButton(
                              hint: Text("Type de Taxation"),
                              dropdownColor: kPrimaryColor,
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _initialValueTypeTaxation,
                              onChanged: (newValue) {
                                setState(() {
                                  _initialValueTypeTaxation = newValue;
                                });
                              },
                              items: listItemsTypeTaxationDropDownButton
                                  .map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: greenColor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // buildDropDownButton(
                          //     _initialValueTypeTaxation,
                          //     listItemsTypeTaxationDropDownButton,
                          //     "Type de Taxation"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      DefaultButton(text: "Confirmer", pressHandler: _saveForm),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Container buildDropDownButton(var valueChose, List listItems, String hint) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 42,
  //       vertical: 8,
  //     ),
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: kTextColor,
  //         width: 1,
  //       ),
  //       borderRadius: BorderRadius.circular(28),
  //     ),
  //     child: DropdownButton(
  //       hint: Text(hint),
  //       dropdownColor: kPrimaryColor,
  //       icon: Icon(Icons.keyboard_arrow_down_rounded),
  //       isExpanded: true,
  //       underline: SizedBox(),
  //       value: valueChose,
  //       onChanged: (newValue) {
  //         setState(() {
  //           valueChose = newValue;
  //         });
  //       },
  //       items: listItems.map((valueItem) {
  //         return DropdownMenuItem(
  //           value: valueItem,
  //           child: Text(
  //             valueItem,
  //             style: TextStyle(color: greenColor),
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

  // TextFormField buildTextFormField(
  //     OutlineInputBorder outlineInputBorder, String hint, String label) {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       labelText: label,
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       contentPadding: EdgeInsets.symmetric(
  //         horizontal: 42,
  //         vertical: 20,
  //       ),
  //       enabledBorder: outlineInputBorder,
  //       focusedBorder: outlineInputBorder,
  //       border: outlineInputBorder,
  //     ),
  //   );
  // }
}
