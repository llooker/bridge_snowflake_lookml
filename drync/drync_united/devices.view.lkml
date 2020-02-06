view: devices_drync_united {
  derived_table: {
    explore_source: devices_drync {
      column: device_id { field: devices_drync.device_identifier }
      column: user_id {}
      derived_column: source {
        sql: 'drync' ;;
      }
    }
  }

  dimension: device_id {}
  dimension: user_id {}
  dimension: source {
    type: string
  }
}
