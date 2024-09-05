import 'package:apex_app/data/api/api_client.dart';
import 'package:apex_app/models/legend.dart';
import 'package:apex_app/models/profile.dart';

class ApiParser extends ApiClient {
  Profile getProfileApi() {
    final resoult = response?.data as Map<String, dynamic>;
    Profile model = Profile.fromMap(resoult['global']);
    return model;
  }

  Legend getSelectedLegends() {
    final resoult = response?.data;
    final legend = resoult['legends']['selected'] as Map<String, dynamic>;
    Legend model = Legend.fromMap(legend);
    print(model);
    return model;
  }
}
