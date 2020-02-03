include: "../drync/drync_bridge/fulfillers.view.lkml"
include: "../tipsi/tipsi_bridge/fulfillers.view.lkml"




view: fulfillers_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${fulfillers_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${fulfillers_tipsi_bridge.SQL_TABLE_NAME}
      ;;
  }

  dimension: pk_id {
    type: string
    primary_key: yes
    sql: ${source} || ${fulfiller_id} ;;
  }
  dimension: fulfiller_id {}
  dimension: fulfiller_name {}
  dimension: organization_id {}
  dimension: organization_name {}
  dimension: source {
    type: string
  }

  measure: count {
    type: count
  }
}
