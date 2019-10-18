view: api_subregion {
  sql_table_name: TIPSI.PUBLIC.API_SUBREGION ;;
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

  dimension: old_world {
    type: yesno
    sql: ${TABLE}."OLD_WORLD" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."TYPE" ;;
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