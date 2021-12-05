const String ACCOUNT = """query account {
  accounts {
    id
    balance{
      amount
    }
    user {
      display_name
      account {
        email
        
      }
    }
  }
}""";

const String SERVICE = """query{
  services{
  id
  }
  }
  """;

const String CREATE_SERVICE =
    r"""mutation service($accountId:bigint,$formData:jsonb,$service_id:bigint){
  insert_service_accounts(objects: {account_id: $accountId, form_data: $formData, service_id: $service_id}) {
  affected_rows
  }
  }
  """;

const String SERVICE_ACCOUNTS = """query {
  service_accounts{
  payment_status
  status
  account{
  balance{
  amount
  }
  }
  }
  }""";
