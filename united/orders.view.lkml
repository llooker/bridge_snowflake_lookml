include: "../drync/drync_united/orders.view.lkml"
include: "../tipsi/tipsi_united/orders.view.lkml"




view: orders_united {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:  SELECT * FROM ${orders_drync_united.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${orders_tipsi_united.SQL_TABLE_NAME}
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
    label: "Order Created"
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
  filter: date_range_filter {
#     hidden: yes
    type: date
  }
  dimension_group: until_end_of_date_range_filter {
    description: "Do not use this with anything besides timeframe week"
    type: duration
    timeframes: [week]
    sql_start: ${created_week}  ;; #do not use this with anything besides timeframe week
    sql_end: {% date_end date_range_filter %} ;;

  }
  dimension: date_end_of_range_back_12_weeks {
    type: yesno
    sql: ${weeks_until_end_of_date_range_filter}>0 and ${weeks_until_end_of_date_range_filter}<=12 ;;
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
  dimension: subtotal {
    type:number
    hidden:yes
  }
  dimension: deposit {
    type:number
    hidden:yes
  }
  dimension: tax {
    type:number
    hidden:yes
  }
  dimension: discount {
    type:number
    hidden:yes
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
