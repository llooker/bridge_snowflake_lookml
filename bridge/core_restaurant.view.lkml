view: core_restaurant_bridge {
  sql_table_name: "BRIDGE"."CORE_RESTAURANT"
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

  dimension: address {
    type: string
    sql: ${TABLE}."ADDRESS" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  # improperly labeled in db as country
  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}."ENABLED" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: had_menu {
    type: yesno
    sql: ${TABLE}."HAD_MENU" ;;
  }

  dimension: location_area_id {
    type: number
    sql: ${TABLE}."LOCATION_AREA_ID" ;;
  }

  dimension: menupages_urls {
    type: string
    sql: ${TABLE}."MENUPAGES_URLS" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}."NEIGHBORHOOD" ;;
  }

  dimension: ordered_menu {
    type: yesno
    sql: ${TABLE}."ORDERED_MENU" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."PHONE_NUMBER" ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}."POPULARITY" ;;
  }

  dimension: postcode {
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}."POSTCODE" ;;
  }

  dimension: price_rating {
    type: number
    sql: ${TABLE}."PRICE_RATING" ;;
  }

  dimension: reviewed {
    type: yesno
    sql: ${TABLE}."REVIEWED" ;;
  }

  dimension: reviewed_by_id {
    type: number
    sql: ${TABLE}."REVIEWED_BY_ID" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension_group: timestamp_added {
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
    sql: ${TABLE}."TIMESTAMP_ADDED" ;;
  }

  dimension_group: timestamp_reprocessed {
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
    sql: ${TABLE}."TIMESTAMP_REPROCESSED" ;;
  }

  dimension_group: timestamp_updated {
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
    sql: ${TABLE}."TIMESTAMP_UPDATED" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."WEBSITE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
