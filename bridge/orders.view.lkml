include: "../drync/drync_bridge/orders.view.lkml"
include: "../tipsi/tipsi_bridge/orders.view.lkml"




view: orders_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:  SELECT * FROM ${orders_drync_bridge.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${orders_tipsi_bridge.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    type: number
  }
  dimension: created {}
  dimension: gift_recipient {
    type: string
  }
  dimension: source {
    type: string
  }
  dimension: quantity {
    type: number
  }
  dimension: store_id {}
  dimension: user_id {}
  dimension: discount {}
  dimension: total_price {}

  measure: count {
    type: count
  }

  measure: distinct_buyers {
    type: count_distinct
    sql_distinct_key: ${TABLE}.user_id ;;
    sql: ${TABLE}.user_id ;;
  }

  measure: first_order  {
    type: date
    sql: MIN(${created}) ;;
  }

  measure: last_order  {
    type: date
    sql: MAX(${created}) ;;
  }

  measure: order_total {
    type: sum
    sql: ${total_price}  ;;
    value_format_name: usd
  }

  measure: avg_order_value  {
    type: number
    sql: ${order_total} / nullif(${count},0) ;;
    value_format_name: usd
  }

  measure: spend_per_user  {
    type: number
    sql: (${order_total} - ${discount})/nullif(${distinct_buyers},0);;
    value_format_name: usd
  }

  measure: lifetime_order_tier {
    type: string
    case: {
      when: {
        label: "Gold"
        sql: ${count} > 1000;;
      }
      when: {
        label: "Silver"
        sql: ${count} > 500;;
      }
      when: {
        label: "Bronze"
        sql: ${count} > 100;;
      }
    }
  }


}
