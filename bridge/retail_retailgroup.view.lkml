view: retail_retailgroup {
  sql_table_name: "BRIDGE"."RETAIL_RETAILGROUP"
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

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: footer_logo {
    type: number
    sql: ${TABLE}."FOOTER_LOGO" ;;
  }

  dimension: header_logo {
    type: number
    sql: ${TABLE}."HEADER_LOGO" ;;
  }

  dimension: internal_note {
    type: string
    sql: ${TABLE}."INTERNAL_NOTE" ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}."LOGO_URL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: secondary_logo_url {
    type: string
    sql: ${TABLE}."SECONDARY_LOGO_URL" ;;
  }

  dimension: shortcut {
    type: string
    sql: ${TABLE}."SHORTCUT" ;;
  }

  dimension: tos {
    type: string
    sql: ${TABLE}."TOS" ;;
  }

  dimension: url_slug {
    type: string
    sql: ${TABLE}."URL_SLUG" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
