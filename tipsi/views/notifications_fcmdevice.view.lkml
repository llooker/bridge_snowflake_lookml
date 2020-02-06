view: notifications_fcmdevice {
  sql_table_name: TIPSI.PUBLIC.NOTIFICATIONS_FCMDEVICE ;;

  dimension: device_id {
    primary_key: yes #https://dryncapp.looker.com/sql/4jzzr2vhxtqnzs
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}."ENABLED" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}."TOKEN" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
