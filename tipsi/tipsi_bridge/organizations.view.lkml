view: organizations_tipsi_bridge {
  derived_table: {
    explore_source: retail_retailgroup {
      column: id {}
      column: name {}
      derived_column: source {
        sql: 'tipsi' ;;
      }
    }
  }
  dimension: id {}
  dimension: name {}
  dimension: source {
    type: string
  }
}
