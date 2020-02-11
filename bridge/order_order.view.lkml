view: order_order_bridge {
  sql_table_name: "BRIDGE_ORDERS"."ORDER_ORDER"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
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
    type: string
    sql: ${TABLE}."ORDER_STATUS"::varchar ;;
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

  dimension: actual_order_price {
    type: number
    sql: ${products_price} - ${products_discount}
          + ${delivery_price}
          + ${delivery_tax}
          + ${products_tax}
          ;;
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
