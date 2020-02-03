view: payments_drync {
    sql_table_name: production.production.payments ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: braintree_device_data {
      type: string
      sql: ${TABLE}.braintree_device_data ;;
    }

    dimension: braintree_gateway_rejection_reason {
      type: string
      sql: ${TABLE}.braintree_gateway_rejection_reason ;;
    }

    dimension: braintree_nonce {
      type: string
      sql: ${TABLE}.braintree_nonce ;;
    }

    dimension: braintree_payment_token {
      type: string
      sql: ${TABLE}.braintree_payment_token ;;
    }

    dimension: braintree_processor_response_text {
      type: string
      sql: ${TABLE}.braintree_processor_response_text ;;
    }

    dimension: card_type {
      type: string
      sql: ${TABLE}.card_type ;;
    }

    dimension: card_uuid {
      type: string
      sql: ${TABLE}.card_uuid ;;
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
      sql: ${TABLE}.created_at ;;
    }

    dimension: credit_card_cvv {
      type: string
      sql: ${TABLE}.credit_card_cvv ;;
    }

    dimension: credit_card_expiration_month {
      type: string
      sql: ${TABLE}.credit_card_expiration_month ;;
    }

    dimension: credit_card_expiration_year {
      type: string
      sql: ${TABLE}.credit_card_expiration_year ;;
    }

    dimension: credit_card_number {
      type: string
      sql: ${TABLE}.credit_card_number ;;
    }

    dimension: credit_card_source {
      type: string
      sql: ${TABLE}.credit_card_source ;;
    }

    dimension: error_messages {
      type: string
      sql: ${TABLE}.error_messages ;;
    }

    dimension: last_4_digit {
      type: string
      sql: ${TABLE}.last_4_digit ;;
    }

    dimension: order_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.order_id ;;
    }

    dimension: payment_gateway_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.payment_gateway_id ;;
    }

    dimension: save_card {
      type: yesno
      sql: ${TABLE}.save_card ;;
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
      sql: ${TABLE}.status_changed_at ;;
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
      sql: ${TABLE}.submitted_for_settlement_at ;;
    }

    dimension: total_amount {
      type: number
      sql: ${TABLE}.total_amount ;;
    }

    dimension: transaction_id {
      type: string
      sql: ${TABLE}.transaction_id ;;
    }

    dimension: transaction_status {
      type: string
      sql: ${TABLE}.transaction_status ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
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

    dimension: using_merchant_gateway {
      type: yesno
      sql: ${TABLE}.using_merchant_gateway ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        id,
        payment_gateways.name,
        payment_gateways.id,
        orders.id,
        orders.name,
        fraudulent_credit_cards.count
      ]
    }
  }
