class Member {
  int? Id;
  String memberName;
  String? idNumber;
  int? gender;
  DateTime? birthday;
  String? parentsToken;
  String? nationality;
  String? memberNameEnglish;
  bool? companyPolicyApproval;
  String? userId;
  String? DiscordNameMember;
  bool? status;
  String? memberToken;
  int? totalAmount;
  int? encode;
  int? encodeMonthly;
  bool? isFreeAccount;

  Member(
      {this.Id,
      required this.memberName,
      this.idNumber,
      this.gender,
      this.totalAmount,
      this.birthday,
      this.status,
      this.parentsToken,
      this.nationality,
      this.userId,
      this.companyPolicyApproval,
      this.memberNameEnglish,
      this.memberToken,
      this.encode,
      this.encodeMonthly,
      this.isFreeAccount,
      this.DiscordNameMember});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      Id: json['id'],
      memberName: json['memberName'],
      idNumber: json['idNumber'],
      gender: json['gender'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      parentsToken: json['parentsToken'],
      nationality: json['nationality'],
      totalAmount: json['totalAmount'],
      userId: json['userId'],
      encode: json['encodeClassification'],
      encodeMonthly: json['encodeClassificationCurrentMonth'],
      memberToken: json['memberToken'],
      isFreeAccount: json['isFreeAccount'],
      status: json['status'],
      companyPolicyApproval: json['companyPolicyApproval'],
      memberNameEnglish: json['memberNameEnglish'],
      DiscordNameMember: json["DiscordNameMember"],
    );
  }

  @override
  String toString() {
    return 'Member {id:$Id, memberName: $memberName, idNumber: $idNumber, gender: $gender, '
        'birthday: $birthday, parentsToken: $parentsToken, nationality: $nationality, '
        'userId: $userId, memberToken: $memberToken, memberNameEnglish:$memberNameEnglish, companyPolicyApproval:$companyPolicyApproval  ,  DiscordNameMember:$DiscordNameMember}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'memberName': memberName,
      'idNumber': idNumber,
      'gender': gender,
      'birthday': birthday?.toIso8601String(),
      'parentsToken': parentsToken ?? "00000",
      'nationality': nationality,
      'userId': userId,
      'memberToken': memberToken,
      'companyPolicyApproval': companyPolicyApproval ?? true,
      'memberNameEnglish': memberNameEnglish,
      'DiscordNameMember': DiscordNameMember
    };
  }

  Map<String, dynamic> Json() {
    return {
      'id': Id,
      'memberName': memberName,
      'birthday': birthday?.toIso8601String(),
      'memberNameEnglish': memberNameEnglish,
    };
  }

  void clear() {
    Id = null;
    memberName = '';
    idNumber = '';
    gender = 0;
    birthday = null;
    parentsToken = null;
    nationality = '';
    memberNameEnglish = null;
    companyPolicyApproval = null;
    userId = '';
    memberToken = null;
  }

  String clasificationcationencode(int code) {
    String statusText = '';
    if (code == 101) {
      statusText = 'منتسب';
    } else if (code == 100)
      statusText = " ملتزم";
    else if (code == 103)
      statusText = " موقوف";
    else if (code == 102)
      statusText = "عضو مفصول";
    else if (code == 104) statusText = "عضو مجمد";
    return statusText;
  }
}
