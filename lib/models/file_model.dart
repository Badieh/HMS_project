import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final String fileName;
  final String fileUrl;

  const FileModel({required this.fileName, required this.fileUrl});

  @override
  List<Object> get props => [fileName, fileUrl];
}
