abstract class DataResponse<T> {
  final T? data;
  final String? error;

  const DataResponse({this.data, this.error});

  bool isSuccess();
}

class DataSuccess<T> extends DataResponse<T> {
    const DataSuccess(T data) : super(data: data);

    @override
  bool isSuccess() {
    return true;
  }
}

class DataError<T> extends DataResponse<T> {
  const DataError(String error) : super(error: error);

  @override
  bool isSuccess() {
    return false;
  }
}