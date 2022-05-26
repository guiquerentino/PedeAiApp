import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class TokenAPICall {
  static Future<ApiCallResponse> call({
    String email = '',
  }) {
    final body = '''
{
  "destinatario": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TokenAPI',
      apiUrl: 'https://autenticacao-ms-api.herokuapp.com/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
