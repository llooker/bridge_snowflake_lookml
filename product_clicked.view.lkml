view: product_clicked {
  derived_table: {
    sql:
      select c.id, c.product_id, c.user_id, c.timestamp, c.context_os_name, c.price, c.context_traits_fulfiller_id
      from segment_events.ios.product_clicked c
      inner join production.production.users u ON u.id = c.user_id::int
      where u.company_friend = false

      union

      select c.id, c.product_id, c.user_id, c.timestamp, c.context_os_name, c.price, c.context_traits_fulfiller_id
      from segment_events.android.product_clicked c
      inner join production.production.users u ON u.id = c.user_id::int
      where u.company_friend = false;;
  }

  dimension: id {
    type: string
    primary_key: yes
  }

  dimension: product_id {
    description: "Unique Product ID"
    type: number
    sql:  ${TABLE}.product_id::int ;;
  }

  dimension: user_id {
    description: "Unique User ID"
    type: number
    sql:  ${TABLE}.user_id::int ;;
  }

  dimension: retailer_id {
    description: "ID of the retail location"
    type: string
    sql: ${TABLE}.context_traits_fulfiller_id ;;
  }

  dimension: timestamp {
    description: "Time of the event"
    type: date_time
    sql:  ${TABLE}.timestamp ;;
  }

  dimension: platform {
    description: "User's device platform"
    type:  string
    sql:  ${TABLE}.context_os_name ;;
  }

  dimension: price {
    description: "Price shown to the user"
    type:  number
    sql:  ${TABLE}.price ;;
  }

  dimension_group: occurrence {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: unique_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${TABLE}.user_id ;;
    drill_fields: [products.brand, products.name, products.category, products.subcategory]
  }

  measure: count {
    type: count
  }
}
