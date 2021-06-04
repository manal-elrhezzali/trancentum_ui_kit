import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2 * defaultPadding),
      child: Column(
        children: [
          Header(),
          Spacer(),
          // SignInForm(),
          // Spacer(),
        ],
      ),
    );
  }
}

// class SignInForm extends StatelessWidget {
//   const SignInForm({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var underlineInputBorder = UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: bgColor,
//       ),
//     );
//     return Container(
//       width: 400,
//       child: Column(
//         children: [
//           TextFormField(
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: darkBgColor,
//               border: underlineInputBorder,
//               focusedBorder: underlineInputBorder,
//               labelText: "ICE",
//               floatingLabelBehavior: FloatingLabelBehavior.auto,
//               labelStyle: TextStyle(color: whiteColor),
//               // suffixIcon: Icon(
//               //   Icons.verified_sharp,
//               //   color: greenColor,  //redColor if input not valid,
//               // ),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 44,
//                 vertical: 20,
//               ),
//             ),
//           ),
//           SizedBox(height: defaultPadding),
//           TextFormField(
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: darkBgColor,
//               border: underlineInputBorder,
//               focusedBorder: underlineInputBorder,
//               labelText: "Mot de passe",
//               floatingLabelBehavior: FloatingLabelBehavior.auto,
//               labelStyle: TextStyle(color: whiteColor),
//               suffixIcon: Icon(
//                 Icons.visibility_off,
//                 color: redColor,
//               ),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 44,
//                 vertical: 20,
//               ),
//             ),
//           ),
//                     SizedBox(height: defaultPadding),

//         ],
//       ),
//     );
//   }
// }

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // add  trancentum logo
        Text(
          "Se connecter à TranCENTUM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Text(
          "Vous n'avez pas de compte ?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(width: 2 * defaultPadding),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(defaultPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            side: BorderSide(
              color: redColor,
              width: 1,
            ),
          ),
          child: Text(
            "Contactez-nous",
          ),
        ),
      ],
    );
  }
}
