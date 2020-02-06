include: "../drync/drync_united/order_product.view.lkml"
include: "../tipsi/tipsi_united/order_product.view.lkml"
include: "../bridge/bridge_united/order_product.view.lkml"



# explore: order_product_bridge_useme {
#   from: order
#   label: "USE ME"
# }
view: order_product_united {
  view_label: "Order Items"
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${order_product_drync_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${order_product_tipsi_united.SQL_TABLE_NAME}
             UNION
            SELECT * FROM ${order_product_bridge_united.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    label: "Line Item ID"
    type: number
  }

  dimension: pk_id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }
  dimension: order_id {}

  dimension: source_order_id {
    hidden: yes
    type: string
    sql: ${source} || ${order_id} ;;
  }

  dimension: bottle_id {}

  dimension: source_bottle_id {
    hidden: yes
    type: string
    sql: ${source} || ${bottle_id} ;;
  }

  dimension: price_per_bottle {
    hidden: yes
    type: number
  }

  dimension: quantity {
    hidden: yes
    label: "Line Item Quantity"
    type: number
  }

  dimension: discount_per_bottle {
    hidden: yes
    type: number
  }

  dimension: source {
    type: string
  }

  dimension: order_list_price {
    hidden: yes
    type: number
    value_format_name: usd
  }

  dimension: line_item_list_price {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${price_per_bottle} * ${quantity} ;;
  }
  dimension: percent_of_order {
    hidden: yes
    type: number
    sql: ${line_item_list_price} / ${order_list_price} ;;
    value_format_name: percent_2
  }
  dimension: line_item_actual_price {
    hidden: yes
    type: number
    sql: ${orders_united.total_price_raw}*${percent_of_order} ;;
  }
  dimension: line_item_subtotal {
    hidden: yes
    type: number
    sql: ${orders_united.subtotal}*${percent_of_order} ;;
  }
  measure: total_subtotal {
    label: "Product Total"
    type: sum
    sql: ${line_item_subtotal} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }
  dimension: line_item_tax {
    hidden: yes
    type: number
    sql:${orders_united.tax}*${percent_of_order} ;;
  }
  measure: total_tax {
    type: sum
    sql:  ${line_item_tax} ;;
    value_format_name: usd

    drill_fields: [detail*]
  }
  dimension: line_item_deposit {
    hidden: yes
    type: number
    sql: ${orders_united.deposit}*${percent_of_order} ;;
  }
  measure: total_deposit {
    type: sum
    sql: ${line_item_deposit} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }
  dimension: line_item_discount {
    hidden: yes
    type: number
    sql: ${orders_united.discount}*${percent_of_order} ;;
  }
  measure: total_discount {
    type: sum
    sql: ${line_item_discount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }
  dimension: line_item_net {
    type: number
    hidden: yes
    sql: (${line_item_subtotal} - ${line_item_discount} + ${line_item_deposit}) ;;
  }
  measure: net_total {
    type: sum
    sql: ${line_item_net} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }
  dimension: fulfillment_method {
    sql: case when ${TABLE}.fulfillment_method = 'delivery' then 'Delivery'
    when ${TABLE}.fulfillment_method = 'shipping' then 'Shipping'
    when ${TABLE}.fulfillment_method = 'pickup' then 'Pickup'
    else ${TABLE}.fulfillment_method end
    ;;
  }
  measure: total_price {
    description: "Includes deposit, tax, discounts, shipping, delivery tip, and product costs"
    value_format_name: usd
    type: sum
    sql: ${line_item_actual_price} ;;
    drill_fields: [detail*]
  }

  measure: count {
    type: count
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [detail*]
  }

#   measure: order_total {
#     label: "Total List Price"
#     hidden: yes
#     description: "DO NOT USE!  Does not include shipping, discounts, tax, tip, or deposit.  This is NOT the actual price paid for goods."
#     type: sum
#     sql: ${price_per_bottle} * ${quantity}  ;;
#     value_format_name: usd
#     drill_fields: [detail*]
#   }

  measure: average_order_value  {
    type: number
    sql: ${total_price} / nullif(${order_count},0) ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: average_basket_size {
    description: "NOT SURE THIS IS CORRECT!!  Takes an average of the line item quantity, without regard to bottle size"
    type: number
    sql: AVG(${quantity}) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

dimension: order_total_discount {
  hidden: yes
  description: "Only works at order level.  Do not use when grouping on line item or product"
  type: number
  sql: ${quantity} * ${discount_per_bottle} ;;
}

  measure: spend_per_user  {
    type: number
    sql: (${total_price})/nullif(${orders_united.distinct_buyers},0);;
    value_format_name: usd
    drill_fields: [detail*]
  }

  set: detail {
    fields: [id,order_id, source, price_per_bottle,quantity,products_united.name, products_united.category, products_united.brand,products_united.size, count, total_price]
  }
}
