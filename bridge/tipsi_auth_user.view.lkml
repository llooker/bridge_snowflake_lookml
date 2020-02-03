view: tipsi_auth_user {
  sql_table_name: "BRIDGE"."TIPSI_AUTH_USER"
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

  dimension_group: birth {
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
    sql: ${TABLE}."BIRTH_DATE" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
  }

  dimension_group: date_joined {
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
    sql: ${TABLE}."DATE_JOINED" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension: is_staff {
    type: yesno
    sql: ${TABLE}."IS_STAFF" ;;
  }

  dimension: is_superuser {
    type: yesno
    sql: ${TABLE}."IS_SUPERUSER" ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}."LAST_LOGIN" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}."PASSWORD" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."STORE_ID" ;;
  }

  dimension: temporary {
    type: yesno
    sql: ${TABLE}."TEMPORARY" ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}."TOKEN" ;;
  }

  dimension: user_role {
    type: number
    sql: ${TABLE}."USER_ROLE" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, username, first_name, last_name]
  }
}
