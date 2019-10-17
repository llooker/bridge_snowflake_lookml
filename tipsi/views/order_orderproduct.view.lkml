view: order_orderproduct {
  sql_table_name: PUBLIC.ORDER_ORDERPRODUCT ;;
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

  dimension: count_raw {
    type: number
    hidden: yes
    sql: ${TABLE}."COUNT" ;;
  }

  measure: total_quantity {
    type:  sum
    sql: ${count_raw} ;;
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
    sql: ${TABLE}."DISCOUNT_PERCENT" ;;
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

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
