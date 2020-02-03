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


  dimension_group: created {
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
  sql: ${TABLE}.created_time ;;
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
  dimension: status {
    type: string
  }
#   dimension: discount {}
  dimension: total_price_raw {
    label: "Total Price"
    type: number
    hidden: yes
    sql: ${TABLE}.total_price ;;
  }

  dimension: actual_order_price {
    type: number
    value_format_name: usd
  }
  dimension: payment_method {
    sql: case when ${TABLE}.payment_method = 'android_pay' then 'Google Pay'
    when ${TABLE}.payment_method = 'apple_pay' then 'Apple Pay'
    when ${TABLE}.payment_method = 'card_io' then 'Card IO'
    when ${TABLE}.payment_method = 'google_instant_buy' then 'Google Instant Buy'
    when ${TABLE}.payment_method = 'stored' then 'Stored'
    when ${TABLE}.payment_method = 'typed' then 'Typed'
    else ${TABLE}.payment_method end;;
  }
  measure: total_price {
    description: "DO NOT USE!  This breaks as soon as the query is grouped by line item or product"
    hidden: yes
    value_format_name: usd
    type: sum
    sql: ${total_price_raw} ;;
    drill_fields: [id, created_time,source, source_user_id, source_id, total_price_raw]

  }
  measure: count {
    type: count
    drill_fields: [id, created_time,source, source_user_id, source_id]
  }

  measure: first_order  {
    type: date
    sql: MIN(${created_time}) ;;
  }

  measure: last_order  {
    type: date
    sql: MAX(${created_time}) ;;
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
