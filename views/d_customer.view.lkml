view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    label: "Address"
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    label: "Customer key"
    primary_key: yes
    type: number
    sql: ${TABLE}."C_CUSTKEY" ;;
  }

  dimension: c_mktsegment {
    label: "Market segment"
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    label: "Name"
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    label: "Phone"
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    label: "Region"
    type: string
    sql: ${TABLE}."C_REGION" ;;
  }

  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
