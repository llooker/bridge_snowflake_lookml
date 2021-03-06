include: "../drync/drync_united/fulfillers.view.lkml"
include: "../tipsi/tipsi_united/fulfillers.view.lkml"
include: "../bridge/bridge_united/fulfillers.view.lkml"




view: fulfillers_united {
  # Or, you could make this view a derived table, like this:
  derived_table: {
#     datagroup_trigger: bridge_default
    sql:   SELECT * FROM ${fulfillers_drync_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${fulfillers_tipsi_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${fulfillers_bridge_united.SQL_TABLE_NAME}
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
  dimension: organization_short_name {}
  dimension: source {
    type: string
  }

  measure: count {
    type: count
  }
}
