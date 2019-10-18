view: api_country {
  sql_table_name: TIPSI.PUBLIC.API_COUNTRY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
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
    sql: ${TABLE}."CREATED" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}."IMAGE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: name_pattern {
    type: number
    sql: ${TABLE}."NAME_PATTERN" ;;
  }

  dimension: old_world {
    type: yesno
    sql: ${TABLE}."OLD_WORLD" ;;
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
    sql: ${TABLE}."UPDATED" ;;
  }

  dimension: validated {
    type: yesno
    sql: ${TABLE}."VALIDATED" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}