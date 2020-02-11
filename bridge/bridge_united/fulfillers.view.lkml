
 view: fulfillers_bridge_united {
  derived_table: {
    explore_source: retail_retailgroup_bridge {
      column: fulfiller_id {field:core_restaurant_bridge.id}
      column: fulfiller_name {field:core_restaurant_bridge.name}
      column: organization_id {field:retail_retailgroup_bridge.id}
      column: organization_name {field:retail_retailgroup_bridge.name}
#       +      column: organization_short_name {field: organizations.short_name}
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
