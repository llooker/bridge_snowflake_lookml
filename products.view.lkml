view: products {
  derived_table: {
    sql: select b.id, w.id as product_id, w.name as name, p.quantity as quantity, p.size as size, p.type as type, s.style_type as category, s.name as style, br.name as brand
         from production.production.bottles b
         inner join production.production.wines w on w.id = b.wine_id
         inner join production.production.packagings p on p.id = b.packaging_id
         inner join production.production.wineries br on br.id = w.winery_id
         inner join production.production.wine_styles s on w.wine_style_id = s.id
         ;;
  }

  set: detail {
    fields: [id, name, brand, category, subcategory]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: brand {
    type: string
    sql:${TABLE}.brand ;;
    link: {
      label: "brand"
      url: "?Brand={{value}}"
    }
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: variant {
    type: string
    sql: ${TABLE}.quantity::string || ' ' || ${TABLE}.size || ' ' || ${TABLE}.type ;;
  }

  dimension: category {
    type:  string
    sql:
      case when ${TABLE}.category = 'beer' then 'Beer'
      when ${TABLE}.category = 'wine' then 'Wine'
      when ${TABLE}.category = 'spirits' then 'Spirit'
      else 'Other'
      end;;
  }

  dimension: subcategory {
    type:  string
    sql:  ${TABLE}.style ;;
  }
}
