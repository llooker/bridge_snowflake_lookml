include: "../drync/drync_bridge/devices.view.lkml"
include: "../tipsi/tipsi_bridge/devices.view.lkml"




view: devices_united {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${devices_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${devices_tipsi_bridge.SQL_TABLE_NAME}
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
