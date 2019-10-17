view: order_order {
  sql_table_name: PUBLIC.ORDER_ORDER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
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

  dimension: delivery_info {
    type: string
    sql: ${TABLE}."DELIVERY_INFO" ;;
  }

  dimension: delivery_price {
    type: number
    sql: ${TABLE}."DELIVERY_PRICE" ;;
  }

  dimension: delivery_tax {
    type: number
    sql: ${TABLE}."DELIVERY_TAX" ;;
  }

  dimension: delivery_type {
    type: number
    sql: ${TABLE}."DELIVERY_TYPE" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: order_status {
    type: number
    sql: ${TABLE}."ORDER_STATUS" ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}."PAYMENT_DATE" ;;
  }

  dimension: payment_status {
    type: number
    sql: ${TABLE}."PAYMENT_STATUS" ;;
  }

  dimension: products_discount {
    type: number
    sql: ${TABLE}."PRODUCTS_DISCOUNT" ;;
  }

  dimension: products_price {
    type: number
    sql: ${TABLE}."PRODUCTS_PRICE" ;;
  }

  dimension: products_tax {
    type: number
    sql: ${TABLE}."PRODUCTS_TAX" ;;
  }

  dimension: search_idx {
    type: string
    sql: ${TABLE}."SEARCH_IDX" ;;
  }

  dimension: shopping_hint_description {
    type: string
    sql: ${TABLE}."SHOPPING_HINT_DESCRIPTION" ;;
  }

  dimension: shopping_hint_title {
    type: string
    sql: ${TABLE}."SHOPPING_HINT_TITLE" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."STORE_ID" ;;
  }

  dimension: total_count {
    type: number
    sql: ${TABLE}."TOTAL_COUNT" ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
