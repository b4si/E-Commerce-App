class EmailId {
  String email;
  String id;
  String name;

  EmailId({
    required this.email,
    required this.id,
    required this.name,
  });
}

List<EmailId> emailIds = [];

void addPreferredShare(String email, String id, String name) {
  emailIds.add(EmailId(
    email: email,
    id: id,
    name: name,
  ));
}
