import 'package:darzi_nearby/darzi_nearby.dart';

class DarziFormSingleServiceData {
  final DarziFormEnityPic nameAndPic;
  final DarziFormEnity description;

  DarziFormSingleServiceData({
    required this.nameAndPic,
    required this.description,
  });

  String? isValid(int pos) => nameAndPic.isValid(pos);
}

class DarziFormServiceEnity {
  final _basic = DarziFormEnity(
    "Service Name",
    "Enter name",
    keyboardType: TextInputType.name,
    validator: (val) => Fullname(val).isValid,
  );
  final _basicDescription = DarziFormEnity(
    "Service Desription",
    "Enter Description",
    validator: (val) => Description(val).isValid,
    minLines: 3,
  );
  final RxList<DarziFormSingleServiceData> data =
      <DarziFormSingleServiceData>[].obs;
  add({ServiceInfo? info}) {
    data.add(_create(info: info));
  }

  _create({ServiceInfo? info}) {
    return DarziFormSingleServiceData(
      nameAndPic: DarziFormEnityPic(_basic)
        ..url.value = info != null ? FileOrImgUrl(info.serviceImgUrl) : null
        ..controller.text = info?.serviceName.value ?? '',
      description: DarziFormEnity.copy(_basicDescription)
        ..controller.text = info?.description.value ?? '',
    );
  }

  String? get isValid {
    String err = '';
    if (data.isEmpty) return 'Please add atleast one service';
    for (var i = 0; i < data.length; i++) {
      err += data[i].isValid(i) ?? '';
    }
    if (err.isEmpty) return null;
    return err;
  }

  remove(DarziFormSingleServiceData enity) {
    data.remove(enity);
  }

  DarziFormServiceEnity({List<ServiceInfo>? info}) {
    if (info != null) updateInfo(info);
  }
  void updateInfo(List<ServiceInfo> info) {
    final d = info.toList();
    data.clear();
    data.assignAll(d.map((e) => _create(info: e)));
  }
}
