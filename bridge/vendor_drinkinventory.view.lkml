view: vendor_drinkinventory_bridge {
  sql_table_name: "BRIDGE"."VENDOR_DRINKINVENTORY"
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

  dimension: drink_id {
    type: number
    sql: ${TABLE}."DRINK_ID" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: restaurant_id {
    type: number
    sql: ${TABLE}."RESTAURANT_ID" ;;
  }

  dimension: special_price {
    type: number
    sql: ${TABLE}."SPECIAL_PRICE" ;;
  }

  dimension: special_price_on {
    type: yesno
    sql: ${TABLE}."SPECIAL_PRICE_ON" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: visible {
    type: yesno
    sql: ${TABLE}."VISIBLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
