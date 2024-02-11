import retrieve_and_parse_date
import upload_to_s3
import os

price_threshold = 100
product_url = "https://dummyjson.com/products"


def main():
    raw_prods_dict = retrieve_and_parse_date.retrieve_products_json(product_url)
    filtered_prods_dict = retrieve_and_parse_date.filter_products_based_on_price_gtoe(
        raw_prods_dict, price_threshold
    )
    filename = retrieve_and_parse_date.save_filtered_products_to_local_file(
        filtered_prods_dict, price_threshold
    )
    upload_to_s3.upload_to_s3(os.getenv("BUCKET"), filename)
    if retrieve_and_parse_date.retrieve_products_json(
        f'{os.getenv("CF_URL")}/{filename}'
    ):
        print(True)
    else:
        print(False)


if __name__ == "__main__":
    main()
