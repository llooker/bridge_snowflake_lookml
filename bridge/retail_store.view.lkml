view: retail_store_bridge {
  sql_table_name: "BRIDGE"."RETAIL_STORE"
    ;;

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

  dimension: delivery_zones {
    type: string
    sql: ${TABLE}."DELIVERY_ZONES" ;;
  }

  dimension: drink_revision {
    type: number
    sql: ${TABLE}."DRINK_REVISION" ;;
  }

  dimension: extid_auto_create_tasks {
    type: yesno
    sql: ${TABLE}."EXTID_AUTO_CREATE_TASKS" ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}."LOGO_URL" ;;
  }

  dimension: orders_enabled {
    type: yesno
    sql: ${TABLE}."ORDERS_ENABLED" ;;
  }

  dimension: pos_create_tasks {
    type: yesno
    sql: ${TABLE}."POS_CREATE_TASKS" ;;
  }

  dimension: restaurant_id {
    type: number
    sql: ${TABLE}."RESTAURANT_ID" ;;
  }

  dimension: trim_checkdigit {
    type: yesno
    sql: ${TABLE}."TRIM_CHECKDIGIT" ;;
  }

  dimension: trim_leadzeros {
    type: yesno
    sql: ${TABLE}."TRIM_LEADZEROS" ;;
  }

  dimension: upload_labels {
    type: yesno
    sql: ${TABLE}."UPLOAD_LABELS" ;;
  }

  dimension: virtual_group_id {
    type: number
    sql: ${TABLE}."VIRTUAL_GROUP_ID" ;;
  }

  dimension: wine_revision {
    type: number
    sql: ${TABLE}."WINE_REVISION" ;;
  }

  dimension: working_hours {
    type: string
    sql: ${TABLE}."WORKING_HOURS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
