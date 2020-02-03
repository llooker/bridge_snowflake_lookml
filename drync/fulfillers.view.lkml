view: fulfillers {
  sql_table_name: production.production.fulfillers ;;

  dimension: id {
    primary_key: yes #https://dryncapp.looker.com/sql/h5xcfb9jrhfsbw
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  measure: count {
    description: "Count of distinct retail locations"
    type: count
    drill_fields: [detail*]
  }

  dimension: allows_delivery {
    type: yesno
    sql: ${TABLE}.allows_delivery ;;
  }

  dimension: allows_pickup {
    type: yesno
    sql: ${TABLE}.allows_pickup ;;
  }

  dimension: allows_shipping {
    type: yesno
    sql: ${TABLE}.allows_shipping ;;
  }

  dimension: allows_special_order {
    type: yesno
    sql: ${TABLE}.allows_special_order ;;
  }

  dimension: allows_tipping {
    type: yesno
    sql: ${TABLE}.allows_tipping ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: delivery_provider_type {
    type: string
    sql: ${TABLE}.delivery_provider_type ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: order_notification_phone {
    type: string
    sql: ${TABLE}.order_notification_phone ;;
  }

  dimension: order_prep_minutes {
    type: number
    sql: ${TABLE}.order_prep_minutes ;;
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: name {
    type: string
    sql:  CASE WHEN '{{ _user_attributes['organization']  }}' = 'joes' THEN 'Store ' || (${TABLE}.id + 123) ELSE ${TABLE}.shipping_company END ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.shipping_phone ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.shipping_state ;;
    map_layer_name: us_states
  }

  dimension: street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: zip {
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.shipping_zip ;;
  }

  dimension: short_name {
    type: string
    sql:  CASE WHEN '{{ _user_attributes['organization']  }}' = 'joes' THEN 'Store ' || (${TABLE}.id + 123) ELSE ${TABLE}.short_name END ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: active_fulfillers {
    type: sum
    sql: CASE WHEN ${status} = 'active' THEN 1 ELSE 0 END ;;
  }

  measure: distinct_fulfillers {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [short_name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      short_name,
      name,
      organizations.loyalty_card_name,
      organizations.id,
      organizations.name,
      organizations.short_name,
      cart_entries.count,
      curation_requests.count,
      delivery_charge_rules.count,
      discount_rule_fulfillers.count,
      fulfiller_offer_associations.count,
      fulfiller_retailers.count,
      invoices.count,
      manual_feeds.count,
      promotional_offers.count,
      search_requests.count,
      shipments.count,
      store_holiday_hours.count,
      store_hours_rules.count,
      user_fulfiller_follows.count,
      wine_list_fulfillers.count,
      wine_price_records.count
    ]
  }
}

#More fields, many duplicates from above.   The above fields were all that was represented in the original Drync fulfillers view, so using those instead of this larger list.
#
#   dimension: allows_delivery {
#     type: string
#     sql: ${TABLE}."ALLOWS_DELIVERY" ;;
#   }
#
#   dimension: allows_pickup {
#     type: string
#     sql: ${TABLE}."ALLOWS_PICKUP" ;;
#   }
#
#   dimension: allows_shipping {
#     type: string
#     sql: ${TABLE}."ALLOWS_SHIPPING" ;;
#   }
#
#   dimension: allows_special_order {
#     type: string
#     sql: ${TABLE}."ALLOWS_SPECIAL_ORDER" ;;
#   }
#
#   dimension: allows_tipping {
#     type: string
#     sql: ${TABLE}."ALLOWS_TIPPING" ;;
#   }
#
#   dimension: configuration {
#     type: string
#     sql: ${TABLE}."CONFIGURATION" ;;
#   }
#
#   dimension: contact_email {
#     type: string
#     sql: ${TABLE}."CONTACT_EMAIL" ;;
#   }
#
#   dimension_group: created_at {
#     type: time
#     sql: ${TABLE}."CREATED_AT" ;;
#   }
#
#   dimension: credit_card_fee_base {
#     type: number
#     sql: ${TABLE}."CREDIT_CARD_FEE_BASE" ;;
#   }
#
#   dimension: credit_card_fee_percent {
#     type: number
#     sql: ${TABLE}."CREDIT_CARD_FEE_PERCENT" ;;
#   }
#
#   dimension: default_delivery_tip_percentage {
#     type: number
#     sql: ${TABLE}."DEFAULT_DELIVERY_TIP_PERCENTAGE" ;;
#   }
#
#   dimension: delivery_provider_type {
#     type: string
#     sql: ${TABLE}."DELIVERY_PROVIDER_TYPE" ;;
#   }
#
#   dimension: deliv_api_key {
#     type: string
#     sql: ${TABLE}."DELIV_API_KEY" ;;
#   }
#
#   dimension: deliv_store_id {
#     type: string
#     sql: ${TABLE}."DELIV_STORE_ID" ;;
#   }
#
#   dimension: description {
#     type: string
#     sql: ${TABLE}."DESCRIPTION" ;;
#   }
#
#   dimension: disable_fallback_shipment {
#     type: string
#     sql: ${TABLE}."DISABLE_FALLBACK_SHIPMENT" ;;
#   }
#
#   dimension: display_photo_content_type {
#     type: string
#     sql: ${TABLE}."DISPLAY_PHOTO_CONTENT_TYPE" ;;
#   }
#
#   dimension: display_photo_file_name {
#     type: string
#     sql: ${TABLE}."DISPLAY_PHOTO_FILE_NAME" ;;
#   }
#
#   dimension: display_photo_file_size {
#     type: number
#     sql: ${TABLE}."DISPLAY_PHOTO_FILE_SIZE" ;;
#   }
#
#   dimension_group: display_photo_updated_at {
#     type: time
#     sql: ${TABLE}."DISPLAY_PHOTO_UPDATED_AT" ;;
#   }
#
#   dimension: fedex_account_number {
#     type: string
#     sql: ${TABLE}."FEDEX_ACCOUNT_NUMBER" ;;
#   }
#
#   dimension: fedex_key {
#     type: string
#     sql: ${TABLE}."FEDEX_KEY" ;;
#   }
#
#   dimension: fedex_meter {
#     type: string
#     sql: ${TABLE}."FEDEX_METER" ;;
#   }
#
#   dimension: fedex_password {
#     type: string
#     sql: ${TABLE}."FEDEX_PASSWORD" ;;
#   }
#
#   dimension: invoice_fine_print {
#     type: string
#     sql: ${TABLE}."INVOICE_FINE_PRINT" ;;
#   }
#
#   dimension: kiosk_blurb {
#     type: string
#     sql: ${TABLE}."KIOSK_BLURB" ;;
#   }
#
#   dimension: kiosk_headline {
#     type: string
#     sql: ${TABLE}."KIOSK_HEADLINE" ;;
#   }
#
#   dimension: label_stock_type {
#     type: string
#     sql: ${TABLE}."LABEL_STOCK_TYPE" ;;
#   }
#
#   dimension: latitude {
#     type: number
#     sql: ${TABLE}.latitude ;;
#   }
#
#   dimension: location_type {
#     type: string
#     sql: ${TABLE}."LOCATION_TYPE" ;;
#   }
#
#   dimension: lock_version {
#     type: number
#     sql: ${TABLE}."LOCK_VERSION" ;;
#   }
#
#   dimension: logo_content_type {
#     type: string
#     sql: ${TABLE}."LOGO_CONTENT_TYPE" ;;
#   }
#
#   dimension: logo_file_name {
#     type: string
#     sql: ${TABLE}."LOGO_FILE_NAME" ;;
#   }
#
#   dimension: logo_file_size {
#     type: number
#     sql: ${TABLE}."LOGO_FILE_SIZE" ;;
#   }
#
#   dimension_group: logo_updated_at {
#     type: time
#     sql: ${TABLE}."LOGO_UPDATED_AT" ;;
#   }
#
#   dimension: longitude {
#     type: number
#     sql: ${TABLE}.longitude ;;
#   }
#
#   dimension: loyalty_program_participant {
#     type: string
#     sql: ${TABLE}."LOYALTY_PROGRAM_PARTICIPANT" ;;
#   }
#
#   dimension: marketing_fee_percent {
#     type: number
#     sql: ${TABLE}."MARKETING_FEE_PERCENT" ;;
#   }
#
#   dimension: merchant_account {
#     type: string
#     sql: ${TABLE}."MERCHANT_ACCOUNT" ;;
#   }
#
#   dimension: network_participant {
#     type: string
#     sql: ${TABLE}."NETWORK_PARTICIPANT" ;;
#   }
#
#   dimension: on_call_delivery_text {
#     type: string
#     sql: ${TABLE}."ON_CALL_DELIVERY_TEXT" ;;
#   }
#
#   dimension: order_notification_phone {
#     type: string
#     sql: ${TABLE}."ORDER_NOTIFICATION_PHONE" ;;
#   }
#
#   dimension: order_prep_minutes {
#     type: number
#     sql: ${TABLE}."ORDER_PREP_MINUTES" ;;
#   }
#
#   dimension: organization_id {
#     type: number
#     sql: ${TABLE}."ORGANIZATION_ID" ;;
#   }
#
#   dimension: payment_gateway_id {
#     type: number
#     sql: ${TABLE}."PAYMENT_GATEWAY_ID" ;;
#   }
#
#   dimension: preference {
#     type: number
#     sql: ${TABLE}."PREFERENCE" ;;
#   }
#
#   dimension: preferred_shipping_calculator {
#     type: string
#     sql: ${TABLE}."PREFERRED_SHIPPING_CALCULATOR" ;;
#   }
#
#   dimension: promotional_text {
#     type: string
#     sql: ${TABLE}."PROMOTIONAL_TEXT" ;;
#   }
#
#   dimension: requires_deposits {
#     type: string
#     sql: ${TABLE}."REQUIRES_DEPOSITS" ;;
#   }
#
#   dimension: restricts_case_only {
#     type: string
#     sql: ${TABLE}."RESTRICTS_CASE_ONLY" ;;
#   }
#
#   dimension: shipping_city {
#     type: string
#     sql: ${TABLE}."SHIPPING_CITY" ;;
#   }
#
#   dimension: shipping_company {
#     type: string
#     sql: ${TABLE}."SHIPPING_COMPANY" ;;
#   }
#
#   dimension: shipping_cost_calculator_id {
#     type: number
#     sql: ${TABLE}."SHIPPING_COST_CALCULATOR_ID" ;;
#   }
#
#   dimension: shipping_name {
#     type: string
#     sql: ${TABLE}."SHIPPING_NAME" ;;
#   }
#
#   dimension: shipping_phone {
#     type: string
#     sql: ${TABLE}."SHIPPING_PHONE" ;;
#   }
#
#   dimension: shipping_state {
#     type: string
#     sql: ${TABLE}."SHIPPING_STATE" ;;
#   }
#
#   measure: count_states {
#     description: "Count of distinct shipping states"
#     type:  count_distinct
#     sql: ${shipping_state} ;;
#   }
#
#   dimension: shipping_street {
#     type: string
#     sql: ${TABLE}."SHIPPING_STREET" ;;
#   }
#
#   dimension: shipping_zip {
#     type: string
#     sql: ${TABLE}."SHIPPING_ZIP" ;;
#   }
#
#   dimension: short_name {
#     type: string
#     sql: ${TABLE}."SHORT_NAME" ;;
#   }
#
#   dimension: states {
#     type: string
#     sql: ${TABLE}."STATES" ;;
#   }
#
#   dimension: status {
#     type: string
#     sql: ${TABLE}."STATUS" ;;
#   }
#
#   dimension: submerchant_account {
#     type: string
#     sql: ${TABLE}."SUBMERCHANT_ACCOUNT" ;;
#   }
#
#   dimension: submerchant_account_status {
#     type: string
#     sql: ${TABLE}."SUBMERCHANT_ACCOUNT_STATUS" ;;
#   }
#
#   dimension: tagline {
#     type: string
#     sql: ${TABLE}."TAGLINE" ;;
#   }
#
#   dimension: tax_rates {
#     type: string
#     sql: ${TABLE}."TAX_RATES" ;;
#   }
#
#   dimension_group: updated_at {
#     type: time
#     sql: ${TABLE}."UPDATED_AT" ;;
#   }
#
#   dimension: zip_tax_rates {
#     type: string
#     sql: ${TABLE}."ZIP_TAX_RATES" ;;
#   }
#
#   dimension_group: _sdc_batched_at {
#     type: time
#     sql: ${TABLE}."_SDC_BATCHED_AT" ;;
#   }
#
#   dimension_group: _sdc_extracted_at {
#     type: time
#     sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
#   }
#
#   dimension_group: _sdc_received_at {
#     type: time
#     sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
#   }
#
#   dimension: _sdc_sequence {
#     type: number
#     sql: ${TABLE}."_SDC_SEQUENCE" ;;
#   }
#
#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
#   }
#
#   dimension: location {
#     type: location
#     sql_latitude: ${latitude} ;;
#     sql_longitude: ${longitude} ;;
#   }
#
#   set: detail {
#     fields: [
#       allows_delivery,
#       allows_pickup,
#       allows_shipping,
#       allows_special_order,
#       allows_tipping,
#       configuration,
#       contact_email,
#       created_at_time,
#       credit_card_fee_base,
#       credit_card_fee_percent,
#       default_delivery_tip_percentage,
#       delivery_provider_type,
#       deliv_api_key,
#       deliv_store_id,
#       description,
#       disable_fallback_shipment,
#       display_photo_content_type,
#       display_photo_file_name,
#       display_photo_file_size,
#       display_photo_updated_at_time,
#       fedex_account_number,
#       fedex_key,
#       fedex_meter,
#       fedex_password,
#       id,
#       invoice_fine_print,
#       kiosk_blurb,
#       kiosk_headline,
#       label_stock_type,
#       latitude,
#       location_type,
#       lock_version,
#       logo_content_type,
#       logo_file_name,
#       logo_file_size,
#       logo_updated_at_time,
#       longitude,
#       loyalty_program_participant,
#       marketing_fee_percent,
#       merchant_account,
#       network_participant,
#       on_call_delivery_text,
#       order_notification_phone,
#       order_prep_minutes,
#       organization_id,
#       payment_gateway_id,
#       preference,
#       preferred_shipping_calculator,
#       promotional_text,
#       requires_deposits,
#       restricts_case_only,
#       shipping_city,
#       shipping_company,
#       shipping_cost_calculator_id,
#       shipping_name,
#       shipping_phone,
#       shipping_state,
#       shipping_street,
#       shipping_zip,
#       short_name,
#       states,
#       status,
#       submerchant_account,
#       submerchant_account_status,
#       tagline,
#       tax_rates,
#       updated_at_time,
#       zip_tax_rates,
#       _sdc_batched_at_time,
#       _sdc_extracted_at_time,
#       _sdc_received_at_time,
#       _sdc_sequence,
#       _sdc_table_version,
#       location
#     ]
#   }
# }
