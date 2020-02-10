  view: order_product_bridge_united {
    # If necessary, uncomment the line below to include explore_source.

# include: "tipsi.explore.view.lkml"

    derived_table: {
      explore_source: order_orderproduct_bridge {
        column: id {}
        column: order_id {}
        column: bottle_id {}
        column: price_per_bottle {}
        column: quantity {}
        column: discount_per_bottle {}
        derived_column: fulfillment_method {
          sql: null ;;
        }
        derived_column: source {
          sql: 'bridge' ;;
        }
        derived_column: order_list_price {
          sql: sum(price_per_bottle*quantity) over (partition by order_id) ;;
        }
      }
    }
    dimension: id {
      type: number
      primary_key: yes
    }
    dimension: order_id {
      type: number
    }
    dimension: bottle_id {
      type: number
    }
    dimension: price_per_bottle {
      type: number
    }
    dimension: quantity {
      type: number
    }
    dimension: discount_per_bottle {
      type: number
    }
    dimension: source {
      type: string
    }
    dimension: order_list_price {
      type: number
    }
  }
