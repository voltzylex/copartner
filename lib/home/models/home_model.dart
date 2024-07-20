// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    bool? isSuccess;
    List<Datum>? data;
    String? displayMessage;
    dynamic errorMessages;
    num? responseStatusCode;

    HomeModel({
        this.isSuccess,
        this.data,
        this.displayMessage,
        this.errorMessages,
        this.responseStatusCode,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        isSuccess: json["isSuccess"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        displayMessage: json["displayMessage"],
        errorMessages: json["errorMessages"],
        responseStatusCode: json["responseStatusCode"],
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "displayMessage": displayMessage,
        "errorMessages": errorMessages,
        "responseStatusCode": responseStatusCode,
    };
}

class Datum {
    String? id;
    Experts? experts;
    String? expertsId;
    String? imagePath;
    String? serviceType;
    String? planType;
    String? chatId;
    num? durationMonth;
    num? amount;
    String? premiumTelegramLink;
    String? description;
    num? discountedAmount;
    dynamic discountPercentage;
    dynamic discountValidFrom;
    dynamic discountValidTo;
    bool? isCustom;
    bool? isActive;
    String? createdBy;
    DateTime? createdOn;
    dynamic updatedBy;
    DateTime? updatedOn;
    bool? isDeleted;
    dynamic deletedBy;
    dynamic deletedOn;

    Datum({
        this.id,
        this.experts,
        this.expertsId,
        this.imagePath,
        this.serviceType,
        this.planType,
        this.chatId,
        this.durationMonth,
        this.amount,
        this.premiumTelegramLink,
        this.description,
        this.discountedAmount,
        this.discountPercentage,
        this.discountValidFrom,
        this.discountValidTo,
        this.isCustom,
        this.isActive,
        this.createdBy,
        this.createdOn,
        this.updatedBy,
        this.updatedOn,
        this.isDeleted,
        this.deletedBy,
        this.deletedOn,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        experts: json["experts"] == null ? null : Experts.fromJson(json["experts"]),
        expertsId: json["expertsId"],
        imagePath: json["imagePath"],
        serviceType: json["serviceType"],
        planType: json["planType"],
        chatId: json["chatId"],
        durationMonth: json["durationMonth"],
        amount: json["amount"],
        premiumTelegramLink: json["premiumTelegramLink"],
        description: json["description"],
        discountedAmount: json["discountedAmount"],
        discountPercentage: json["discountPercentage"],
        discountValidFrom: json["discountValidFrom"],
        discountValidTo: json["discountValidTo"],
        isCustom: json["isCustom"],
        isActive: json["isActive"],
        createdBy: json["createdBy"],
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        updatedBy: json["updatedBy"],
        updatedOn: json["updatedOn"] == null ? null : DateTime.parse(json["updatedOn"]),
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        deletedOn: json["deletedOn"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "experts": experts?.toJson(),
        "expertsId": expertsId,
        "imagePath": imagePath,
        "serviceType": serviceType,
        "planType": planType,
        "chatId": chatId,
        "durationMonth": durationMonth,
        "amount": amount,
        "premiumTelegramLink": premiumTelegramLink,
        "description": description,
        "discountedAmount": discountedAmount,
        "discountPercentage": discountPercentage,
        "discountValidFrom": discountValidFrom,
        "discountValidTo": discountValidTo,
        "isCustom": isCustom,
        "isActive": isActive,
        "createdBy": createdBy,
        "createdOn": createdOn?.toIso8601String(),
        "updatedBy": updatedBy,
        "updatedOn": updatedOn?.toIso8601String(),
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "deletedOn": deletedOn,
    };
}

class Experts {
    String? name;
    String? legalName;
    String? expertImagePath;
    num? expertTypeId;
    String? sebiRegNo;
    String? email;
    num? experience;
    num? rating;
    String? mobileNumber;
    String? channelName;
    String? chatId1;
    String? chatId2;
    String? chatId3;
    String? pan;
    String? address;
    String? state;
    String? signatureImage;
    String? gst;
    String? telegramChannel;
    String? premiumTelegramChannel1;
    String? premiumTelegramChannel2;
    String? premiumTelegramChannel3;
    num? telegramFollower;
    bool? isCoPartner;
    num? fixCommission;
    String? sebiRegCertificatePath;
    dynamic relationshipManagerId;
    bool? isActive;
    String? id;
    String? createdBy;
    DateTime? createdOn;
    dynamic updatedBy;
    DateTime? updatedOn;
    bool? isDeleted;
    dynamic deletedBy;
    dynamic deletedOn;

    Experts({
        this.name,
        this.legalName,
        this.expertImagePath,
        this.expertTypeId,
        this.sebiRegNo,
        this.email,
        this.experience,
        this.rating,
        this.mobileNumber,
        this.channelName,
        this.chatId1,
        this.chatId2,
        this.chatId3,
        this.pan,
        this.address,
        this.state,
        this.signatureImage,
        this.gst,
        this.telegramChannel,
        this.premiumTelegramChannel1,
        this.premiumTelegramChannel2,
        this.premiumTelegramChannel3,
        this.telegramFollower,
        this.isCoPartner,
        this.fixCommission,
        this.sebiRegCertificatePath,
        this.relationshipManagerId,
        this.isActive,
        this.id,
        this.createdBy,
        this.createdOn,
        this.updatedBy,
        this.updatedOn,
        this.isDeleted,
        this.deletedBy,
        this.deletedOn,
    });

    factory Experts.fromJson(Map<String, dynamic> json) => Experts(
        name: json["name"],
        legalName: json["legalName"],
        expertImagePath: json["expertImagePath"],
        expertTypeId: json["expertTypeId"],
        sebiRegNo: json["sebiRegNo"],
        email: json["email"],
        experience: json["experience"],
        rating: json["rating"],
        mobileNumber: json["mobileNumber"],
        channelName: json["channelName"],
        chatId1: json["chatId1"],
        chatId2: json["chatId2"],
        chatId3: json["chatId3"],
        pan: json["pan"],
        address: json["address"],
        state: json["state"],
        signatureImage: json["signatureImage"],
        gst: json["gst"],
        telegramChannel: json["telegramChannel"],
        premiumTelegramChannel1: json["premiumTelegramChannel1"],
        premiumTelegramChannel2: json["premiumTelegramChannel2"],
        premiumTelegramChannel3: json["premiumTelegramChannel3"],
        telegramFollower: json["telegramFollower"],
        isCoPartner: json["isCoPartner"],
        fixCommission: json["fixCommission"],
        sebiRegCertificatePath: json["sebiRegCertificatePath"],
        relationshipManagerId: json["relationshipManagerId"],
        isActive: json["isActive"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        updatedBy: json["updatedBy"],
        updatedOn: json["updatedOn"] == null ? null : DateTime.parse(json["updatedOn"]),
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        deletedOn: json["deletedOn"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "legalName": legalName,
        "expertImagePath": expertImagePath,
        "expertTypeId": expertTypeId,
        "sebiRegNo": sebiRegNo,
        "email": email,
        "experience": experience,
        "rating": rating,
        "mobileNumber": mobileNumber,
        "channelName": channelName,
        "chatId1": chatId1,
        "chatId2": chatId2,
        "chatId3": chatId3,
        "pan": pan,
        "address": address,
        "state": state,
        "signatureImage": signatureImage,
        "gst": gst,
        "telegramChannel": telegramChannel,
        "premiumTelegramChannel1": premiumTelegramChannel1,
        "premiumTelegramChannel2": premiumTelegramChannel2,
        "premiumTelegramChannel3": premiumTelegramChannel3,
        "telegramFollower": telegramFollower,
        "isCoPartner": isCoPartner,
        "fixCommission": fixCommission,
        "sebiRegCertificatePath": sebiRegCertificatePath,
        "relationshipManagerId": relationshipManagerId,
        "isActive": isActive,
        "id": id,
        "createdBy": createdBy,
        "createdOn": createdOn?.toIso8601String(),
        "updatedBy": updatedBy,
        "updatedOn": updatedOn?.toIso8601String(),
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "deletedOn": deletedOn,
    };
}
