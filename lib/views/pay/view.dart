// import 'dart:io';
//
// import 'package:app/core/logic/my_fatwora_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:myfatoorah_flutter/MFCardView.dart';
// import 'package:myfatoorah_flutter/MFModels.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
//
// class PayView extends StatefulWidget {
//   const PayView({super.key});
//
//   @override
//   State<PayView> createState() => _PayViewState();
// }
//
// class _PayViewState extends State<PayView> {
//   late MFCardPaymentView mfCardView;
//
//   Future<void> initSession() async {
//     /*
//       If you want to use saved card option with embedded payment, send the parameter
//       "customerIdentifier" with a unique value for each customer. This value cannot be used
//       for more than one Customer.
//      */
//     // var request = MFInitiateSessionRequest("12332212");
//     /*
//       If not, then send null like this.
//      */
//     final initiateSessionRequest = MFInitiateSessionRequest();
//
//     await MFSDK
//         .initSession(
//           initiateSessionRequest,
//           MFLanguage.ENGLISH,
//         )
//         .then(
//           (value) => loadEmbeddedPayment(value),
//         )
//         .catchError(
//           (error) => {
//             debugPrint(error.message),
//           },
//         );
//   }
//
//   void loadEmbeddedPayment(MFInitiateSessionResponse session) {
//     loadCardView(session);
//     // todo: add apple pay
//     // if (Platform.isIOS) applePayPayment(session);
//   }
//
//   void loadCardView(MFInitiateSessionResponse session) {
//     mfCardView.load(session, (bin) {
//       debugPrint(bin);
//     });
//   }
//
//   void pay(num amount) async {
//     final request = MFExecutePaymentRequest(invoiceValue: amount);
//     // todo add session Id
//     request.sessionId = "sessionId";
//
//     await mfCardView
//         .pay(request, MFLanguage.ENGLISH, (invoiceId) {
//           debugPrint(invoiceId);
//         })
//         .then(
//           (value) => {
//             debugPrint(
//               value.toString(),
//             ),
//           },
//         )
//         .catchError(
//           (error) => {
//             debugPrint(error.message),
//           },
//         );
//   }
//
//   // Future<void> executeDirectPayment() async {
//   //   var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10,);
//   //   executePaymentRequest.paymentMethodId = 20;
//   //
//   //   var mfCardRequest = MFCard(
//   //     cardHolderName: 'myFatoorah',
//   //     number: '5454545454545454',
//   //     expiryMonth: '10',
//   //     expiryYear: '23',
//   //     securityCode: '000',
//   //   );
//   //
//   //   var directPaymentRequest = MFDirectPaymentRequest(
//   //     executePaymentRequest: executePaymentRequest,
//   //     token:
//   //         "NcXOk31jBBUjeBF3qUWB4jWg8vcXgMsVivTj_Oyogwn_lOZ5LXaE1j4YLCjmVbf2s7u8Ay31z0OEEF-L2esQ7a5QPvZpQmWliDtf7AcO6i7aIQ6BiuvbzYDDaEoxLUWsdPlohpwE1xgwIUSWzbc0ChpuK-kNSXVZquH0gAGf2bllA2uk27UdjgjjVXbjS2CdI09m5OF_vSFTD6QR8sHF9Jtj9iWru0aNjKjh7fbUzvH1V15OFVSpzOjUWRAZ6JR8oWC0jaS0vBm2oYKROATA7GGkrZhFR7vGEnEjPzi8bvpoJPf-scD5iT3qOPXQoR0ZudcvbIFKwcNL5NWzkO1-PaEPon40BoymGgbhwKbXeb1f13G3Vg3Fpx4yDitqdDYtZ2ca4I0Yz3Fgcc3Yko2q5M4deUBFB40R6abLIpv9GuPcyjKnxibe7nulTHDwcsWqwiZ2Ggd4cBijY-tWFQidMoK70iIScaUlBHt2wD8Fyn2rMewae0Hw8iVdEOniczIDgaGalC5pjEUjw7DH1j41S1ARJfadTLsSu16BNxcpmllJmuzHlRKYLlFu28yLf65QktYIUxzkh7P3glcW12v-IC9mpkEA3qmMvMSlXqXRS2kUAaN8L4oGqNNBRkDB_-D_F44ii28PJgzOs8bDpPuP-k019ckBPsPM1937Qs3zO5z-3zFwis2aDgyrH9eQKsv14m52_g",
//   //     card: mfCardRequest,
//   //   );
//   //
//   //   await MFSDK
//   //       .executeDirectPayment(directPaymentRequest, MFLanguage.ENGLISH,
//   //           (invoiceId) {
//   //         debugPrint(invoiceId);
//   //       })
//   //       .then((value) => debugPrint(value.toString()))
//   //       .catchError((error) => {debugPrint(error.message)});
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     mfCardView = MFCardPaymentView(
//       cardViewStyle: MyFatworaHelper.cardViewStyle(),
//     );
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             FilledButton(
//                 onPressed: () {
//                   // executeDirectPayment();
//                 },
//                 child: Text("Pay"))
//             // SizedBox(
//             //   height: 200,
//             //   child: mfCardView,
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
