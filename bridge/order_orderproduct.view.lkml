view: order_orderproduct_bridge {
  sql_table_name: "BRIDGE_ORDERS"."ORDER_ORDERPRODUCT"
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

  dimension: barcodes {
    type: string
    sql: ${TABLE}."BARCODES" ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
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

}
