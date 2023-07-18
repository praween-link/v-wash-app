import 'package:appwash/utils/images/icons_path.dart';
import 'package:get/get.dart';

class DashboardViewmodel extends GetxController {
  /// Slider
  var currentSliderIndex = 0.obs;
  var sliderImages = [
    "https://img.freepik.com/premium-photo/worker-washing-red-car-with-sponge-car-wash_179755-10792.jpg",
    "https://img.freepik.com/free-photo/beautiful-car-washing-service_23-2149212209.jpg",
    "https://img.freepik.com/free-photo/beautiful-car-washing-service_23-2149212209.jpg",
  ];
  //
  //Categories
  var dashCatForUser = <DashCat>[
    DashCat(title: "appwash Wallet", assetIcon: AppIcons.wallet),
    DashCat(title: "Rewards", assetIcon: AppIcons.rewards),
    DashCat(title: "Refer & Get ₹100", assetIcon: AppIcons.referGet),
  ].obs;
}

class DashCat {
  final String title;
  final String assetIcon;
  DashCat({required this.title, required this.assetIcon});
}

class MyBooking {
  String? id;
  String? bookedDuration;
  String? title;
  double? price;
  String? vehicleId;
  bool singleBooking;
  MyBooking(
      {this.id,
      this.title,
      this.price,
      this.bookedDuration,
      this.vehicleId,
      this.singleBooking = true});
}

class HomeDummyData {
  static List<MyBooking> myBookings = [
    MyBooking(
      id: '1',
      title: "Bajaj Pulser 220",
      bookedDuration: "22 Sep 2022",
      vehicleId: "HP36D5203",
      price: 56,
      singleBooking: false,
    ),
    MyBooking(
      id: '1',
      title: "Bajaj Pulser 220",
      bookedDuration: "22 Sep 2022",
      vehicleId: "HP36D5203",
      price: 56,
      singleBooking: true,
    ),
    MyBooking(
      id: '1',
      title: "Bajaj Pulser 220",
      bookedDuration: "22 Sep 2022",
      vehicleId: "HP36D5203",
      price: 56,
      singleBooking: false,
    ),
    MyBooking(
      id: '1',
      title: "Bajaj Pulser 220",
      bookedDuration: "22 Sep 2022",
      vehicleId: "HP36D5203",
      price: 56,
      singleBooking: false,
    ),
    MyBooking(
      id: '1',
      title: "Bajaj Pulser 220",
      bookedDuration: "22 Sep 2022",
      vehicleId: "HP36D5203",
      price: 56,
      singleBooking: false,
    ),
  ];
}
