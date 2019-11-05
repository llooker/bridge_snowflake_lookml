view: retail_retailgroupsetting {
  sql_table_name: TIPSI.PUBLIC.RETAIL_RETAILGROUPSETTING ;;
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

  dimension: setting {
    type: number
    sql: ${TABLE}."SETTING" ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}."VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
