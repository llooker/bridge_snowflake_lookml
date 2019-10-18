view: tipsi_auth_user {
  sql_table_name: TIPSI.PUBLIC.TIPSI_AUTH_USER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."BIRTH_DATE" ;;
  }

  dimension: birth_year_number {
    type: number
    sql: ${birth_year::number} ;;
  }

  dimension: age {
    type: number
    sql: extract(year from current_date) - ${birth_year} ;;
  }

  dimension: generation {
    type:  string
    case: {
      when: {
        label: "Mature"
        sql: ${birth_year} < 1946;;
      }
      when: {
        label: "Baby Boomer"
        sql: ${birth_year} >= 1946 AND ${birth_year} <= 1964;;
      }
      when: {
        label: "Generation X"
        sql: ${birth_year} > 1964 AND ${birth_year} <= 1980;;
      }
      when: {
        label: "Millennial"
        sql: ${birth_year} > 1980 AND ${birth_year} <= 2000;;
      }
      else: "Undefined"
    }
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

  dimension: temporary {
    type: yesno
    sql: ${TABLE}."TEMPORARY" ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}."TOKEN" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

  dimension: gender {
    type: string
    sql: null ;;
  }

  measure: count {
    type: count
    drill_fields: [id, username, first_name, last_name, password, group_id, generation, birth_date, last_login_date, is_active, token,
      age, is_staff, data]
  }
}
