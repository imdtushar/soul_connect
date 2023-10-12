import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:soul_connect/app/data/model/signup_model.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';
import 'package:path/path.dart' as path;

class Repository extends BaseRemoteSource {


  // NEW Api


  Future<SignupModel> signup(Map data) {
    var endpoint = "${DioProvider.baseUrl}api/auth/signup";
    var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        return SignupModel.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }










  // Old
  // @override
  // Future<GithubProjectSearchResponse> searchGithubProject(
  //     GithubSearchQueryParam queryParam) {
  //   var endpoint = "${DioProvider.baseUrl}/search/repositories";
  //   var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return GithubProjectSearchResponse.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<GithubProjectSearchResponse> forgotpassword(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/search/repositories";
  //   var dioCall = dioClient.post(endpoint,
  //       queryParameters: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return GithubProjectSearchResponse.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<CountryModel> getCountry() {
  //   var endpoint = "${DioProvider.baseUrl}/api/settings/countries";
  //   var dioCall = dioClient.get(endpoint);
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CountryModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<SettingModel> getSetting() {
  //   var endpoint = "${DioProvider.baseUrl}/api/settings";
  //   var dioCall = dioClient.get(endpoint);
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return SettingModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CategoriesModel> getCategories() {
  //   var endpoint = "${DioProvider.baseUrl}/api/settings/categories";
  //   var dioCall = dioClient.get(endpoint);
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CategoriesModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<LoginModel> login(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/login";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return LoginModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<RegisterModel> register(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/register";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return RegisterModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<VerifyUserModel> verifyUser(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/verify-user";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return VerifyUserModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> resendOtp(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/resend-otp";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<ForgotPasswordModel> forgotPassword(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/forgot-password";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return ForgotPasswordModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<VerifyOtpModel> verifyOtp(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/verify-otp";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return VerifyOtpModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> resetPassword(Map data, int uid) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/reset-password/$uid";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> logOut(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/auth/logout";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CreatePostModel> createPost(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/create";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CreatePostModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<LikeModel> likePost(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/like";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return LikeModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> homeFeed(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/feeds";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<PostDetailsModels> postDetail(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/comments";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return PostDetailsModels.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<GtpResponseModel> chatGpt(Map data, String accessToken) async {
  //   var endpoint = "https://api.openai.com/v1/completions";
  //   var customHeaders = {'content-type': 'application/json'};
  //
  //   Dio dioClient = Dio();
  //   dioClient.interceptors.add(DioProvider.prettyDioLogger);
  //   if (accessToken.trim().isNotEmpty) {
  //     customHeaders.addAll({
  //       'Authorization': "Bearer $accessToken",
  //     });
  //   }
  //   dioClient.options.headers = customHeaders;
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return GtpResponseModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<PostCommentModel> postComment(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/comment";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return PostCommentModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> deleteAccount(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/delete-account";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> changePassword(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/change-password";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> feedBack(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/app-feedback";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<WalletUserModel> walletUser(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/wallet-transactions";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return WalletUserModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<ExpertListModel> expertList(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/experts-list";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return ExpertListModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<NotificationModel> notification(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/notifications";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return NotificationModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<UserDetailModel> getUserData(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/by-id";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return UserDetailModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<UserEditProfileModel> editProfile(
  //   String first,
  //   String last,
  //   String user,
  //   String gender,
  //   String email,
  //   int? country,
  //   File? profileImageFile,
  // ) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/edit-profile";
  //   var data = {
  //     "first_name": first,
  //     "last_name": last,
  //     "username": user,
  //     "gender": gender,
  //     "email": email,
  //     "country": country,
  //   };
  //   if (profileImageFile != null) {
  //     var timestamp = DateTime.now().millisecondsSinceEpoch;
  //     var profilePic = await MultipartFile.fromFile(profileImageFile.path, filename: "$timestamp${path.extension(profileImageFile.path)}");
  //     data.addAll({
  //       'profile_photo': profilePic,
  //     });
  //   }
  //   var formData = FormData.fromMap(data);
  //   var dioCall = dioClient.post(
  //     endpoint,
  //     data: formData,
  //     onReceiveProgress: (count, total) {
  //       print(" ++++++ Upload +++++++ $count ------ Data ------- $total");
  //     },
  //   );
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return UserEditProfileModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> postReport(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/report";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<SearchModel> searchPost(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/feeds/search";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return SearchModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<dynamic> stripeToken(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/payment/stripe-token";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return response.data;
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<UserEditProfileModel> editProfileExpert(List<File> certificates, String firstname, String lastname, String userName, String gender,
  //     String email, int country, String bio, File? profilePhoto, File? coverPhoto) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/edit-profile";
  //
  //   var data = {
  //     "first_name": firstname,
  //     "last_name": lastname,
  //     "username": userName,
  //     "gender": gender,
  //     "email": email,
  //     "country": country,
  //     "bio": bio,
  //   };
  //
  //   if (profilePhoto != null) {
  //     var timestamp = DateTime.now().millisecondsSinceEpoch;
  //     var profilePic = await MultipartFile.fromFile(profilePhoto.path, filename: "$timestamp${path.extension(profilePhoto.path)}");
  //     data.addAll({
  //       'profile_photo': profilePic,
  //     });
  //   }
  //
  //   if (coverPhoto != null) {
  //     var timestamp = DateTime.now().millisecondsSinceEpoch;
  //     var coverPic = await MultipartFile.fromFile(coverPhoto.path, filename: "$timestamp${path.extension(coverPhoto.path)}");
  //     data.addAll({
  //       'cover_photo': coverPic,
  //     });
  //   }
  //   var fileList = [];
  //
  //   for (var element in certificates) {
  //     var timestamp = DateTime.now().millisecondsSinceEpoch;
  //     fileList.add(await MultipartFile.fromFile(element.path, filename: "$timestamp${path.extension(element.path)}"));
  //   }
  //
  //   data.addAll({
  //     'certificates[]': fileList,
  //   });
  //   var formData = FormData.fromMap(data);
  //
  //   try {
  //     var dioCall = dioClient.post(
  //       endpoint,
  //       data: formData,
  //       onReceiveProgress: (count, total) {
  //         // if (onUploadProgress != null) {
  //         //   var percent = (count / total * 100).round();
  //         //
  //         //   onUploadProgress(count, total, percent);
  //         // }
  //       },
  //     );
  //
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       // return response.data;
  //       return UserEditProfileModel.fromJson(response.data);
  //     });
  //   } catch (e, s) {
  //     if (kDebugMode) {
  //       print(e);
  //       print(s);
  //     }
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> uploadCertificates(List<File> certificates, int category, int chargePerHalfHour, String description, String language) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/request-verification";
  //
  //   var data = {
  //     "category": category,
  //     "expert_charge": chargePerHalfHour,
  //     "description": description,
  //     "languages": language,
  //   };
  //
  //   var fileList = [];
  //
  //   for (var element in certificates) {
  //     var timestamp = DateTime.now().millisecondsSinceEpoch;
  //     fileList.add(await MultipartFile.fromFile(element.path, filename: "$timestamp${path.extension(element.path)}"));
  //   }
  //
  //   data.addAll({
  //     'certificates[]': fileList,
  //   });
  //   var formData = FormData.fromMap(data);
  //
  //   try {
  //     var dioCall = dioClient.post(
  //       endpoint,
  //       data: formData,
  //       onReceiveProgress: (count, total) {
  //         // if (onUploadProgress != null) {
  //         //   var percent = (count / total * 100).round();
  //         //
  //         //   onUploadProgress(count, total, percent);
  //         // }
  //       },
  //     );
  //
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       // return response.data;
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e, s) {
  //     if (kDebugMode) {
  //       print(e);
  //       print(s);
  //     }
  //     rethrow;
  //   }
  // }
  //
  // Future<PayoutModel> payoutExpert(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/withdraw-request";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return PayoutModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<WalletListModel> walletList(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/get-withdraw-request";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return WalletListModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> userRating(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/expert-feedback";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> updateExpertRate(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/update-charge";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> bankDetail(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/bank-details";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> premiumDetail(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/premium-details";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> getAgoraToken(Map data) {
  //   var endpoint = "${DioProvider.baseUrl}/api/agora/tokens";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> getAgoraToken1(Map data) async {
  //   var endpoint = "https://app-admin.songzter.com/api/agora/tokens";
  //   var customHeaders = {'content-type': 'application/json'};
  //
  //   Dio dioClient = Dio();
  //   dioClient.interceptors.add(DioProvider.prettyDioLogger);
  //   customHeaders.addAll({
  //     'Authorization':
  //         "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwcC1hZG1pbi5zb25nenRlci5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNjg4MTE3OTAwLCJleHAiOjM1ODAyNzc5MDAsIm5iZiI6MTY4ODExNzkwMCwianRpIjoiSFQxc2JKU3F2aXR4N0MxTyIsInN1YiI6IjI5NSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.2gqBI2tPmGEwgqq7qjYLPP5SmOfoh5f9PNhR0_IiUP8",
  //   });
  //   dioClient.options.headers = customHeaders;
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> deletePost(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/post/delete";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<TimeSlotsWrapper> getAllTimeSlots(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/get-time-slots";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return TimeSlotsWrapper.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> manageAvailability(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/manage-availablity";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<AvailableTimeslotsModel> getAvailableTimeSlots(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/available-timeslots";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return AvailableTimeslotsModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<BookAppointmentModel> bookAppointment(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/book-an-appointment";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return BookAppointmentModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> getUserAllAppointments(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/my-appointments";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> getExpertAllAppointments(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/my-appointments";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> payForAppointment(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/pay-for-appointment";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> updateAppointmentStatusAPI(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/appointment-status";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  //
  // Future<CommanModel> updateFCMTokenAPI(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/update-fcmtoken";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> meetingComplete(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/expert/meeting-complete";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<CommanModel> reportMeeting(Map data) async {
  //   var endpoint = "${DioProvider.baseUrl}/api/user/report-meeting";
  //   var dioCall = dioClient.post(endpoint, data: Map<String, dynamic>.from(data));
  //
  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) {
  //       return CommanModel.fromJson(response.data);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}