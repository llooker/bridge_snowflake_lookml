
 view: fulfillers_bridge_united {
  derived_table: {
    explore_source: retail_retailgroup_bridge {
      column: fulfiller_id {field:retail_retailgroup.id}
      column: fulfiller_name {field:retail_retailgroup.name}
      derived_column: organization_id {
        sql: 0 ;;
      }
      derived_column: organization_name {
        sql: '' ;;
      }
      derived_column: source {
        sql: 'bridge' ;;
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
