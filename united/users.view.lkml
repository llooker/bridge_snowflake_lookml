include: "../drync/drync_united/users.view.lkml"
include: "../tipsi/tipsi_united/users.view.lkml"




view: users {
  extends: [users_fields]
  derived_table: {
    sql:  SELECT * FROM ${users_drync_united.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${users_tipsi_united.SQL_TABLE_NAME}
      ;;
  }
}

view: users_fields {
  extension: required
  dimension: id {
    type: number
  }
  dimension: source_id {
    type: string
    primary_key: yes #https://dryncapp.looker.com/explore/bridge/users?qid=jGuxnamUWNKWSfJbr767Hs
    hidden: no
    sql: ${source} || ${id} ;;
  }
  dimension: email {}
  dimension: first_name {}
  dimension: last_name {}
  dimension: birth_year {
    type: number
  }
  dimension: source {
    type: string
  }
  dimension: gender {}
  dimension: age {}
  dimension: state {}
  dimension: us_states {
    type: string
    map_layer_name: us_states
    sql: CASE
    WHEN ${country} = 'US' THEN ${state}
    ELSE NULL END ;;
  }
  dimension: zipcode {}
  dimension: country {
    type: string
    map_layer_name: countries
  }
  dimension: age_tiers {
    type: tier
    sql: ${age} ;;
    tiers: [18, 30, 45, 70 ]
    style: integer
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_percent {
    type: percent_of_total
    sql: ${count} ;;
  }

  set: detail {
    fields: [source, id, email, birth_year, first_name, last_name, age]
  }
}
