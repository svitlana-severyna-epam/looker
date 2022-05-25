connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: looker_intensive_8_svitlana_severyna_module_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive_8_svitlana_severyna_module_2_default_datagroup

explore: d_customer {}

explore: d_dates {}

explore: d_part {}

explore: d_supplier {}

explore: f_lineitems {
  view_label: "LineItems"
  join:  d_customer {
    view_label: "Customer"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
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

  join: d_dates {
    view_label: "Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey} = ${d_dates.datekey} ;;
    relationship: many_to_one
  }
}
