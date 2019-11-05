view: retail_retailgroup {
  sql_table_name: TIPSI.PUBLIC.RETAIL_RETAILGROUP ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: internal_note {
    type: string
    sql: ${TABLE}."INTERNAL_NOTE" ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}."LOGO_URL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: shortcut {
    type: string
    sql: ${TABLE}."SHORTCUT" ;;
  }

  dimension: tos {
    type: string
    sql: ${TABLE}."TOS" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
