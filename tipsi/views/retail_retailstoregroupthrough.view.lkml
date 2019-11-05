view: retail_retailstoregroupthrough {
  sql_table_name: TIPSI.PUBLIC.RETAIL_RETAILSTOREGROUPTHROUGH ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."STORE_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
