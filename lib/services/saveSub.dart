import 'package:cenem/model/paymentModel.dart';
import 'package:get_storage/get_storage.dart';

class SubscriptionService {
  final GetStorage _storage = GetStorage();
  final String _key = 'subscription';

  // Save the Subscription object to storage
  Future<void> saveSubscription(Subscription subscription) async {
    String subscriptionJson = subscriptionToJson(subscription);
    await _storage.write(_key, subscriptionJson);
  }

  // Load the Subscription object from storage
  Subscription? loadSubscription() {
    String? subscriptionJson = _storage.read<String>(_key);
    if (subscriptionJson != null) {
      return subscriptionFromJson(subscriptionJson);
    }
    return null;
  }

  // Clear the Subscription object from storage
  Future<void> clearSubscription() async {
    await _storage.remove(_key);
  }
}
