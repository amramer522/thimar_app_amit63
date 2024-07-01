// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
//
// class MyFatworaHelper {
//   static late int paymentMethodId;
//
//   static Future<void> init() async {
//     // todo add your api key
//     MFSDK.init(
//       "NcXOk31jBBUjeBF3qUWB4jWg8vcXgMsVivTj_Oyogwn_lOZ5LXaE1j4YLCjmVbf2s7u8Ay31z0OEEF-L2esQ7a5QPvZpQmWliDtf7AcO6i7aIQ6BiuvbzYDDaEoxLUWsdPlohpwE1xgwIUSWzbc0ChpuK-kNSXVZquH0gAGf2bllA2uk27UdjgjjVXbjS2CdI09m5OF_vSFTD6QR8sHF9Jtj9iWru0aNjKjh7fbUzvH1V15OFVSpzOjUWRAZ6JR8oWC0jaS0vBm2oYKROATA7GGkrZhFR7vGEnEjPzi8bvpoJPf-scD5iT3qOPXQoR0ZudcvbIFKwcNL5NWzkO1-PaEPon40BoymGgbhwKbXeb1f13G3Vg3Fpx4yDitqdDYtZ2ca4I0Yz3Fgcc3Yko2q5M4deUBFB40R6abLIpv9GuPcyjKnxibe7nulTHDwcsWqwiZ2Ggd4cBijY-tWFQidMoK70iIScaUlBHt2wD8Fyn2rMewae0Hw8iVdEOniczIDgaGalC5pjEUjw7DH1j41S1ARJfadTLsSu16BNxcpmllJmuzHlRKYLlFu28yLf65QktYIUxzkh7P3glcW12v-IC9mpkEA3qmMvMSlXqXRS2kUAaN8L4oGqNNBRkDB_-D_F44ii28PJgzOs8bDpPuP-k019ckBPsPM1937Qs3zO5z-3zFwis2aDgyrH9eQKsv14m52_g",
//       MFCountry.EGYPT,
//       MFEnvironment.LIVE,
//     );
//     final request = MFInitiatePaymentRequest(currencyIso: "EGY");
//     await MFSDK.initiatePayment(request, MFLanguage.ENGLISH).then(
//       (response) {
//         print("*" * 30);
//         print(response.paymentMethods?.length);
//         // response.paymentMethods?.forEach(
//         //   (element) {
//         //     print(element.paymentMethodEn);
//         //     print(element.paymentMethodAr);
//         //     print(element.paymentMethodId);
//         //   },
//         // );
//         // debugPrint(
//         //   response.toString(),
//         // );
//       },
//     ).catchError(
//       (error) {
//         print("*" * 30 + "Erorr");
//         print(
//           error.message,
//         );
//       },
//     );
//   }
//
//   static Future<void> pay(num amount) async {
//     final request = MFExecutePaymentRequest(invoiceValue: amount);
//     request.paymentMethodId = paymentMethodId;
//
//     await MFSDK
//         .executePayment(
//           request,
//           MFLanguage.ENGLISH,
//           (invoiceId) {
//             debugPrint(invoiceId);
//           },
//         )
//         .then((value) => debugPrint(value.toString()))
//         .catchError((error) => {debugPrint(error.message)});
//   }
//
//   static void makeAppBar() {
//     MFSDK.setUpActionBar(
//       toolBarTitle: 'Company Payment',
//       toolBarTitleColor: '#FFEB3B',
//       toolBarBackgroundColor: '#CA0404',
//       isShowToolBar: true,
//     );
//   }
//
//   static Future<void> sendPaymentInEmail(String clientName, num amount) async {
//     MFSendPaymentRequest request = MFSendPaymentRequest();
//     request.customerName = clientName;
//     request.invoiceValue = amount;
//     request.notificationOption = MFNotificationOption.EMAIL;
//
//     await MFSDK
//         .sendPayment(request, MFLanguage.ENGLISH)
//         .then(
//           (value) => debugPrint(
//             value.toString(),
//           ),
//         )
//         .catchError(
//           (error) => {
//             debugPrint(error.message),
//           },
//         );
//   }
//
//   static Future<void> getPaymentStatusDetails(String invoiceId) async {
//     final request = MFGetPaymentStatusRequest(
//       key: invoiceId,
//       keyType: MFKeyType.INVOICEID,
//     );
//     await MFSDK
//         .getPaymentStatus(
//           request,
//           MFLanguage.ENGLISH,
//         )
//         .then(
//           (value) => debugPrint(
//             value.toString(),
//           ),
//         )
//         .catchError(
//           (error) => {
//             debugPrint(error.message),
//           },
//         );
//   }
//
//   static MFCardViewStyle cardViewStyle() {
//     final cardViewStyle = MFCardViewStyle();
//     cardViewStyle.cardHeight = 200;
//     cardViewStyle.hideCardIcons = false;
//     cardViewStyle.input?.inputMargin = 5;
//     cardViewStyle.label?.display = true;
//     cardViewStyle.input?.fontFamily = MFFontFamily.Monaco;
//     cardViewStyle.label?.fontWeight = MFFontWeight.Heavy;
//     return cardViewStyle;
//   }
// }
