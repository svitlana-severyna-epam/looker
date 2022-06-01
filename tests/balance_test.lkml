test: balance_test {
  explore_source: d_supplier {
    column: s_acctbal {}
    column: account_balance_cohort {}

    filters: [d_supplier.s_acctbal: ">=50 AND <=100" ]
  }

  assert: is_cohort_right {
    expression: ${d_supplier.account_balance_cohort} = "1 to 3000" ;;
  }

}
