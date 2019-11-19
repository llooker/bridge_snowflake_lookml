view: orders_drync {
   sql_table_name: marketing.public.orders ;;

  dimension: id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address_coordinates {
    type: location
    sql_latitude: ${TABLE}.address_latitude ;;
    sql_longitude: ${TABLE}.address_longitude ;;
  }

  dimension: app_id {
    type: number
    hidden: yes
    sql: ${TABLE}.app_id ;;
  }

  dimension: app_session_id {
    type: number
    hidden: yes
    sql: ${TABLE}.app_session_id ;;
  }

  dimension: buyer_notifications {
    type: yesno
    sql: ${TABLE}.buyer_notifications ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: delivery_tip {
    type: number
    sql: ${TABLE}.delivery_tip ;;
  }

  dimension: deposit {
    type: number
    sql: ${TABLE}.deposit ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount / 100 ;;
    value_format_name: usd
  }

  dimension: discount_adjustment {
    type: number
    sql: ${TABLE}.discount_adjustment ;;
  }

  dimension: driver {
    type: string
    sql: ${TABLE}.driver ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: gift {
    type: yesno
    sql: ${TABLE}.gift ;;
  }

  dimension: gift_recipient {
    type: string
    sql: ${TABLE}.gift_recipient ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: loyalty_card_number {
    type: string
    sql: ${TABLE}.loyalty_card_number ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_number {
    type: string
    link: {
      label: "Order {{order_number}} Profile"
      url: "https://www.drync.com/portal/orders/{{order_number}}"
    }
    sql: ${TABLE}.order_number ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: pickup_location_id {
    type: number
    sql: ${TABLE}.pickup_location_id ;;
    hidden:  yes
  }

  dimension: promotional_offer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.promotional_offer_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sale_price {
    type: number
    sql: ${sub_total} - ${discount} ;;
    value_format_name: usd
  }

  dimension: sales_representative {
    type: string
    sql: ${TABLE}.sales_representative ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: shipping {
    type: number
    sql: ${TABLE}.shipping ;;
  }

  dimension: shipping_adjustment {
    type: number
    sql: ${TABLE}.shipping_adjustment ;;
  }

  dimension: shopping_fulfiller_id {
    type: number
    sql: ${TABLE}.shopping_fulfiller_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_total {
    type: number
    sql: ${TABLE}.sub_total/100 ;;
    value_format_name: usd
    hidden: no
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: total_price {
    hidden: no
    value_format_name: usd
    type: number
    sql: ${TABLE}.total / 100.0 ;;
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_declined {
    type: count_distinct
    sql: CASE WHEN ${status} IN ('declined') THEN  ${id} ELSE null END ;;
  }

  measure: net_total {
    type: sum
    sql: (${sub_total} - ${discount} + ${deposit}) / 100.0;;
    value_format: "$#,##0.00"
  }

  measure: product_total {
    type: sum
    sql: ${sub_total}/100.0 ;;
    value_format: "$#,##0.00"
  }

  measure: net_product_total {
    type: sum
    sql: (${sub_total} - ${discount}) / 100.0;;
    value_format: "$#,##0.00"
  }

  measure: order_sub_total {
    type: sum
    sql: (${sub_total} - ${discount}) / 100.0 ;;
    value_format: "$#,##0.00"
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: avg_order_value  {
    type: number
    sql: ${order_total} / nullif(${count},0) ;;
    value_format: "$#,##0.00"
  }

  measure: spend_per_user  {
    type: number
    sql: (${order_total} - ${discount})/nullif(${distinct_buyers},0);;
    value_format: "$#,##0.00"
  }

  measure: counts_distinct_app {
    type: count_distinct
    sql_distinct_key: ${app_id} ;;
    sql: ${app_id} ;;
  }

  measure: distinct_buyers {
    type: count_distinct
    sql_distinct_key: ${TABLE}.user_id ;;
    sql: ${TABLE}.user_id ;;
  }

  measure: last_order  {
    type: date
    sql: MAX(${created_date}) ;;
  }

  measure: first_order  {
    type: date
    sql: MIN(${created_date}) ;;
  }

  measure: order_total {
    type: sum
    sql: ${total_price}  ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_tax {
    type: sum
    sql: (${tax}) / 100.0 ;;
    value_format: "$#,##0.00"
  }

  measure: total_delivery_tip {
    type: sum
    sql: ${TABLE}.delivery_tip/100.0 ;;
    value_format: "$#,##0.00"
  }

  measure: total_shipping {
    type: sum
    sql: (${shipping} + ${shipping_adjustment}) / 100.0  ;;
    value_format: "$#,##0.00"
  }

  measure: total_discount {
    type: sum
    sql: (${discount}+ ${discount_adjustment})/100.0 ;;
    value_format: "$#,##0.00"
  }

  measure: total_deposit {
    type: sum
    sql: ${deposit}/100.0 ;;
    value_format: "$#,##0.00"
  }

  # 4 ndt {
    dimension: margin_amt {
      sql: ${sale_price} ;;
      hidden: yes
      type: number
    }
  #}

  # derived_table: {
  #   explore_source: line_items {
  #     column: transaction_id { field: shipments.order_id }
  #     column: order_created_time { field: orders.created_time }
  #     column: SKU_id { field: products_drync.id }
  #     column: SKU_name { field: products_drync.name }
  #     column: brand_id { field: products_drync.brand }
  #     column: brand_name { field: products_drync.brand }
  #     column: department_id { field: products_drync.brand }
  #     column: department_name { field: products_drync.brand }
  #     column: user_id { field: orders.user_id }
  #     column: sale_amt { field: orders.sale_price }
  #     column: margin_amt { field: orders.sale_price }
  #   }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      order_number,
      total_price,
      name,
      email,
      promotional_offers.code,
      promotional_offers.name
    ]
  }
}
