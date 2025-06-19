CREATE TABLE material_types ( id SERIAL PRIMARY KEY, material_type VARCHAR(100), percent_of_loss NUMERIC(4,2) );

CREATE TABLE product_types ( id SERIAL PRIMARY KEY, product_type VARCHAR(100), koef_product_type NUMERIC(4,2) );

CREATE TABLE products( id SERIAL PRIMARY KEY, product_type_id INT REFERENCES product_types(id), product_name VARCHAR(200
), articul INTEGER, minimal_cost_for_partner NUMERIC(10,2), roll_width NUMERIC (4,2) );

CREATE TABLE materials ( id SERIAL PRIMARY KEY, material_name VARCHAR(200), material_type_id INT REFERENCES material_typ
es(id), price_per_unit_of_material NUMERIC(10,2), quantity_in_stock NUMERIC(10,2), min_quantity NUMERIC(10,2), quantity_
per_package INTEGER, unit_of_measurement VARCHAR(100) );

CREATE TABLE product_materials( product_id INT REFERENCES products(id), material_id INT REFERENCES materials(id), requir
ed_amount_of_material NUMERIC(4,2) );


-- ПУТИ ВЕЗДЕ ПОМЕНЯЙ!
\copy product_types(product_type, koef_product_type) from '/home/poooh/VOT-ONO-SORRY/csv-and-dump/product_types.csv' delimiter ',';
\copy material_types(material_type, percent_of_loss) from '/home/poooh/VOT-ONO-SORRY/csv-and-dump/material_types.
csv' delimiter ',';
\copy products (product_type_id, product_name, articul, minimal_cost_for_partner) from '/home/poooh/VOT-ONO-SORRY
/csv-and-dump/products.csv' delimiter ',';
\copy materials (
    material_name,
    material_type_id,
    price_per_unit_of_material,
    quantity_in_stock,
    min_quantity,
    quantity_per_package,
    unit_of_measurement
) from '/home/poooh/VOT-ONO-SORRY/csv-and-dump/materials.csv' delimiter ',';
\copy product_materials (product_id, material_id, required_amount_of_material) from '/home/poooh/VOT-ONO-SORRY/cs
v-and-dump/product_materials.csv' delimiter ',';
