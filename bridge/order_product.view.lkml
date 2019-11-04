include: "../drync/drync_bridge/order_product.view.lkml"
include: "../tipsi/tipsi_bridge/order_product.view.lkml"




view: order_product_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${order_product_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${order_product_tipsi_bridge.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    type: number
  }

  dimension: pk_id {
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }
  dimension: order_id {}

  dimension: source_order_id {
    type: string
    sql: ${source} || ${order_id} ;;
  }

  dimension: bottle_id {}

  dimension: source_bottle_id {
    type: string
    sql: ${source} || ${bottle_id} ;;
  }

  dimension: price_per_bottle {
    type: number
  }

  dimension: quantity {
    type: number
  }

  dimension: discount_per_bottle {
    type: number
  }

  dimension: source {
    type: string
  }

  measure: count {
    type: count
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [detail*]
  }

  measure: order_total {
    label: "Total Spend"
    type: sum
    sql: ${price_per_bottle} * ${quantity}  ;;
    value_format_name: usd
  }

  measure: avg_order_value  {
    type: number
    sql: ${order_total} / nullif(${order_count},0) ;;
    value_format_name: usd
  }

  measure: total_discount {
    type: sum
    sql: ${quantity} * ${discount_per_bottle} ;;
  }

  measure: spend_per_user  {
    type: number
    sql: (${order_total} - ${total_discount})/nullif(${orders_bridge.distinct_buyers},0);;
    value_format_name: usd
  }

  set: detail {
    fields: [order_id, source, price_per_bottle,quantity,products_bridge.name, products_bridge.category, products_bridge.brand, count, order_total]
  }
}
