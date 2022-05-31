connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: looker_intensive_8_svitlana_severyna_module_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive_8_svitlana_severyna_module_2_default_datagroup

explore: d_customer {}

explore: commit_date {
  group_label: "Dates"
}

explore: order_date {
  group_label: "Dates"
}

explore: receipt_date {
  group_label: "Dates"
}

explore: ship_date {
  group_label: "Dates"
}
explore: d_part {}

explore: d_supplier {}

explore: f_lineitems {
  label: "Line Items"
  view_label: "Line Items"
  join:  d_customer {
    view_label: "Customer"
    type: left_outer
    foreign_key: f_lineitems.l_custkey
    relationship: many_to_one
  }

  join: d_supplier {
    view_label: "Supplier"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey}  ;;
    relationship: many_to_one
  }

  join: d_part {
    view_label: "Part"
    type: left_outer
    sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
    relationship: many_to_one
  }

  join: ship_date {
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey} = ${ship_date.datekey} ;;
    relationship: many_to_one
  }

  join: commit_date {
    type: left_outer
    sql_on: ${f_lineitems.l_commitdatekey} = ${commit_date.datekey} ;;
    relationship: many_to_one
  }

  join: order_date {
    view_label: "Order date"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey} = ${order_date.datekey} ;;
    relationship: many_to_one
  }

  join: receipt_date {
    view_label: "Receipt date"
    type: left_outer
    sql_on: ${f_lineitems.l_receiptdatekey} = ${receipt_date.datekey} ;;
    relationship: many_to_one
  }
}
