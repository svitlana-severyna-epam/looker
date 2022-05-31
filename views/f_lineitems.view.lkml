view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    label: "Line Number"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.l_orderkey, ${TABLE}.l_partkey, ${TABLE}.l_suppkey, ${TABLE}.l_linenumber) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_sale_price {
    description: "Average sale price of items sold"
    label: "Average sale price"
    type: average
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }


  measure: total_sales {
    description: "Total sales from items sold"
    group_label: "Sum"
    type: sum
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: cumulative_total_sales {
    description: "Cumulative total sales from items sold"
    type: running_total
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: total_sale_by_air {
    description: "Total sales of items shipped by air"
    group_label: "Sum"
    type: sum
    filters: [l_shipmode: "REG AIR, AIR"]
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: total_brazil_sales {
    description: "Total sales by customers from Brazil"
    group_label: "Sum"
    type: sum
    filters: [d_customer.c_nation: "BRAZIL"]
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: total_gross_revenue {
    description: "Total price of completed sales"
    group_label: "Sum"
    type: sum
    filters: [l_orderstatus: "F"]
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: total_cost {
    description: "Total Supply Cost"
    group_label: "Sum"
    type: sum
    sql:  ${l_supplycost};;
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: total_gross_margin_amount {
    group_label: "Sum"
    description: "Total Gross Revenue – Total Cost"
    sql: ${total_gross_revenue} - ${total_cost} ;;
    type: number
    value_format_name: usd
    view_label: "Money measures"
  }

  measure: gross_margin_percentage {
    description: "Total Gross Margin Amount / Total Gross Revenue"
    group_label: "Sum"
    sql: ${total_gross_margin_amount}/NULLIF(${total_gross_revenue}, 0) ;;
    type: number
    value_format_name: percent_0
    view_label: "Money measures"
  }

  measure: number_of_items_returned {
    description: "Number of items that were returned by dissatisfied customers"
    type: count
    filters: [l_returnflag: "R" ]
    view_label: "Number measure"
  }

  measure: number_of_items_sold {
    description: "Number of items that were sold"
    type: count
    view_label: "Number measure"
  }

  measure: item_return_rate {
    description: "Number Of Items Returned / Total Number Of Items Sold"
    sql: ${number_of_items_returned}/NULLIF(${number_of_items_sold}, 0) ;;
    type: number
    view_label: "Number measure"
  }

  measure: avg_spend_per_customer {
    description: "Total Sale Price / Total Number of Customers"
    sql: ${total_sales} / NULLIF(${d_customer.count}, 0) ;;
    view_label: "Money measures"
  }
}
