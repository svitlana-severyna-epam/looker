view: d_part {
  sql_table_name: "DATA_MART"."D_PART"
    ;;

  dimension: p_brand {
    label: "Brand"
    type: string
    sql: ${TABLE}."P_BRAND" ;;
  }

  dimension: p_mfgr {
    label: "Manufacturer"
    type: string
    sql: ${TABLE}."P_MFGR" ;;
  }

  dimension: p_name {
    label: "Name"
    type: string
    sql: ${TABLE}."P_NAME" ;;
  }

  dimension: p_partkey {
    label: "Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
  }

  dimension: p_size {
    label: "Size"
    type: number
    sql: ${TABLE}."P_SIZE" ;;
  }

  dimension: p_type {
    label: "Type"
    type: string
    sql: ${TABLE}."P_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [p_name]
  }
}
