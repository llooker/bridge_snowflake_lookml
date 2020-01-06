include: "../drync/drync_bridge/organizations.view.lkml"
include: "../tipsi/tipsi_bridge/organizations.view.lkml"




view: organizations_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${organizations_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${organizations_tipsi_bridge.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    type: number
  }

  dimension: pk_id {
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }
  dimension: name {}
  dimension: source {}

  measure: count {
    type: count
  }
}
