import requests
import logging
import json


def retrieve_products_json(url):
    if not url:
        logging.error(f"No URl was set")
        return False
    try:
        return requests.get(url).json()
    except:
        logging.error(
            f"Failed to retrieve products json from {url}",
            exc_info=True,
        )
    return False


def filter_products_based_on_price_gtoe(products_dict, price_threshold):
    if price_threshold < 0:
        logging.error("Got negitive price thershold")
        return False
    try:
        return {
            "products": [
                product
                for product in products_dict["products"]
                if product["price"] >= price_threshold
            ]
        }
    except:
        logging.error(
            f"Failed to parse products with threshold {price_threshold}", exc_info=True
        )
    return False


def save_filtered_products_to_local_file(
    filtered_prods_dict, price_threshold, filename="products"
):
    filename = f"{filename}_gtoe_{price_threshold}.json"
    with open(filename, "w") as products_json:
        json.dump(filtered_prods_dict, products_json)
    return filename
