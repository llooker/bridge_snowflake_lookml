view: product_retailers {
  # # You can specify the table name if it's different from the view name:
  derived_table: {
    sql:
      select fulfillers.short_name as id, orgs.name, fulfillers.shipping_state as state from production.production.fulfillers fulfillers
      inner join production.production.organizations orgs
      on fulfillers.organization_id = orgs.id;;
  }

  dimension: id {
    description: "Retail location id"
    type: number
    primary_key: yes
    sql:  ${TABLE}.id ;;
  }
  dimension: name {
    description: "Retailer brand name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    description: "State of the retail location"
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: distinct_states {
    description: "Count of distinct states"
    type:  count_distinct
    sql: ${state} ;;
  }

  measure: distinct_locations {
    description: "Count of distinct retail locations"
    type: count_distinct
    sql: ${id} ;;
  }

  measure: distinct_retailers {
    description: "Count of distinct retailer brands"
    type: count_distinct
    sql: ${name} ;;
  }

  measure: count {
    description: "Count"
    type: count
  }
}
