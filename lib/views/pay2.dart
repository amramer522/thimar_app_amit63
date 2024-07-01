import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class Pay2View extends StatelessWidget {
  const Pay2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MyFatoorah(
        onResult:(response){
          log(response.paymentId.toString());
          // print(res.status.toString()));
        },
        request: MyfatoorahRequest.test(
          currencyIso: Country.SaudiArabia,
          successUrl:
          "https://docs.myfatoorah.com/docs/test-cards",
          errorUrl:
          "https://www.youtube.com/watch?v=owYamPfa9co&t=281s",
          invoiceAmount: 100,
          language: ApiLanguage.Arabic,
          token: "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
        ),
      ),
      // body: Center(
      //   child: FilledButton(
      //     child: Text("Pay"),
      //     onPressed: () async {
      //       var response = await MyFatoorah.startPayment(
      //         context: context,
      //         request: MyfatoorahRequest.live(
      //           currencyIso: Country.Egypt,
      //           successUrl: "https://docs.myfatoorah.com/docs/test-cards",
      //           errorUrl: "https://www.youtube.com/watch?v=owYamPfa9co&t=281s",
      //           invoiceAmount: 100,
      //           language: ApiLanguage.English,
      //           token:
      //               "NcXOk31jBBUjeBF3qUWB4jWg8vcXgMsVivTj_Oyogwn_lOZ5LXaE1j4YLCjmVbf2s7u8Ay31z0OEEF-L2esQ7a5QPvZpQmWliDtf7AcO6i7aIQ6BiuvbzYDDaEoxLUWsdPlohpwE1xgwIUSWzbc0ChpuK-kNSXVZquH0gAGf2bllA2uk27UdjgjjVXbjS2CdI09m5OF_vSFTD6QR8sHF9Jtj9iWru0aNjKjh7fbUzvH1V15OFVSpzOjUWRAZ6JR8oWC0jaS0vBm2oYKROATA7GGkrZhFR7vGEnEjPzi8bvpoJPf-scD5iT3qOPXQoR0ZudcvbIFKwcNL5NWzkO1-PaEPon40BoymGgbhwKbXeb1f13G3Vg3Fpx4yDitqdDYtZ2ca4I0Yz3Fgcc3Yko2q5M4deUBFB40R6abLIpv9GuPcyjKnxibe7nulTHDwcsWqwiZ2Ggd4cBijY-tWFQidMoK70iIScaUlBHt2wD8Fyn2rMewae0Hw8iVdEOniczIDgaGalC5pjEUjw7DH1j41S1ARJfadTLsSu16BNxcpmllJmuzHlRKYLlFu28yLf65QktYIUxzkh7P3glcW12v-IC9mpkEA3qmMvMSlXqXRS2kUAaN8L4oGqNNBRkDB_-D_F44ii28PJgzOs8bDpPuP-k019ckBPsPM1937Qs3zO5z-3zFwis2aDgyrH9eQKsv14m52_g",
      //           // token: "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
      //         ),
      //       ).then(
      //         (value) {
      //           print("Successs");
      //           print(value.paymentId);
      //           print(value.status);
      //         },
      //       ).catchError((ex) {
      //         print("Error" + ex.toString());
      //       });
      //       print(response?.paymentId.toString());
      //     },
      //   ),
      // ),
    );
  }
}
