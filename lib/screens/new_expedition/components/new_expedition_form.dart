import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/default_button.dart';
import 'package:trancentum_ui_kit/data/dummyVilles.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/models/ville.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class NewExpeditionForm extends StatefulWidget {
  @override
  _NewExpeditionFormState createState() => _NewExpeditionFormState();
}

class _NewExpeditionFormState extends State<NewExpeditionForm> {
  final _formKey = GlobalKey<FormState>();
  final _telExpediteurFocusNode = FocusNode();
  final _nomDestinataireFocusNode = FocusNode();
  final _telDestinataireFocusNode = FocusNode();
  final _nbrFacturesFocusNode = FocusNode();
  final _montantRetoursDeFondsFocusNode = FocusNode();
  final _nbrRetoursDeFondsFocusNode = FocusNode();

  var telPattern = r'ˆ[0][0-9]{9}$';
  Expedition expedition = Expedition(
    etat: Etat.Brouillon,
    ptaxe1: 0.0,
    ptaxe2: 0.0,
    ptaxe3: 0.0,
    dcreation: DateTime.now(),
    codeGenere: "",
    codeExpedition: "",
    modePaiement: ModePaiement.PD,
    taxation: TypeTaxation.Forfait,
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
  String villeExpediteur = "";
  String villeDestinataire = "";

  //// Retours de fonds form
  String nbrDeBonsLivraison = "";
  String nbrFactures = "";
  String montant = "";
  String nombre = "";
  //----->dropDown
  String typeDeRetours = "";

  //// Reglements form
  String nombreDeColis = "";
  //----->dropDown
  String typeMarchandise = "";
  String modePaiement = "";
  String typeTaxation = "";

  @override
  void dispose() {
    _telExpediteurFocusNode.dispose();
    _nomDestinataireFocusNode.dispose();
    _telDestinataireFocusNode.dispose();
    _nbrFacturesFocusNode.dispose();
    _montantRetoursDeFondsFocusNode.dispose();
    _nbrRetoursDeFondsFocusNode.dispose();

    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(nomExpediteur);
    print(telExpediteur);
    print(nomDestinataire);
    print(telDestinataire);
    print(villeExpediteur);
    print(villeDestinataire);
    //
    print(nbrDeBonsLivraison);
    print(nbrFactures);
    print(montant);
    print(nombre);
    print(typeDeRetours);
    //
    print(nombreDeColis);
    print(typeMarchandise);
    print(modePaiement);
    print(typeTaxation);

    Navigator.of(context).pushNamed(HomeScreen.routeName);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Expedition added",
        ),
        action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              //undo the  addition
              //show dilaog to confirm with user
            }),
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

    List listItemsRetoursFondsDropDownButton = [
      "C/Remboursement",
      "C/chèque",
      "C/Traite",
      "C/BL",
    ];
    List listItemsTypeMarchandiseDropDownButton = [
      "marchandise 1",
      "marchandise 2",
    ];
    List listItemsModePaiementDropDownButton = [
      "PP",
      "PPE",
      "PD",
      "PDE",
    ];
    List listItemsTypeTaxationDropDownButton = [
      "Forfait",
      "Taxation",
      "Service",
    ];
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
                              var result =
                                  new RegExp(telPattern, caseSensitive: false)
                                      .hasMatch(value);
                              if (!result) {
                                return "Veuillez saisir un tel valid";
                              }
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
                              var result =
                                  new RegExp(telPattern, caseSensitive: false)
                                      .hasMatch(value);
                              if (!result) {
                                return "Veuillez saisir un tel valid";
                              }
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
                              value: villeExpediteur,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue == null &&
                                      dummyVilles.isNotEmpty) {
                                    villeExpediteur = dummyVilles[0].nom;
                                  } else {
                                    villeExpediteur = newValue;
                                  }
                                });
                              },
                              items: dummyVilles.map((ville) {
                                return DropdownMenuItem(
                                  value: ville,
                                  child: Text(
                                          ville.nom, // the prob is here
                                          style: TextStyle(color: Colors.white),
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
                              value: villeDestinataire,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue == null &&
                                      dummyVilles.isNotEmpty) {
                                    villeDestinataire = dummyVilles[0].nom;
                                  } else {
                                    villeDestinataire = newValue;
                                  }
                                });
                              },
                              items: dummyVilles.map((ville) {
                                return DropdownMenuItem(
                                  value: ville,
                                  child: Text(
                                    ville.nom,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // buildDropDownButton(
                          //   villeDestinataire,
                          //   villesExped,
                          //   "Ville Destinataire",
                          // ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildSubForm(
                        "Retours de fonds",
                        [
                          TextFormField(
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
                            onSaved: (newValue) => montant = newValue,
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
                          buildDropDownButton(
                              typeDeRetours,
                              listItemsRetoursFondsDropDownButton,
                              "Type de retours"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildSubForm(
                        "Règlement",
                        [
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) => montant = newValue,
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
                          buildDropDownButton(
                              typeMarchandise,
                              listItemsTypeMarchandiseDropDownButton,
                              "Type de Marchandise"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildDropDownButton(
                              modePaiement,
                              listItemsModePaiementDropDownButton,
                              "Mode Paiement"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildDropDownButton(
                              typeTaxation,
                              listItemsTypeTaxationDropDownButton,
                              "Type de Taxation"),
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

  Container buildDropDownButton(
      String valueChose, List listItems, String hint) {
    return Container(
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
        hint: Text(hint),
        dropdownColor: kPrimaryColor,
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        underline: SizedBox(),
        value: valueChose,
        onChanged: (newValue) {
          setState(() {
            if (newValue == null && listItems.isNotEmpty) {
              valueChose = listItems[0];
            } else {
              valueChose = newValue;
            }
          });
        },
        items: listItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(
              valueItem,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }

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
