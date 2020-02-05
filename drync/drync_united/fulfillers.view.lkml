view: fulfillers_drync_united {
  derived_table: {
    explore_source: fulfillers_drync {
      column: fulfiller_id {field: fulfillers.id}
      column: fulfiller_name {field: fulfillers.name}
      column: organization_id {field: fulfillers.organization_id}
      column: organization_name {field:organizations.name}
      derived_column: source {
        sql: 'drync' ;;
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
