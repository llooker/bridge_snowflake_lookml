view: core_restaurant {
  sql_table_name: TIPSI.PUBLIC.CORE_RESTAURANT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}."address" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."comment" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  dimension: had_menu {
    type: yesno
    sql: ${TABLE}."had_menu" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }

  dimension: location_area_id {
    type: number
    sql: ${TABLE}."location_area_id" ;;
  }

  dimension: menupages_urls {
    type: string
    sql: ${TABLE}."menupages_urls" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}."neighborhood" ;;
  }

  dimension: ordered_menu {
    type: yesno
    sql: ${TABLE}."ordered_menu" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}."popularity" ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}."postcode" ;;
  }

  dimension: price_rating {
    type: number
    sql: ${TABLE}."price_rating" ;;
  }

  dimension: reviewed {
    type: yesno
    sql: ${TABLE}."reviewed" ;;
  }

  dimension: reviewed_by_id {
    type: number
    sql: ${TABLE}."reviewed_by_id" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
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
    sql: ${TABLE}."timestamp_added" ;;
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
    sql: ${TABLE}."timestamp_reprocessed" ;;
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
    sql: ${TABLE}."timestamp_updated" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."type" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
