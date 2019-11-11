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

  dimension: source_id {
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }

  dimension: created {
    hidden: yes
  }

  dimension_group: created_date {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
  sql: ${created} ;;
  }
  dimension: gift_recipient {
    type: string
  }
  dimension: source {
    type: string
  }
#   dimension: quantity {
#     type: number
#   }
  dimension: store_id {}
  dimension: user_id {}

  dimension: source_user_id {
    type: string
    sql: ${source} || ${user_id} ;;
  }
#   dimension: discount {}
#   dimension: total_price {}

  measure: count {
    type: count
  }

  measure: first_order  {
    type: date
    sql: MIN(${created}) ;;
  }

  measure: last_order  {
    type: date
    sql: MAX(${created}) ;;
  }

  measure: distinct_buyers {
    type: count_distinct
    sql: ${user_id} ;;
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
