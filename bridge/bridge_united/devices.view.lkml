
 view: devices_bridge_united {
  derived_table: {
    explore_source: devices_bridge {
      column: device_id {}
      column: user_id {}
      derived_column: source {
        sql: 'bridge' ;;
      }
    }
  }
  dimension: id {
    type: number
  }
  dimension: device_id {}
  dimension: user_id {}
  dimension: source {
    type: string
  }
}
