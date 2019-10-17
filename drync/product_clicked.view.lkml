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

  dimension_group: event {
    description: "Time of the event"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      time_of_day,
      day_of_week
    ]
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
    sql:  REPLACE(${TABLE}.price, ',')::float;;
    value_format_name: usd
  }

  dimension: price_per_ounce {
    type: number
    sql: ${price}/${products.size_oz} ;;
    value_format_name: usd
  }

  dimension: price_range {
    type: tier
    tiers: [
      15, 20, 30, 50, 100
    ]
    style: relational
    sql: ${price} ;;
    value_format_name: usd
  }

  dimension: price_tier {
    type:  string
    case: {
      when: {
        label: "Luxury"
        sql: (${products.category} = 'Wine' AND ${price} >= 50)
        OR (${products.category} in ('Beer', 'Other') AND ${price} >= 20)
        OR (${products.category} = 'Spirit' AND ${price} >= 100);;
      }
      when: {
        label: "Mid Range"
        sql: (${products.category} = 'Wine' AND ${price} >= 20 AND ${price} < 50)
                  OR (${products.category} in ('Beer', 'Other') AND ${price} >= 10 AND ${price} < 20)
                  OR (${products.category} = 'Spirit' AND ${price} >= 50 and ${price} < 100);;
      }
      when: {
        label: "Value"
        sql: (${products.category} = 'Wine' AND ${price} < 20)
                  OR (${products.category} in ('Beer', 'Other') AND ${price} < 10)
                  OR (${products.category} = 'Spirit' AND ${price} < 50);;
      }
      else: "Undefined"
    }
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
    drill_fields: [products.brand, products.name, products.category, products.subcategory, price, price_tier, id, price_range]
  }
}
