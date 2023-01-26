import 'package:flutter/material.dart';

class AddAddressProvider with ChangeNotifier {
  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  // Future deleteAddressNotifier(context, addressId) async {
  //   Future response = deleteAddress(addressId);
  //   notifyListeners();
  // }
  // addAddressNotifier(context) async {
  //   postAddress(context);
  //   notifyListeners();
  // }

  // Future<void> addressPoster(context)async{

  // }

  // final dio = Dio();
  // Future<void> postAddress(context) async {
  //   try {
  //     Response response = await dio.post(
  //       '$baseUrl/saveAddress/${emailIds['user']['_id'].toString()}',
  //       data: {
  //         "houseNo": houseNoController.text,
  //         "street": streetController.text,
  //         "district": districtController.text,
  //         "state": stateController.text,
  //         "pincode": pincodeController.text,
  //       },
  //     );

  //     log(response.data.toString());
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.green.shade800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: const EdgeInsets.all(15.0),
  //           elevation: 6.0,
  //           margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //           content: const Text(
  //             'Address added Successfully',
  //           ),
  //         ),
  //       );
  //     }
  //   } on SocketException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text(
  //           'Check your Internet connection',
  //         ),
  //       ),
  //     );
  //   } on TimeoutException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('Something went wrong'),
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     if (e.response == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.red.shade800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: const EdgeInsets.all(15.0),
  //           elevation: 6.0,
  //           margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //           content: const Text(
  //             'Check your Internet connection',
  //           ),
  //         ),
  //       );
  //     }

  //     if (e.response!.statusCode == 404) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.red.shade800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: const EdgeInsets.all(15.0),
  //           elevation: 6.0,
  //           margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //           content: const Text('Something went wrong'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
