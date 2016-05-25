# README

1. Using ruby-2.2.3
2. Fire up postgres server 
   then do 
   > createdb development_upc
3. > rake db:migrate
   > rake db:seed
4. You can enter a single UPC code or a list of UPC codes separated by a space
5. For testing you can use these valid UPCs: 3661112054465 3564700309575 3380330002354
6. Run Rspec testing
   > rspec 
7. Coverage test result is in coverage/index.html.

# NOTES
1. Using API: http://world.openfoodfacts.org/api/v0/product/upc_code.json
   Enhance app by adding APIs from other sites
2. This app doesn't store pictures of products but stores link to the pictures
   The premise is manufacturers may update the pictures.
3. Pagination is not included
4. brakeman shows no errors
+-------------------+-------+
| Scanned/Reported  | Total |
+-------------------+-------+
| Controllers       | 2     |
| Models            | 3     |
| Templates         | 6     |
| Errors            | 0     |
| Security Warnings | 0 (0) |
+-------------------+-------+


