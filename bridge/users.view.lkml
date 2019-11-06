include: "../drync/drync_bridge/users.view.lkml"
include: "../tipsi/tipsi_bridge/users.view.lkml"




view: users {
  extends: [users_fields]
  derived_table: {
    sql:  SELECT * FROM ${users_drync_bridge.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${users_tipsi_bridge.SQL_TABLE_NAME}
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
