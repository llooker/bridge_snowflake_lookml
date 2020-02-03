view: fulfillers_tipsi_bridge {
  derived_table: {
    explore_source: retail_retailgroup {
      column: fulfiller_id {field:retail_retailgroup.id}
      column: fulfiller_name {field:retail_retailgroup.name}
      derived_column: organization_id {
        sql: '' ;;
      }
      derived_column: organization_name {
        sql: '' ;;
      }
      derived_column: source {
        sql: 'tipsi' ;;
      }
    }
  }
  dimension: fulfiller_id {}
  dimension: fulfiller_name {}
  dimension: organization_id {}
  dimension: organization_name {}
  dimension: source {
    type: string
  }
}
