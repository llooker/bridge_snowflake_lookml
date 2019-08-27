view: organizations {
  sql_table_name: select * from production.production.organizations limit 10;;

  dimension: id {
    primary_key: yes #https://dryncapp.looker.com/sql/qhbyy3ysgvznmq
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: customer_contact_email {
    type: string
    sql: ${TABLE}."CUSTOMER_CONTACT_EMAIL" ;;
  }

  dimension: loyalty_card_enabled {
    type: string
    sql: ${TABLE}."LOYALTY_CARD_ENABLED" ;;
  }

  dimension: loyalty_card_name {
    type: string
    sql: ${TABLE}."LOYALTY_CARD_NAME" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  measure: distinct_retailers {
    description: "Count of distinct retailer brands"
    type: count_distinct
    sql: ${name} ;;
  }

  dimension: shipping_cost_base {
    type: number
    sql: ${TABLE}."SHIPPING_COST_BASE" ;;
  }

  dimension: shipping_cost_per_item {
    type: number
    sql: ${TABLE}."SHIPPING_COST_PER_ITEM" ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}."SHORT_NAME" ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  dimension: use_chartio {
    type: string
    sql: ${TABLE}."USE_CHARTIO" ;;
  }

  dimension: use_drync_description {
    type: string
    sql: ${TABLE}."USE_DRYNC_DESCRIPTION" ;;
  }

  dimension: use_drync_image {
    type: string
    sql: ${TABLE}."USE_DRYNC_IMAGE" ;;
  }

  dimension: use_drync_review {
    type: string
    sql: ${TABLE}."USE_DRYNC_REVIEW" ;;
  }

  dimension: use_my_description {
    type: string
    sql: ${TABLE}."USE_MY_DESCRIPTION" ;;
  }

  dimension: use_my_image {
    type: string
    sql: ${TABLE}."USE_MY_IMAGE" ;;
  }

  dimension: use_my_review {
    type: string
    sql: ${TABLE}."USE_MY_REVIEW" ;;
  }

  dimension_group: _sdc_batched_at {
    type: time
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted_at {
    type: time
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received_at {
    type: time
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  set: detail {
    fields: [
      created_at_time,
      customer_contact_email,
      id,
      loyalty_card_enabled,
      loyalty_card_name,
      name,
      shipping_cost_base,
      shipping_cost_per_item,
      short_name,
      updated_at_time,
      use_chartio,
      use_drync_description,
      use_drync_image,
      use_drync_review,
      use_my_description,
      use_my_image,
      use_my_review,
      _sdc_batched_at_time,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_sequence,
      _sdc_table_version
    ]
  }
}
