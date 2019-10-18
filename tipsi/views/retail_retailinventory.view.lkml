view: retail_retailinventory {
  sql_table_name: TIPSI.PUBLIC.RETAIL_RETAILINVENTORY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: abv {
    type: number
    sql: ${TABLE}."ABV" ;;
  }

  dimension: barcodes {
    type: string
    sql: ${TABLE}."BARCODES" ;;
  }

  dimension: batch_price {
    type: string
    sql: ${TABLE}."BATCH_PRICE" ;;
  }

  dimension: connoisseur_pick {
    type: yesno
    sql: ${TABLE}."CONNOISSEUR_PICK" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED" ;;
  }

  dimension: drink_id {
    type: number
    sql: ${TABLE}."DRINK_ID" ;;
  }

  dimension: drink_id_is_null {
    type: yesno
    sql: ${drink_id} is null ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: extra {
    type: string
    sql: ${TABLE}."EXTRA" ;;
  }

  dimension: in_stock {
    type: number
    sql: ${TABLE}."IN_STOCK" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}."NOTE" ;;
  }

  dimension: old_price {
    type: number
    sql: ${TABLE}."OLD_PRICE" ;;
  }

  dimension: on_sale {
    type: yesno
    sql: ${TABLE}."ON_SALE" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: pack_size {
    type: number
    sql: ${TABLE}."PACK_SIZE" ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: proof {
    type: number
    sql: ${TABLE}."PROOF" ;;
  }

  dimension: staff_pick {
    type: yesno
    sql: ${TABLE}."STAFF_PICK" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."STORE_ID" ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: unit_size {
    type: string
    sql: ${TABLE}."UNIT_SIZE" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED" ;;
  }

  dimension: visible {
    type: yesno
    sql: ${TABLE}."VISIBLE" ;;
  }

  dimension: wine_id {
    type: number
    sql: ${TABLE}."WINE_ID" ;;
  }

  dimension: wine_id_is_null {
    type: yesno
    sql: ${wine_id} is null ;;
  }

  measure: count {
    type: count
    drill_fields: [id, note, proof, abv, drink_id, wine_id]
  }
}