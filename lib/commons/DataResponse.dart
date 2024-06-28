abstract class DataResponse<T> {
  final T ? data;
  final String ? error;

  const DataResponse({this.data, this.error});
}

class DataSuccess<T> extends DataResponse<T> {
    const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataResponse<T> {
  const DataError(String error) : super(error: error);
}