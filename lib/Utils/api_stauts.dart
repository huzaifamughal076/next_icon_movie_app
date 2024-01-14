class Success {
  dynamic code;
  Object? response;
  Success(this.code, this.response);
}

class Failure {
  dynamic code;
  Object errorResponse;
  Failure(this.code, this.errorResponse);
}
