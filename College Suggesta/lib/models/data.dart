// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.code,
    this.name,
    this.region,
    this.district,
    this.place,
    this.afflUniversity,
    this.establishedYear,
    this.branchCode,
    this.placements,
    this.placementRatio,
    this.collegeFee,
    this.infra,
    this.nirfRanking,
    this.nbaAccredit,
    this.hostel,
    this.avgSal,
    this.highSal,
    this.topComanies,
    this.collegeWebsite,
    this.ocBoysRank,
    this.ocGirlsRank,
    this.scBoysRank,
    this.scGirlsRank,
    this.stBoysRank,
    this.stGirlsRank,
    this.bcABoysRank,
    this.bcBBoysRank,
    this.bcCBoysRank,
    this.bcDBoysRank,
    this.bcEBoysRank,
    this.bcAGirlsRank,
    this.bcBGirlsRank,
    this.bcCGirlsRank,
    this.bcDGirlsRank,
    this.bcEGirlsRank,
  });

  int ?id;
  String ? code;
  String ? name;
  String ? region;
  String ? district;
  String ? place;
  String ? afflUniversity;
  int ? establishedYear;
  String ? branchCode;
  int ? placements;
  int ? placementRatio;
  int ? collegeFee;
  int ? infra;
  int ? nirfRanking;
  bool ? nbaAccredit;
  String ? hostel;
  double ? avgSal;
  int ? highSal;
  String ? topComanies;
  String ? collegeWebsite;
  int ? ocBoysRank;
  int ? ocGirlsRank;
  int ? scBoysRank;
  int ? scGirlsRank;
  int ? stBoysRank;
  int ? stGirlsRank;
  int ? bcABoysRank;
  int ? bcBBoysRank;
  int ? bcCBoysRank;
  int ? bcDBoysRank;
  int ? bcEBoysRank;
  int ? bcAGirlsRank;
  int ? bcBGirlsRank;
  int ? bcCGirlsRank;
  int ? bcDGirlsRank;
  int ? bcEGirlsRank;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    region: json["region"],
    district: json["district"],
    place: json["Place"],
    afflUniversity: json["affl_university"],
    establishedYear: json["established_year"],
    branchCode: json["branch_code"],
    placements: json["placements"],
    placementRatio: json["placement_ratio"],
    collegeFee: json["college_fee"],
    infra: json["infra"],
    nirfRanking: json["nirf_ranking"],
    nbaAccredit: json["nba_accredit"],
    hostel: json["hostel"],
    avgSal: json["avg_sal"].toDouble(),
    highSal: json["high_sal"],
    topComanies: json["top_comanies"],
    collegeWebsite: json["college_website"],
    ocBoysRank: json["oc_boys_rank"],
    ocGirlsRank: json["oc_girls_rank"],
    scBoysRank: json["sc_boys_rank"],
    scGirlsRank: json["sc_girls_rank"],
    stBoysRank: json["st_boys_rank"],
    stGirlsRank: json["st_girls_rank"],
    bcABoysRank: json["bc_a_boys_rank"],
    bcBBoysRank: json["bc_b_boys_rank"],
    bcCBoysRank: json["bc_c_boys_rank"],
    bcDBoysRank: json["bc_d_boys_rank"],
    bcEBoysRank: json["bc_e_boys_rank"],
    bcAGirlsRank: json["bc_a_girls_rank"],
    bcBGirlsRank: json["bc_b_girls_rank"],
    bcCGirlsRank: json["bc_c_girls_rank"],
    bcDGirlsRank: json["bc_d_girls_rank"],
    bcEGirlsRank: json["bc_e_girls_rank"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "region": region,
    "district": district,
    "Place": place,
    "affl_university": afflUniversity,
    "established_year": establishedYear,
    "branch_code": branchCode,
    "placements": placements,
    "placement_ratio": placementRatio,
    "college_fee": collegeFee,
    "infra": infra,
    "nirf_ranking": nirfRanking,
    "nba_accredit": nbaAccredit,
    "hostel": hostel,
    "avg_sal": avgSal,
    "high_sal": highSal,
    "top_comanies": topComanies,
    "college_website": collegeWebsite,
    "oc_boys_rank": ocBoysRank,
    "oc_girls_rank": ocGirlsRank,
    "sc_boys_rank": scBoysRank,
    "sc_girls_rank": scGirlsRank,
    "st_boys_rank": stBoysRank,
    "st_girls_rank": stGirlsRank,
    "bc_a_boys_rank": bcABoysRank,
    "bc_b_boys_rank": bcBBoysRank,
    "bc_c_boys_rank": bcCBoysRank,
    "bc_d_boys_rank": bcDBoysRank,
    "bc_e_boys_rank": bcEBoysRank,
    "bc_a_girls_rank": bcAGirlsRank,
    "bc_b_girls_rank": bcBGirlsRank,
    "bc_c_girls_rank": bcCGirlsRank,
    "bc_d_girls_rank": bcDGirlsRank,
    "bc_e_girls_rank": bcEGirlsRank,
  };
}
