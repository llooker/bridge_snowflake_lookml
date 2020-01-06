view: organizations_drync_bridge {
  derived_table: {
    explore_source: organizations {
      column: id {}
      column: name {}
      derived_column: source {
        sql: 'drync' ;;
      }
    }
  }
  dimension: id {}
  dimension: name {}
  dimension: source {
    type: string
  }
}
