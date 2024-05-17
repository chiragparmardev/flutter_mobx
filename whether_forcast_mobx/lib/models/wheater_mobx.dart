// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:mobx/mobx.dart';
part 'wheater_mobx.g.dart';

class Wheater = _WheaterBase with _$Wheater;

enum WheaterEnum { isLoading, isLoaded }

abstract class _WheaterBase with Store {
  var random = Random();
  @observable
  WheaterEnum wheaterEnum = WheaterEnum.isLoaded;

  @observable
  String wheater = "";

  @observable
  double degree = 0.00;

  @action
  void getWheater(String value) {
    wheater = value;
    degree = random.nextInt(40) + 5.toDouble();
  }

  @observable
  String url =
      'https://transcode-v2.app.engoo.com/image/fetch/f_auto,c_lfill,h_128,dpr_3/https://assets.app.engoo.com/images/WkXLsRHObkU4xGPorzplrYOtIglvIQxuHIQG1YoNOyM.jpeg';

  @action
  void changeWhaterImage() {
    if (degree < 15) {
      url =
          'https://images.unsplash.com/photo-1612208695882-02f2322b7fee?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29sZCUyMHdlYXRoZXJ8ZW58MHx8MHx8fDA%3D';
    } else if (degree >= 15 && degree < 30) {
      url =
          'https://t3.ftcdn.net/jpg/04/99/96/18/360_F_499961849_RTPjXHECUHBi4X9ZrpVTxb30Esx0bvIq.jpg';
    } else if (degree >= 30 && degree <= 45) {
      url =
          'https://www.howitworksdaily.com/wp-content/uploads/2015/07/heatwave-scaled.jpg';
    }
  }

  @action
  Future setWheaterEnumdelay() async {
    wheaterEnum = WheaterEnum.isLoading;
    await Future.delayed(const Duration(seconds: 1), () {
      return wheaterEnum = WheaterEnum.isLoaded;
    });
  }
}

final wheater = Wheater();
