view: line_items {
  sql_table_name: PRODUCTION.LINE_ITEMS ;;
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

  dimension: amended_price_per_bottle {
    type: number
    sql: ${TABLE}."AMENDED_PRICE_PER_BOTTLE" ;;
  }

  dimension: bottle_id {
    type: number
    sql: ${TABLE}."BOTTLE_ID" ;;
  }

  dimension: bridge_bottle_id {
    description: "The bottle ID cast as a string"
    type: string
    sql: ${bottle_id}::string ;;
  }

  dimension: bottle_name {
    type: string
    sql: ${TABLE}."BOTTLE_NAME" ;;
  }

  dimension: bottle_packaging {
    type: string
    sql: ${TABLE}."BOTTLE_PACKAGING" ;;
  }

  dimension: cork_id {
    type: number
    sql: ${TABLE}."CORK_ID" ;;
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
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: current_vintage {
    type: yesno
    sql: ${TABLE}."CURRENT_VINTAGE" ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}."DELETED_AT" ;;
  }

  dimension: deposit {
    type: number
    sql: ${TABLE}."DEPOSIT" ;;
  }

  dimension: discount_per_bottle {
    type: number
    sql: ${TABLE}."DISCOUNT_PER_BOTTLE"/100 ;;
    value_format_name: usd
  }

  dimension: discount_rule_id {
    type: number
    sql: ${TABLE}."DISCOUNT_RULE_ID" ;;
  }

  dimension: exception_cause {
    type: string
    sql: ${TABLE}."EXCEPTION_CAUSE" ;;
  }

  dimension: fulfiller_price_per_bottle {
    type: number
    sql: ${TABLE}."FULFILLER_PRICE_PER_BOTTLE" ;;
  }

  dimension: markup_percentage {
    type: number
    sql: ${TABLE}."MARKUP_PERCENTAGE" ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}."MESSAGE" ;;
  }

  dimension: previous_price {
    type: number
    sql: ${TABLE}."PREVIOUS_PRICE" ;;
  }

  dimension: price_per_bottle {
    type: number
    sql: ${TABLE}."PRICE_PER_BOTTLE"/100 ;;
    value_format_name: usd
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}."REFERER" ;;
  }

  dimension: retailer_bottle_source_id {
    type: number
    sql: ${TABLE}."RETAILER_BOTTLE_SOURCE_ID" ;;
  }

  dimension: shipment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."SHIPMENT_ID" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension_group: update_expected_by {
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
    sql: ${TABLE}."UPDATE_EXPECTED_BY" ;;
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
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, bottle_name, shipments.name, shipments.id]
  }
}
