view: products_tipsi {
  derived_table: {
      sql: select r.id, w.id as product_id, w.name as name, r.in_stock as quantity, r.unit_size as size, 4 as category, v.name as style, brand.name as brand
           from tipsi.public.retail_retailinventory r
           inner join tipsi.public.api_winetbl w on w.id = r.wine_id
           inner join tipsi.public.api_varietal v on v.id = w.varietal_id
           inner join tipsi.public.api_winery brand on brand.id = w.winery_id

          union

          select r.id, d.id as product_id, d.name as name, r.in_stock as quantity, r.unit_size as size, d.drink_type as category, t.name as style, p.name as brand
          from tipsi.public.retail_retailinventory r
          inner join tipsi.public.vendor_drink d on d.id = r.drink_id
          inner join tipsi.public.vendor_drinkproducer p on p.id = d.producer_id
          inner join tipsi.public.vendor_drinktag t on t.id = d.tag_id;;
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
    sql: ${TABLE}.quantity::string || ' ' || ${TABLE}.size;;
  }

  dimension: size {
    type: string
    sql:  ${TABLE}.size ;;
  }

#   dimension: size_oz {
#     type: number
#     sql: CASE
#           WHEN regexp_instr(size, '(oz|o)') > 0 THEN CAST(REGEXP_REPLACE(size, '(oz|o)') AS FLOAT)
#           WHEN CHARINDEX('ml', size) > 0 THEN CAST(REPLACE(size, 'ml') AS FLOAT)/29.574
#           WHEN CHARINDEX('gal', size) > 0 THEN CAST(REPLACE(size, 'gal') AS FLOAT) * 128
#           WHEN regexp_instr(size, '(l|L|liter)') > 0 THEN CAST(REGEXP_REPLACE(size, '(l|L|liter)') AS FLOAT) * 33.814
#           ELSE 1 END;;
#   }

  dimension: category {
    type:  string
    sql:
      case when ${TABLE}.category = 1 then 'Beer'
      when ${TABLE}.category = 2 then 'Spirit'
      when ${TABLE}.category = 4 then 'Wine'
      else 'Other'
      end;;
  }

  dimension: subcategory {
    type:  string
    sql:  ${TABLE}.style ;;
  }
}
