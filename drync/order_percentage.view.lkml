view: order_percentage {
  derived_table: {
    sql: SELECT id as order_id, created_at, total, LAG((total/100)) OVER(order by created_at asc) as prev_val FROM marketing.public.orders WHERE total > 0 ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: created_at {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total/100 ;;
    value_format_name: usd
  }

  dimension: prev_val {
    type: number
    sql: ${TABLE}.prev_val ;;
    value_format_name: usd
  }

  dimension: percent_of_previous {
    type: number
    sql: ${total}/nullif(${prev_val},0) ;;
    value_format_name: percent_0
  }

}
