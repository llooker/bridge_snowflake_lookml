view: iowa {
  sql_table_name: production.production.iowa ;;

  dimension: invoice_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: created {
    type: date
  }

  dimension: store_id { type: number }
  dimension: store_name { type: string }
  dimension: address { type: string }
  dimension: city { type: string }
  dimension: zip { type: number }
  dimension: store_location { type: string }
  dimension: county_number { type: number }
  # cannot alter column rename in snowflake
  dimension: county {
    type: string
    sql: ${TABLE}.country ;;
  }
  dimension: category_id { type: number }
  dimension: category_name { type: string }
  dimension: vendor_id { type: number }
  dimension: vendor_name { type: string }
  dimension: item_id { type: number }
  dimension: item_description { type: string }
  dimension: pack { type: number }
  dimension: volume_ml { type: number }
  dimension: state_cost { type: number }
  dimension: state_bottle_retail { type: number }
  dimension: bottles_sold { type: number }
  dimension: sale_dollars { type: number }
  dimension: volume_sold_liters { type: number }
  dimension: volume_sold_gallons { type: number }
}
