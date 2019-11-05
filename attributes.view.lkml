view: attributes {
  sql_table_name: marketing.public.attributes ;;

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: throtle_id {
    type: number
    sql: ${TABLE}.throtle_id::int ;;
  }

  dimension: birth_year {
    type: date_year
    sql: LEFT(${TABLE}.dob, 4)::int ;;
  }

  dimension: birth_month {
    type: number
    sql: RIGHT(${TABLE}.dob, 2)::int ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: homeowner {
    type: string
    sql: ${TABLE}.home_owner ;;
  }

  dimension: income {
    type: string
    sql: ${TABLE}.income ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: sports {
    type: string
    sql: ${TABLE}.sports ;;
  }

  dimension: travel {
    type: string
    sql: ${TABLE}.travel ;;
  }

  dimension: valuehunter {
    type: string
    sql: ${TABLE}.valuehunter ;;
  }
}
