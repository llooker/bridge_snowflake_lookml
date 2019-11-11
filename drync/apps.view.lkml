view: apps {
  sql_table_name: PRODUCTION.APPS ;;
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

  dimension: apple_uid {
    type: number
    value_format_name: id
    sql: ${TABLE}."APPLE_UID" ;;
  }

  dimension: branch_app_key {
    type: string
    sql: ${TABLE}."BRANCH_APP_KEY" ;;
  }

  dimension: localytics_android_app_key {
    type: string
    sql: ${TABLE}."LOCALYTICS_ANDROID_APP_KEY" ;;
  }

  dimension: localytics_app_key {
    type: string
    sql: ${TABLE}."LOCALYTICS_APP_KEY" ;;
  }

  dimension: mailchimp_list_name {
    type: string
    sql: ${TABLE}."MAILCHIMP_LIST_NAME" ;;
  }

  dimension: mailchimp_list_uid {
    type: string
    sql: ${TABLE}."MAILCHIMP_LIST_UID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}."SHORT_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      mailchimp_list_name,
      name,
      short_name,
      app_registrations.count,
      app_sessions.count
    ]
  }
}
