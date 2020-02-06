view: devices_tipsi_united {
  derived_table: {
    explore_source: devices_tipsi {
      column: device_id {}
      column: user_id {}
      derived_column: source {
        sql: 'tipsi' ;;
      }
    }
  }
  dimension: device_id {}
  dimension: user_id {}
  dimension: source {
    type: string
  }
}
