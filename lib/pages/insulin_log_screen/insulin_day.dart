import 'package:diapets_mobile/models/insulin_application.dart';
import 'package:diapets_mobile/pages/insulin_log_screen/insulin_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class InsulinDay extends StatelessWidget {
  final List<InsulinApplication> insulinApplications;

  const InsulinDay({
    super.key,
    required this.insulinApplications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...insulinApplications.map(
          (insulinApplication) => InsulinCard(
            insulinApplication: insulinApplication,
          ),
        ),
      ],
    );
  }
}

class InsulinCard extends StatelessWidget {
  final InsulinApplication insulinApplication;

  const InsulinCard({
    super.key,
    required this.insulinApplication,
  });

  openRegisterInsulin() {
    InsulinLogController insulinLogController = Get.find();
    Get.toNamed(
      '/register_insulin',
      arguments: {'id': insulinApplication.id},
    )?.then((_) async {
      await insulinLogController.getInsulinFilters();
      await insulinLogController.getInsulinLog();
    });
  }

  String buildRowText(int units, int? glucoseLevel) {
    List<String> texts = [];
    texts.add("$units unidades");
    if (glucoseLevel != null) {
      texts.add("$glucoseLevel glicose");
    }
    return texts.join(" | ");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: openRegisterInsulin,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3641),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    insulinApplication.user!.firstName!,
                    style: const TextStyle(
                      color: Color(0xFF9B6BF3),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    Jiffy.parseFromDateTime(insulinApplication.applicationTime!)
                        .Hm,
                    style: const TextStyle(
                      color: Color(0xFF888D92),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                buildRowText(insulinApplication.insulinUnits!,
                    insulinApplication.glucoseLevel),
                style: const TextStyle(
                  color: Color(0xFF888D92),
                  fontSize: 14,
                ),
              ),
              if (insulinApplication.observations != null &&
                  insulinApplication.observations!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  "Obs: ${insulinApplication.observations}",
                  style: const TextStyle(
                    color: Color(0xFF888D92),
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
