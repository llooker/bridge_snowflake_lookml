view: order_orderproduct {
  sql_table_name: TIPSI.PUBLIC.ORDER_ORDERPRODUCT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: barcodes {
    type: string
    sql: ${TABLE}."BARCODES" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }

  measure: total_quantity {
    type:  sum
    sql: ${quantity} ;;
    description: "Needs to be confirmed if count_raw is quantity"
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED" ;;
  }

  dimension: discount_long_text {
    type: string
    sql: ${TABLE}."DISCOUNT_LONG_TEXT" ;;
  }

  dimension: discount_percent {
    type: number
    sql: ${TABLE}."DISCOUNT_PERCENT" /100 ;;
    value_format_name: percent_0
  }

  dimension: discount_per_bottle {
    type: number
    sql: ${discount_percent} * ${price_per_bottle} ;;
  }

  dimension: discount_short_text {
    type: string
    sql: ${TABLE}."DISCOUNT_SHORT_TEXT" ;;
  }

  dimension: discount_type {
    type: string
    sql: ${TABLE}."DISCOUNT_TYPE" ;;
  }

  dimension: drink_id {
    type: number
    sql: ${TABLE}."DRINK_ID" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}."INVENTORY_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: price_per_bottle {
    type: number
    sql: ${total_price} /nullif(${quantity}, 0) ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}."TOTAL_PRICE" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED" ;;
  }

  dimension: wine_id {
    type: number
    sql: ${TABLE}."WINE_ID" ;;
  }

  dimension: bottle_id {
    type: number
    sql: CASE
    WHEN ${wine_id} is null THEN ${drink_id}
    WHEN ${drink_id} is null THEN ${wine_id}
    ELSE NULL END;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
