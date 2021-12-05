  const String ACCOUNT = """query account {
  accounts {
    id
    user {
      display_name
      account {
        email
      }
    }
  }
}""";
