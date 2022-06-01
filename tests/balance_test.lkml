test: balance_test {
  explore_source: d_supplier {
    column: S_ACCTBAL {}
    column: account_balance_cohort {}

    filters: [d_supplier.S_ACCTBAL: "123" ]
  }

  assert: is_cohort_right {
    expression: ${d_supplier.account_balance_cohort} = "1 to 3000" ;;
  }

}
