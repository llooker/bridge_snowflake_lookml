include: "../drync/drync_bridge/products.view.lkml"
include: "../tipsi/tipsi_bridge/products.view.lkml"




view: products_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${products_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${products_tipsi_bridge.SQL_TABLE_NAME}
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
  dimension: product_id {}

  dimension: source_product_id {
    sql: ${source} || ${product_id} ;;
  }

  dimension: brand {}
  dimension: name {}
  dimension: variant {}
  dimension: source {
    type: string
  }
  dimension: size {}
  dimension: category {}
  dimension: subcategory {}

  measure: count {
    type: count
  }
}
