import 'package:hasura_connect/hasura_connect.dart';
import 'package:xizmat_uz/network/local_service.dart';

class HasuraClient {
  LocaleService service = LocaleService();

  HasuraConnect _client() {
    var token = service.getToken();
    HasuraConnect connect =
        HasuraConnect('https://hasura-8c530141.nhost.app/v1/graphql', headers: {
      'Authorization': token,
    });

    return connect;
  }

  Future duery(String document) {
    return _client().query(document);
  }

  Future mutation({String document = "", dynamic variables}) {
    return _client().mutation(document, variables: variables);
  }

  Future<Snapshot<dynamic>> subscription(String document) {
    return _client().subscription(document);
  }
}

