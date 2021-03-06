include: "../drync/drync_united/products.view.lkml"
include: "../tipsi/tipsi_united/products.view.lkml"
include: "../bridge/bridge_united/products.view.lkml"



view: products_united {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    datagroup_trigger: bridge_default
    sql:   SELECT * FROM ${products_drync_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${products_tipsi_united.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${products_bridge_united.SQL_TABLE_NAME}
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
