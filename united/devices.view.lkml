include: "../drync/drync_united/devices.view.lkml"
include: "../tipsi/tipsi_united/devices.view.lkml"
include: "../bridge/bridge_united/devices.view.lkml"




view: devices_united {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${devices_drync_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${devices_tipsi_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${devices_bridge_united.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    type: number
  }

  dimension: source_id {
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }
  dimension: device_id {}
  dimension: user_id {}
  dimension: source_user_id {
    sql: ${source} || ${user_id} ;;
  }
  dimension: source {
    type: string
  }
}
