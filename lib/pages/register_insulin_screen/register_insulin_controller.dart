import 'package:diapets_mobile/models/insulin_application.dart';
import 'package:diapets_mobile/models/user.dart';
import 'package:diapets_mobile/services/api.dart';
import 'package:diapets_mobile/services/insulin_service.dart';
import 'package:diapets_mobile/services/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterInsulinController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var loading = false.obs;
  var initialLoading = false.obs;
  var deleteLoading = false.obs;

  Rxn<InsulinApplication> insulinApplication = Rxn<InsulinApplication>();
  var isEditing = false.obs;

  int? glucose;
  int? insulinUnits;
  DateTime? date;
  TimeOfDay? time;
  String? observation;
  User? responsible;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments?['id'] != null) {
      findInsulinApplication(Get.arguments['id']);
      isEditing.value = true;
    }
  }

  findInsulinApplication(int id) async {
    initialLoading.value = true;

    Api api = Get.find();
    try {
      var response = await api.dio.get('/api/v1/insulin_applications/$id');
      insulinApplication.value = InsulinApplication.fromJson(response.data);
    } on DioException {
      Get.snackbar(
        "Erro",
        "Ocorreu um erro inesperado. Tente novamente mais tarde.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      initialLoading.value = false;
    }
  }

  Future<void> submit(int petId) async {
    loading.value = true;

    try {
      DateTime dateTime = DateTime(
        date!.year,
        date!.month,
        date!.day,
        time!.hour,
        time!.minute,
      );
      if (isEditing.value) {
        await InsulinService.updateInsulin(
          petId,
          insulinApplication.value!.id!,
          glucose,
          insulinUnits!,
          responsible!.id!,
          dateTime.toUtc(),
          observations: observation,
        );
      } else {
        await InsulinService.registerInsulin(
          petId,
          glucose,
          insulinUnits!,
          responsible!.id!,
          dateTime.toUtc(),
          observations: observation,
        );
      }

      Get.back();
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        "Erro",
        "Ocorreu um erro inesperado. Tente novamente mais tarde.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      loading.value = false;
    }
  }

  deleteInsulin() async {
    deleteLoading.value = true;
    int id = insulinApplication.value!.id!;

    try {
      await InsulinService.deleteInsulin(id);
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        "Erro",
        "Ocorreu um erro inesperado. Tente novamente mais tarde.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      deleteLoading.value = false;
    }
  }
}
