view: retailer_bottle_sources {
  sql_table_name: PRODUCTION.RETAILER_BOTTLE_SOURCES ;;
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

  dimension: allows_delivery {
    type: yesno
    sql: ${TABLE}."ALLOWS_DELIVERY" ;;
  }

  dimension: allows_pickup {
    type: yesno
    sql: ${TABLE}."ALLOWS_PICKUP" ;;
  }

  dimension: allows_shipping {
    type: yesno
    sql: ${TABLE}."ALLOWS_SHIPPING" ;;
  }

  dimension: average_retail_price {
    type: number
    sql: ${TABLE}."AVERAGE_RETAIL_PRICE" ;;
  }

  dimension: bottle_source_id {
    type: number
    sql: ${TABLE}."BOTTLE_SOURCE_ID" ;;
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

  dimension: deposit {
    type: number
    sql: ${TABLE}."DEPOSIT" ;;
  }

  dimension: discount_codes {
    type: string
    sql: ${TABLE}."DISCOUNT_CODES" ;;
  }

  dimension: drync_retail_price {
    type: number
    sql: ${TABLE}."DRYNC_RETAIL_PRICE" ;;
  }

  dimension: ebay_deal {
    type: yesno
    sql: ${TABLE}."EBAY_DEAL" ;;
  }

  dimension: front_line_price {
    type: number
    sql: ${TABLE}."FRONT_LINE_PRICE" ;;
  }

  dimension: identifiers {
    type: string
    sql: ${TABLE}."IDENTIFIERS" ;;
  }

  dimension_group: imported {
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
    sql: ${TABLE}."IMPORTED_AT" ;;
  }

  dimension: in_stock {
    type: number
    sql: ${TABLE}."IN_STOCK" ;;
  }

  dimension: per_customer_limit {
    type: number
    sql: ${TABLE}."PER_CUSTOMER_LIMIT" ;;
  }

  dimension: previous_price {
    type: number
    sql: ${TABLE}."PREVIOUS_PRICE" ;;
  }

  dimension_group: price_recorded {
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
    sql: ${TABLE}."PRICE_RECORDED_AT" ;;
  }

  dimension_group: price_valid_until {
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
    sql: ${TABLE}."PRICE_VALID_UNTIL" ;;
  }

  dimension: retailer_id {
    type: number
    sql: ${TABLE}."RETAILER_ID" ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}."SIZE" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  dimension: skus {
    type: string
    sql: ${TABLE}."SKUS" ;;
  }

  dimension: source_attributes {
    type: string
    sql: ${TABLE}."SOURCE_ATTRIBUTES" ;;
  }

  dimension: source_fragment {
    type: string
    sql: ${TABLE}."SOURCE_FRAGMENT" ;;
  }

  dimension: source_image_urls {
    type: string
    sql: ${TABLE}."SOURCE_IMAGE_URLS" ;;
  }

  dimension: univ_prod {
    type: string
    sql: ${TABLE}."UNIV_PROD" ;;
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

  dimension: wholelist {
    type: string
    sql: ${TABLE}."WHOLELIST" ;;
  }

  dimension: wholesaler_name {
    type: string
    sql: ${TABLE}."WHOLESALER_NAME" ;;
  }

  dimension: wholesaler_prod_id {
    type: string
    sql: ${TABLE}."WHOLESALER_PROD_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, wholesaler_name]
  }
}
