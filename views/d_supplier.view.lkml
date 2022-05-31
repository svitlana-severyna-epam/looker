view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Account Balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    label: "Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Name"
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }

  dimension: s_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    label: "Phone"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    label: "Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    label: "Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }

  dimension: account_balance_cohort {
    description: "Cohort of suppliers according to Account Balance:
    • <= 0
    • 1—300
    • 3001—5000
    • 5001—7000
    • 7000 <
    "
    label: "Account balance cohort"
    view_label: "Supplier measures"
    sql: ${s_acctbal} ;;
    style: integer
    tiers: [0, 1, 3001, 5001, 7001]
    type: tier
  }

  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
