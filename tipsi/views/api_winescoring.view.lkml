view: api_winescoring {
  sql_table_name: TIPSI.PUBLIC.API_WINESCORING ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: vintage_scoring {
    type: number
    sql: ${TABLE}."VINTAGE_SCORING" ;;
  }

  dimension: wine_id {
    type: number
    sql: ${TABLE}."WINE_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}