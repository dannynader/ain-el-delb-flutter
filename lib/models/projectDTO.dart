class ProjectDTO {
  final String id;
  final String title;
  final String image;
  final String body;
  // ignore: non_constant_identifier_names
  final String created_at;
  // ignore: non_constant_identifier_names
  final String  updated_at;

  ProjectDTO(this.id, this.title,this.image,this.body,this.created_at,this.updated_at);
}