view: vendor_drinktag {
  sql_table_name: PUBLIC.VENDOR_DRINKTAG ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: drink_type {
    type: number
    sql: ${TABLE}."DRINK_TYPE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: parent_type {
    type: number
    sql: ${TABLE}."PARENT_TYPE" ;;
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
