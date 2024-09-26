

class DrugInfoModel {
  final String? otherNames;

  final String? name;

  final String? toxicity;

  final String? indication;

  final String? description;

  final String? foodInteractions;

  final String? drugBankId;

  DrugInfoModel({
    this.otherNames,
    this.name,
    this.toxicity,
    this.indication,
    this.description,
    this.foodInteractions,
    this.drugBankId,
  });

  factory DrugInfoModel.fromJson(Map<String, dynamic> json) {
    return DrugInfoModel(
      otherNames: json['أسماء أخرى'] as String?,
      name: json['الاسم'] as String?,
      toxicity: json['السُمية'] as String?,
      indication: json[" دوافع الاستخدام"] as String?,
      description: json['الوصف'] as String?,
      foodInteractions: json['تفاعلات الطعام'] as String?,
      drugBankId: json['معرف بنك الأدوية'] as String?,
    );
  }
//
}
