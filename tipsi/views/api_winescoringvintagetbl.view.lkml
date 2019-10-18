view: api_winescoringvintagetbl {
  sql_table_name: TIPSI.PUBLIC.API_WINESCORINGVINTAGETBL ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}."COUNTRY_ID" ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}."REGION_ID" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: sub_region_id {
    type: number
    sql: ${TABLE}."SUB_REGION_ID" ;;
  }

  dimension: varietal_id {
    type: number
    sql: ${TABLE}."VARIETAL_ID" ;;
  }

  dimension: vintage {
    type: number
    sql: ${TABLE}."VINTAGE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}