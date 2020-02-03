view: payments {
  sql_table_name: "PRODUCTION"."PAYMENTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received {
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

  dimension: braintree_device_data {
    type: string
    sql: ${TABLE}."BRAINTREE_DEVICE_DATA" ;;
  }

  dimension: braintree_gateway_rejection_reason {
    type: string
    sql: ${TABLE}."BRAINTREE_GATEWAY_REJECTION_REASON" ;;
  }

  dimension: braintree_nonce {
    type: string
    sql: ${TABLE}."BRAINTREE_NONCE" ;;
  }

  dimension: braintree_payment_token {
    type: string
    sql: ${TABLE}."BRAINTREE_PAYMENT_TOKEN" ;;
  }

  dimension: braintree_processor_response_text {
    type: string
    sql: ${TABLE}."BRAINTREE_PROCESSOR_RESPONSE_TEXT" ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}."CARD_TYPE" ;;
  }

  dimension: card_uuid {
    type: string
    sql: ${TABLE}."CARD_UUID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: credit_card_cvv {
    type: string
    sql: ${TABLE}."CREDIT_CARD_CVV" ;;
  }

  dimension: credit_card_expiration_month {
    type: string
    sql: ${TABLE}."CREDIT_CARD_EXPIRATION_MONTH" ;;
  }

  dimension: credit_card_expiration_year {
    type: string
    sql: ${TABLE}."CREDIT_CARD_EXPIRATION_YEAR" ;;
  }

  dimension: credit_card_number {
    type: string
    sql: ${TABLE}."CREDIT_CARD_NUMBER" ;;
  }

  dimension: credit_card_source {
    type: string
    sql: ${TABLE}."CREDIT_CARD_SOURCE" ;;
  }

  dimension: error_messages {
    type: string
    sql: ${TABLE}."ERROR_MESSAGES" ;;
  }

  dimension: last_4_digit {
    type: string
    sql: ${TABLE}."LAST_4_DIGIT" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: payment_gateway_id {
    type: number
    sql: ${TABLE}."PAYMENT_GATEWAY_ID" ;;
  }

  dimension: save_card {
    type: yesno
    sql: ${TABLE}."SAVE_CARD" ;;
  }

  dimension_group: status_changed {
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
    sql: ${TABLE}."STATUS_CHANGED_AT" ;;
  }

  dimension_group: submitted_for_settlement {
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
    sql: ${TABLE}."SUBMITTED_FOR_SETTLEMENT_AT" ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}."TOTAL_AMOUNT" ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

  dimension: transaction_status {
    type: string
    sql: ${TABLE}."TRANSACTION_STATUS" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
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
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  dimension: using_merchant_gateway {
    type: yesno
    sql: ${TABLE}."USING_MERCHANT_GATEWAY" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
