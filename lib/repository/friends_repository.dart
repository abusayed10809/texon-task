import 'package:dartz/dartz.dart';
import 'package:friends_app/api_services/api_service.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:friends_app/utils/api_constants.dart';

class FriendsRepository {
  final ApiService apiService = ApiService();

  Future<Either<String, List<FriendModel>>> fetchFriendsList({required int page}) async {
    try {
      dynamic response = await apiService.getResponse(url: '${ApiConstants.baseUrl}/?results=10&page=$page');
      FriendsListModel friendsListModel = FriendsListModel.fromJson(response);
      return Right(friendsListModel.results ?? []);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
